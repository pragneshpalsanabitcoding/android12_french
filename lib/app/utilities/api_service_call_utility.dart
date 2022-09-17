import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dioX;
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getX;
import 'package:get/get.dart';

import '../dialogs/progress_dialog.dart';
import '../dialogs/views/retry_dialog_view.dart';
import '../modules/welcome/controllers/welcome_controller.dart';

enum RequestType { GET, POST }

class ApiServiceCallUtility {
  static final ApiServiceCallUtility instance =
  ApiServiceCallUtility.internal();

  ApiServiceCallUtility.internal();

  factory ApiServiceCallUtility() {
    return instance;
  }

  final String interNetMessage =
      "No internet connection, please check your internet connection and try again latter.";

  Map<String, dynamic>? _tempParams;
  Map<String, dynamic>? _tempHeaders;
  String? _tempToken;
  RequestType? _tempRequestType;
  String? _tempServiceUrl;
  Function? _tempSuccess;
  Function? _tempError;
  bool? _tempIsProgressShow;

  Dio _getDio({String baseUri = ""}) {
// or new Dio with a BaseOptions instance.
    BaseOptions options = BaseOptions(
      baseUrl: baseUri,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );

    Dio dio = Dio(options);
    dio.options.headers["Content-Type"] = "application/json";
    return dio;
  }

  Future<bool> _checkInternet({BuildContext? context}) async {
    ConnectivityResult connectivityResult =
    await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  bool _handleResponse(dioX.Response response) {
    try {
      if (response.toString().isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future _showRetryDialog({
    required String title,
    required String message,
  }) async {
    await Get.dialog(
      RetryDialogView(
        title: title,
        message: message,
        retryCallback: () async {
          Get.back(result: true);
        },
      ),
    );

    await request(
        params: _tempParams,
        headers: _tempHeaders,
        token: _tempToken!,
        serviceUrl: _tempServiceUrl!,
        success: _tempSuccess!,
        error: _tempError!,
        requestType: _tempRequestType!,
        isProgressShow: _tempIsProgressShow!);
  }

  Future request(
      {Map<String, dynamic>? params,
        Map<String, dynamic>? headers,
        String token = "",
        RequestType requestType = RequestType.GET,
        required String serviceUrl,
        required Function success,
        required Function error,
        required bool isProgressShow}) async {
    _tempRequestType = requestType;
    _tempToken = token;
    _tempParams = params;
    _tempHeaders = headers;
    _tempServiceUrl = serviceUrl;
    _tempSuccess = success;
    _tempError = error;
    _tempIsProgressShow = isProgressShow;

    printRequest(params!, serviceUrl);

    if (await _checkInternet()) {
      Options options = Options(
        headers: _tempHeaders ??
            {"Content-Type": "application/json", "Authorization": _tempToken},
      );
      if (_tempIsProgressShow != null && _tempIsProgressShow!) {
        await ProgressDialogView.instance.showProgress();
      }

      try {
        dioX.Response response = (requestType == RequestType.GET)
            ? await _getDio().get(
          _tempServiceUrl!,
          queryParameters: _tempParams,
          options: options,
        )
            : await _getDio().post(
          _tempServiceUrl!,
          data: _tempParams,
          options: options,
        );

        if (_handleResponse(response)) {
          switch (response.statusCode) {
            case 200:
              await _tempSuccess!(response.toString());
              await ProgressDialogView.instance.hideProgress();
              break;
            default:
              await _tempError!(response.toString());
              await ProgressDialogView.instance.hideProgress();
              break;
          }
        } else {
          await _tempError!(response.toString());
          await ProgressDialogView.instance.hideProgress();
        }
        printLog(response);
        return response;
      } on DioError catch (dioError) {
        await ProgressDialogView.instance.hideProgress();
        await _showRetryDialog(message: dioError.message, title: "Error");
      } catch (e) {
        await ProgressDialogView.instance.hideProgress();


        await _showRetryDialog(message: e.toString(), title: "Error");
      }
    } else {
      await ProgressDialogView.instance.hideProgress();
      await _showRetryDialog(
          message: interNetMessage, title: 'Connectivity Error');
    }
  }

  Future<void> printRequest(
      Map<String, dynamic> params, String serviceUrl) async {
    print(
        "-----------------------------Request-------------------------------");
    print("GSONREQUEST $params \n");
    print("GSONREQUEST $serviceUrl \n");
    print(
        "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
  }

  Future<void> printLog(dioX.Response response) async {
    print(
        "----------------------------Response-------------------------------");
    print('Request uri : ${response.requestOptions.uri}');
    print('Request headers : ${response.requestOptions.headers}');
    print('Request param : ${response.requestOptions.data}');
    print('Response data : ${response.data}');
    print(
        "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
  }
}
