package com.jmes.dao.impl;

import com.jmes.dao.SystemDao;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.Map;

@Repository
public class SystemDaoImpl implements SystemDao {
    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    @Override
    public Map<String, Object> getCommonLangList(Map<String, Object> hashMap) throws SQLException {
        return sqlSessionTemplate.selectOne("getCommonLangList", hashMap);
    }
}
