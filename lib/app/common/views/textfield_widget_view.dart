import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uk_video_call/app/constants/color_config.dart';

import '../../constants/asset_config.dart';

class TextFieldWidgetView extends StatefulWidget {
  final hintText;
  final initialValue;
  final attribute;
  final obscureText;
  final textInputAction;
  final controller;
  final validator;
  final focusNode;
  final onFieldSubmitted;
  final onSaved;
  final textAlign;
  final keyboardType;

  TextFieldWidgetView(
      {this.hintText,
      this.initialValue,
      this.attribute,
      this.obscureText,
      this.textInputAction,
      this.controller,
      this.validator,
      this.focusNode,
      this.onFieldSubmitted,
      this.onSaved,
      this.textAlign,
      this.keyboardType});

  @override
  _TextFieldWidgetViewState createState() => _TextFieldWidgetViewState();
}

class _TextFieldWidgetViewState extends State<TextFieldWidgetView> {
  bool _passwordVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 5.h),
          // height: 45,
          width: double.infinity,
          alignment: Alignment.center,
          child: TextFormField(
            controller: widget.controller,
            initialValue: widget.initialValue,
            obscureText: _passwordVisible,
            textInputAction: widget.textInputAction,
            focusNode: widget.focusNode,
            onSaved: widget.onSaved,
            textAlign: widget.textAlign ?? TextAlign.left,
            style: TextStyle(
                // color: ColorConfig.ACCENT_COLOR,
                color: ColorConfig.BLACK,
                fontSize: 17.sp,
                fontWeight: FontWeight.bold,
                letterSpacing: 1),
            cursorColor: ColorConfig.ACCENT_COLOR,
            validator: widget.validator,
            keyboardType: widget.keyboardType,
            onFieldSubmitted: widget.onFieldSubmitted,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              // border: InputBorder.none,
              fillColor: Colors.transparent,
              focusColor: ColorConfig.ACCENT_COLOR,
              hoverColor: ColorConfig.ACCENT_COLOR,
              filled: true,
              hintText: widget.hintText,
              hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1),
              contentPadding: EdgeInsets.all(8),
              isDense: true,
              suffixIcon: widget.obscureText
                  ? FlatButton(
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      child: Text(
                        _passwordVisible ? "Show" : "Hide",
                        style: TextStyle(
                            color: ColorConfig.BLACK_COLOR, fontSize: 17.sp),
                      ),
                      onPressed: () {
                        // Update the state i.e. toggle the state of passwordVisible variable
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
