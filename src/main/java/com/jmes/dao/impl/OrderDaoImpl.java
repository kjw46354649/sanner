package com.jmes.dao.impl;

import com.jmes.dao.OrderDao;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

@Repository
public class OrderDaoImpl implements OrderDao {
    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    @Override
    public String createInvoiceNum(HashMap<String, Object> hashMap) throws SQLException {
        return sqlSessionTemplate.selectOne("createInvoiceNum", hashMap);
    }

    @Override
    public boolean getFlag(Map<String, Object> map) throws SQLException {
        return sqlSessionTemplate.selectOne((String)map.get("queryId"), map);
    }
}
