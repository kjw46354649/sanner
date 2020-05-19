package com.jmes.dao;

import java.sql.SQLException;
import java.util.Map;

public interface DrawingBoardDao {

    void updateEstimateMasterFinish(Map<String, Object> map) throws SQLException;

    void insertEstimateOrderControlMaster(Map<String, Object> map) throws SQLException;

    void insertEstimateOrderControlDetail(Map<String, Object> map) throws SQLException;

    void insertEstimateOrderControlOrder(Map<String, Object> map) throws SQLException;
}
