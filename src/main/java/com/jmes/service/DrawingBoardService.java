package com.jmes.service;

import java.util.HashMap;

public interface DrawingBoardService {

    public void managerDrawingBoardStart(HashMap<String, Object> hashMap) throws Exception;

    public void managerDrawingBoardPause(HashMap<String, Object> hashMap) throws Exception;

    public void managerDrawingBoardRestart(HashMap<String, Object> hashMap) throws Exception;

    public void managerDrawingBoardComplete(HashMap<String, Object> hashMap) throws Exception;

    public void managerDrawingBoardCancel(HashMap<String, Object> hashMap) throws Exception;

}
