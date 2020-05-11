package com.jmes.dao.impl;

import com.jmes.dao.PopDao;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import java.sql.SQLException;
import java.util.Map;

public class PopDaoImpl implements PopDao {

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    @Override
    public void updateControlPartStatus(Map<String, Object> map) throws SQLException {
        sqlSessionTemplate.update("updateControlPartStatus", map);
    }

    @Override
    public void insertPopBarcode(Map<String, Object> map) throws SQLException {
        sqlSessionTemplate.insert("insertPopBarcode", map);
    }
}
