package com.jmes.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public interface EstimateDao {

    void insertEstimateMaster(HashMap<String, Object> hashMap) throws SQLException;

    void insertEstimateDetail(Map<String, Object> map) throws SQLException;

    void insertEstimateReceiver(Map<String, Object> map) throws SQLException;

    void updateEstimateMasterFinish(Map<String, Object> map) throws SQLException;

    void insertEstimateOrderControlMaster(Map<String, Object> map) throws SQLException;

    void insertEstimateOrderControlDetail(Map<String, Object> map) throws SQLException;

    void insertEstimateOrderControlOrder(Map<String, Object> map) throws SQLException;

    void insertEstimateOrderControlBarcode(Map<String, Object> map) throws SQLException;

    void insertEstimateOrderOutBarcode(Map<String, Object> map) throws SQLException;
}
