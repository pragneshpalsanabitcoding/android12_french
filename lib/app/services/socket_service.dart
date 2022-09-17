import 'dart:convert';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../constants/api_config.dart';

class SocketService
{

  SocketService.internal();

  // next three lines makes this class a Singleton
  static final SocketService _instance = SocketService.internal();

  Map<String,Function>? subscription;

  static SocketService getInstance()
  {
    return _instance;
  }

  factory SocketService() {
    return _instance;
  }

  IO.Socket? socket;

  /// it will use to connect socket.
  void connect(socketBaseUrl) {

    ApiConfig.SOCKET_BASE_URI = socketBaseUrl;

    if (socket == null || socket!.disconnected)
    {
      if(socket == null) {
        // Configure socket transports must be sepecified
        socket = IO.io(socketBaseUrl, <String, dynamic>{
          'transports': ['websocket'],
          'autoConnect': false,
        });

        socketEventListener(ApiConfig.SOCKET_CONNECT);
        socketEventListener(ApiConfig.SOCKET_DISCONNECT);
        socketEventListener(ApiConfig.SOCKET_START_CALL);
        socketEventListener(ApiConfig.SOCKET_END_CALL);

      }

     socket!.connect();
    }
  }


  startCall(Map data)
  {
    sendDataToSocket(event:'start_call',data: json.encode(data));
  }

  /// it will return socket id if socket connected.
  getSocketId()
  {
    return (socket != null && socket!.connected)?socket!.id:null;
  }


  /// it will use to subscribe socket event to any aplace get event
  subscribe(String event, Function callback)
  {
    subscription ??= {};
    subscription![event] = callback;
  }


  /// send data to socket.
  sendDataToSocket({required String event, dynamic data}){
    if(socket!=null && socket!.connected && data != null)
    {
      socket!.emit(event, data);
    }
    else{
      print("Socket not connected");
    }
  }


  /// Common socket even listener.
  socketEventListener(String eventName) {
    socket!.on(eventName, (data) {
      // print("$eventName = ${data}");
      if(subscription != null && subscription![eventName] != null)
      {
        Function? subscriber = subscription![eventName];
        subscriber!(data);
      }
    });
  }


  /// it will use to disconnect socket.
  disconnect() {
    if (socket != null ) {
      socket!.disconnect();
      socket!.close();
      socket!.destroy();
    }
  }
}

