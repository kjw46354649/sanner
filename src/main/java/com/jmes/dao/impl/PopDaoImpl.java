package com.jmes.dao.impl;

import com.jmes.dao.PopDao;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.Map;

@Repository
public class PopDaoImpl implements PopDao {

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    @Override
    public void insertPopBarcode(Map<String, Object> map) throws SQLException {
        sqlSessionTemplate.insert("insertPopBarcode", map);
    }

    @Override
    public void updatePopControlPartStatus(Map<String, Object> map) throws SQLException {
        sqlSessionTemplate.update("updatePopControlPartStatus", map);
    }

    @Override
    public void updatePopMaterialOrderStatus(Map<String, Object> map) throws SQLException {
        sqlSessionTemplate.update("updatePopMaterialOrderStatus", map);
    }
}
