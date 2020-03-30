package com.jmes.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

public interface OrderDao {
    void insertControlMaster(Map<String, Object> hashMap) throws SQLException;

    void insertControlPart(Map<String, Object> hashMap) throws SQLException;

    void insertControlPartOrder(Map<String, Object> hashMap) throws SQLException;

    void insertControlProgress(Map<String, Object> hashMap) throws SQLException;

    void insertControlPartProgress(Map<String, Object> hashMap) throws SQLException;

    void insertControlProgressConfirm(Map<String, Object> hashMap) throws SQLException;

    void insertControlPartProgressConfirm(Map<String, Object> hashMap) throws SQLException;
}
