package com.microsoft.acsflutter.acsflutter;

import com.azure.android.communication.calling.PropertyChangedEvent;
import com.azure.android.communication.calling.PropertyChangedListener;

public class AzurePropertyChangedListener implements PropertyChangedListener {

    EventStreamHandler stream = new EventStreamHandler();

    @Override
    public void onPropertyChanged(PropertyChangedEvent propertyChangedEvent) {
        stream.changedCallState(propertyChangedEvent.toString());
    }
}
