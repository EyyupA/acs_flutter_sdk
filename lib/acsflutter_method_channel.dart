import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'acsflutter_call_event_listener.dart';
import 'acsflutter_platform_interface.dart';

/// An implementation of [AcsflutterPlatform] that uses method channels.
class MethodChannelAcsflutter extends AcsflutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('custom_azure_communication_calling_sdk');
  @visibleForTesting
  final eventChannel = const EventChannel('custom_azure_communication_calling_sdk_events');

  bool _eventChannelIsInitialized = false;
  late AcsFlutterEventListener _listener;

  @override
  Future<String?> initialize(String userToken) async {
    final version = await methodChannel.invokeMethod<String>('initialize', {
      "userToken": userToken,
    });
    return version;
  }

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> getAllPermissions() async {
    final version =
        await methodChannel.invokeMethod<String>('getAllPermissions');
    return version;
  }

  @override
  Future<String?> createAgent() async {
    final version = await methodChannel.invokeMethod<String>('createAgent');
    return version;
  }

  @override
  Future<String?> startCall(String calleeId) async {
    final version = await methodChannel.invokeMethod<String>('startCall', {
      "calleeId": calleeId,
    });
    _listener = listener;
    if(!_eventChannelIsInitialized) {
      _initialize();
    }
    return version;
  }

  @override
  Future<String?> stopCall() async {
    final version = await methodChannel.invokeMethod<String>('stopCall');
    return version;
  }

  @override
  Future<String?> startOneToOneVideoCall(String calleeId) async {
    final version =
        await methodChannel.invokeMethod<String>('startOneToOneVideoCall', {
      "calleeId": calleeId,
    });
    return version;
  }

  @override
  Future<String?> turnOnLocalVideo(bool show) async {
    final version =
        await methodChannel.invokeMethod<String>('turnOnLocalVideo', {
      "show": show,
    });
    return version;
  }

  @override
  Future<String?> getState() async {
    final version = await methodChannel.invokeMethod<String>('getState');
    return version;
  }

  void _initialize() {
    eventChannel.receiveBroadcastStream().listen((message) {
      final data = message['data'];
      switch (message['event']) {
        case "changedCallState":
          _listener?.conferenceJoined?.call(data["url"]);
          break;
      }
    }).onError((error) {
      debugPrint("Error receiving data from the event channel: $error");
    });
    _eventChannelIsInitialized = true;
  }
}
