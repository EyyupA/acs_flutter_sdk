import 'acsflutter_call_event_listener.dart';
import 'acsflutter_platform_interface.dart';

class Acsflutter {
  Future<String?> initialize(String userToken) {
    return AcsflutterPlatform.instance.initialize(userToken);
  }

  Future<String?> getPlatformVersion() {
    return AcsflutterPlatform.instance.getPlatformVersion();
  }

  /// Request each permission if it is not already granted.
  Future<String?> getAllPermissions() {
    return AcsflutterPlatform.instance.getAllPermissions();
  }

  Future<String?> createAgent() {
    return AcsflutterPlatform.instance.createAgent();
  }

  Future<String?> startCall(String calleeId, AcsFlutterEventListener listener) {
    return AcsflutterPlatform.instance.startCall(calleeId, listener ?? new AcsFlutterEventListener());
  }

  Future<String?> stopCall() {
    return AcsflutterPlatform.instance.stopCall();
  }

  Future<String?> startOneToOneVideoCall(String calleeId) {
    return AcsflutterPlatform.instance.startOneToOneVideoCall(calleeId);
  }

  Future<String?> turnOnLocalVideo(bool show) {
    return AcsflutterPlatform.instance.turnOnLocalVideo(show);
  }

  Future<String?> getState() {
    return AcsflutterPlatform.instance.getState();
  }
}
