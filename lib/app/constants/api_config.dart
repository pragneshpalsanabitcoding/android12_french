class ApiConfig{

  /// Socket API will be here.
  static String SOCKET_BASE_URI = "http://35.154.22.231:5000";

  /// Socket Event
  static String SOCKET_CONNECT = "connect";
  static String SOCKET_DISCONNECT = "disconnect";
  static String SOCKET_START_CALL = "start_call";
  static String SOCKET_END_CALL = "end_call";

  /// status
  static const String SUCCESS =  "Success";
  static const String ERROR =  "Error";

  /// jitsi event
  static String JITSI_ON_CONFERENCE_WILL_JOIN = "onConferenceWillJoin";
  static String JITSI_ON_CONFERENCE_JOINED= "onConferenceJoined";
  static String JITSI_ON_CONFERENCE_TERMINATED = "onConferenceTerminated";
  static String JITSI_ON_PICTURE_IN_PICTURE_WILL_ENTER = "onPictureInPictureWillEnter";
  static String JITSI_ON_PICTURE_IN_PICTURE_WILL_TERMINATED = "onPictureInPictureTerminated";
  static String JITSI_ON_ERROR = "onError";
}