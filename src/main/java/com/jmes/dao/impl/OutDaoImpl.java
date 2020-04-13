package com.jmes.dao.impl;

import com.jmes.dao.OrderDao;
import com.jmes.dao.OutDao;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class OutDaoImpl implements OutDao {
    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    @Override
    public void insertOutsideClose(HashMap<String, Object> hashMap) throws SQLException {
        sqlSessionTemplate.insert("insertOutsideClose", hashMap);
    }

    @Override
    public void insertOutsideCloseHistory(HashMap<String, Object> hashMap) throws SQLException {
        sqlSessionTemplate.insert("insertOutsideCloseHistory", hashMap);
    }
}
