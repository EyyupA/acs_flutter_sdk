package com.microsoft.acsflutter.acsflutter;

import java.util.HashMap;
import java.util.Map;

import io.flutter.plugin.common.EventChannel;

public class EventStreamHandler implements EventChannel.StreamHandler {


    private EventChannel.EventSink eventSink;

    @Override
    public void onListen(Object arguments, EventChannel.EventSink events) {
        this.eventSink = events;
    }

    @Override
    public void onCancel(Object arguments) {
        this.eventSink = null;
    }

    void changedCallState(String data) {
        Map<String, String> event = new HashMap<>();
        event.put("event", "changedCallState");
        event.put("data", data);
        eventSink.success(event);
    }
}
