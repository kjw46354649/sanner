package com.jmes.dao.impl;

import com.jmes.dao.OrderDao;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class OrderDaoImpl implements OrderDao {
    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    @Override
    public void insertControlMaster(Map<String, Object> hashMap) throws SQLException {
        sqlSessionTemplate.insert("insertControlMaster", hashMap);
    }

    @Override
    public void insertControlPart(Map<String, Object> hashMap) throws SQLException {
        sqlSessionTemplate.insert("insertControlPart", hashMap);
    }

    @Override
    public void insertControlPartOrder(Map<String, Object> hashMap) throws SQLException {
        sqlSessionTemplate.insert("insertControlPartOrder", hashMap);
    }

    @Override
    public void insertControlProgressList(Map<String, Object> hashMap) throws SQLException {
        sqlSessionTemplate.insert("insertControlProgressList", hashMap);
    }

    @Override
    public void insertControlPartProgressList(Map<String, Object> hashMap) throws SQLException {
        sqlSessionTemplate.insert("insertControlPartProgressList", hashMap);
    }

    @Override
    public List<Map<String, Object>> selectControlCloseRightList(Map<String, Object> map) throws SQLException {
        return sqlSessionTemplate.selectList("selectControlCloseRightList", map);
    }

    @Override
    public void insertMonthFinishClose(HashMap<String, Object> hashMap) throws SQLException {
        sqlSessionTemplate.insert("insertMonthFinishClose", hashMap);
    }

    @Override
    public void insertMonthFinishCloseHistory(HashMap<String, Object> hashMap) throws SQLException {
        sqlSessionTemplate.insert("insertMonthFinishCloseHistory", hashMap);
    }

    @Override
    public void updateControlStatus(HashMap<String, Object> hashMap) throws SQLException {
        sqlSessionTemplate.update("updateControlStatus", hashMap);
    }

}
