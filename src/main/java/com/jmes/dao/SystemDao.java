package com.jmes.dao;

import java.sql.SQLException;
import java.util.Map;

public interface SystemDao {
    Map<String, Object> getCommonLangList(Map<String, Object> hashMap) throws SQLException;
}
