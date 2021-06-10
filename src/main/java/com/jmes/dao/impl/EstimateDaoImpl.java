package com.jmes.dao.impl;

import com.jmes.dao.EstimateDao;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

@Repository
public class EstimateDaoImpl implements EstimateDao {

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    @Override
    public void insertEstimateMaster(HashMap<String, Object> hashMap) throws SQLException {
        sqlSessionTemplate.update("insertEstimateMaster", hashMap);
    }

    @Override
    public void insertEstimateDetail(Map<String, Object> map) throws SQLException {
        sqlSessionTemplate.update("insertEstimateDetail", map);
    }

    @Override
    public void insertEstimateReceiver(Map<String, Object> map) throws SQLException {
        sqlSessionTemplate.update("insertEstimateReceiver", map);
    }

    @Override
    public void updateEstimateMasterFinish(Map<String, Object> map) throws SQLException {
        sqlSessionTemplate.update("updateEstimateMasterFinish", map);
    }

    @Override
    public void insertEstimateOrderControlMaster(Map<String, Object> map) throws SQLException {
        sqlSessionTemplate.insert("insertEstimateOrderControlMaster", map);
    }

    @Override
    public void insertEstimateOrderControlDetail(Map<String, Object> map) throws SQLException {
        sqlSessionTemplate.insert("insertEstimateOrderControlDetail", map);
    }

    @Override
    public void insertEstimateOrderControlOrder(Map<String, Object> map) throws SQLException {
        sqlSessionTemplate.insert("insertEstimateOrderControlOrder", map);
    }

    @Override
    public void insertEstimateOrderControlBarcode(Map<String, Object> map) throws SQLException {
        sqlSessionTemplate.insert("insertEstimateOrderControlBarcode", map);
    }
    @Override
    public void insertEstimateOrderOutBarcode(Map<String, Object> map) throws SQLException {
        sqlSessionTemplate.insert("insertEstimateOrderOutBarcode", map);
    }
}
