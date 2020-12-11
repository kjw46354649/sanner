package com.framework.innodale.dao.impl;

import com.framework.innodale.dao.InnodaleDao;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class InnodaleDaoImpl implements InnodaleDao {

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    public int createKeyReturn(Map<String, Object> hashMap) throws SQLException {
        return sqlSessionTemplate.insert((String)hashMap.get("queryId"), hashMap);
    }

    public void create(Map<String, Object> hashMap) throws SQLException {
        sqlSessionTemplate.insert((String)hashMap.get("queryId"), hashMap);
    }

    public void update(Map<String, Object> hashMap) throws SQLException {
        sqlSessionTemplate.update((String)hashMap.get("queryId"), hashMap);
    }

    public void remove(Map<String, Object> hashMap) throws SQLException {
        sqlSessionTemplate.delete((String) hashMap.get("queryId"), hashMap);
    }

    public Map<String, Object> getInfo(Map<String, Object> hashMap) throws SQLException {
        return sqlSessionTemplate.selectOne((String)hashMap.get("queryId"), hashMap);
    }

    public List<Map<String, Object>> getList(Map<String, Object> hashMap) throws SQLException {
        return sqlSessionTemplate.selectList((String) hashMap.get("queryId"), hashMap);
    }

    public void getPageList(Map<String, Object> hashMap) throws SQLException {
        hashMap.put("pageList", sqlSessionTemplate.selectList((String)hashMap.get("queryId"), hashMap));
        hashMap.put("totalRecords", (Integer)sqlSessionTemplate.selectOne("common.getBeforeQueryTotalCount"));
    }

    /*public int getPageTotalCount() throws SQLException {
        return (Integer)sqlSessionTemplate.selectOne("common.getBeforeQueryTotalCount");
    }*/

    public int callProcedureMethod(Map<String, Object> hashMap) throws SQLException {
        return (Integer)sqlSessionTemplate.update((String)hashMap.get("queryId"), hashMap);
    }

    public int getInfoNumberValue(Map<String, Object> hashMap) throws SQLException {
        return (Integer)sqlSessionTemplate.selectOne((String)hashMap.get("queryId"), hashMap);
    }

    @Override
    public void insertGrid(HashMap<String, Object> hashMap) throws SQLException {
        sqlSessionTemplate.insert((String) hashMap.get("queryId"), hashMap);
    }

    @Override
    public void updateGrid(HashMap<String, Object> hashMap) throws SQLException {
        sqlSessionTemplate.update((String) hashMap.get("queryId"), hashMap);
    }

    @Override
    public void deleteGrid(Map<String, Object> hashMap) throws SQLException {
        sqlSessionTemplate.delete((String) hashMap.get("queryId"), hashMap);
    }

}
