package com.jmes.dao.impl;

import com.jmes.dao.EstimateDao;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.Map;

@Repository
public class EstimateDaoImpl implements EstimateDao {

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

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
}
