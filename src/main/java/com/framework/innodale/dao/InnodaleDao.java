package com.framework.innodale.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface InnodaleDao {
    public int createKeyReturn(Map<String, Object> hashMap) throws SQLException;

    public void create(Map<String, Object> hashMap) throws SQLException;

    public void update(Map<String, Object> hashMap) throws SQLException;

    public void remove(Map<String, Object> hashMap) throws SQLException;

    public Map<String, Object> getInfo(Map<String, Object> hashMap) throws SQLException;

    public List<Map<String, Object>> getList(Map<String, Object> hashMap) throws SQLException;

    public void getPageList(Map<String, Object> hashMap) throws SQLException;

    /*public int getPageTotalCount() throws SQLException;*/

    public int callProcedureMethod(Map<String, Object> hashMap) throws SQLException;

    public int getInfoNumberValue(Map<String, Object> hashMap) throws SQLException;

    public void insertGrid(HashMap<String, Object> hashMap) throws SQLException;

    public void updateGrid(HashMap<String, Object> hashMap) throws SQLException;

    public void deleteGrid(Map<String, Object> hashMap) throws SQLException;
}