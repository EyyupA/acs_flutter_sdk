package com.microsoft.acsflutter.acsflutter;

import com.azure.android.communication.calling.PropertyChangedEvent;
import com.azure.android.communication.calling.PropertyChangedListener;

public class AzurePropertyChangedListener implements PropertyChangedListener {

    EventStreamHandler eventStreamHandler = EventStreamHandler.getInstance();

    @Override
    public void onPropertyChanged(PropertyChangedEvent propertyChangedEvent) {
        eventStreamHandler.changedCallState(propertyChangedEvent.toString());
    }
}
