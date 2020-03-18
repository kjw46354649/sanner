package com.jmes.dao.impl;

import com.jmes.dao.SystemDao;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class SystemDaoImpl implements SystemDao {
    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    @Override
    public List<Map<String, Object>> selectCommonLangList(Map<String, Object> hashMap) throws SQLException {
        return sqlSessionTemplate.selectList("selectCommonLangList", hashMap);
    }

    @Override
    public List<Map<String, Object>> selectCommonCodeList(Map<String, Object> commonLangList) throws SQLException {
        return sqlSessionTemplate.selectList("selectCommonCodeList", commonLangList);
    }

    @Override
    public void insertCommonCode(HashMap<String, Object> hashMap) throws SQLException {
        sqlSessionTemplate.insert("insertCommonCode", hashMap);
    }

    @Override
    public void insertCommonLangCode(HashMap<String, Object> hashMap) throws SQLException {
        sqlSessionTemplate.insert("insertCommonLangCode", hashMap);
    }

    @Override
    public void updateCommonCode(HashMap<String, Object> hashMap) throws SQLException {
        sqlSessionTemplate.update("updateCommonCode", hashMap);
    }

    @Override
    public void updateCommonLangCode(HashMap<String, Object> hashMap) throws SQLException {
        sqlSessionTemplate.update("updateCommonLangCode", hashMap);
    }

}
