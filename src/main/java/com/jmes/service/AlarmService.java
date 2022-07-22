package com.jmes.service;

import java.util.Map;

public interface AlarmService {

    public void insertNewStopAlarm(Map<String, Object> map) throws Exception;
    public void updateHandleStopAlarm(Map<String, Object> map) throws Exception;
}
