package com.jmes.dao.impl;

import com.jmes.dao.OrderDao;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.ArrayList;
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
    public void insertControlProgress(Map<String, Object> hashMap) throws SQLException {
        sqlSessionTemplate.insert("insertControlProgress", hashMap);
    }

    @Override
    public void insertControlPartProgress(Map<String, Object> hashMap) throws SQLException {
        sqlSessionTemplate.insert("insertControlPartProgress", hashMap);
    }

    @Override
    public void insertControlProgressConfirm(Map<String, Object> hashMap) throws SQLException {
        sqlSessionTemplate.insert("insertControlProgressConfirm", hashMap);
    }

    @Override
    public void insertControlPartProgressConfirm(Map<String, Object> hashMap) throws SQLException {
        sqlSessionTemplate.insert("insertControlPartProgressConfirm", hashMap);
    }
}
