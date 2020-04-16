package com.jmes.dao;

import java.sql.SQLException;
import java.util.HashMap;

public interface OutDao {
    void insertOutsideClose(HashMap<String, Object> hashMap) throws SQLException;

    void insertOutsideCloseHistory(HashMap<String, Object> hashMap) throws SQLException;
}
