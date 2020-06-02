package com.jmes.dao;

import java.sql.SQLException;
import java.util.HashMap;

public interface OutDao {
    void createOutsideClose(HashMap<String, Object> hashMap) throws SQLException;

    void createOutsideCloseHistory(HashMap<String, Object> hashMap) throws SQLException;

    void updateOutsideCloseRequest(HashMap<String, Object> hashMap) throws SQLException;
}
