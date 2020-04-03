package com.jmes.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

public interface OrderDao {
    void insertControlMaster(Map<String, Object> hashMap) throws SQLException;

    void insertControlPart(Map<String, Object> hashMap) throws SQLException;

    void insertControlPartOrder(Map<String, Object> hashMap) throws SQLException;

    void insertControlProgressList(Map<String, Object> hashMap) throws SQLException;

    void insertControlPartProgressList(Map<String, Object> hashMap) throws SQLException;

}
