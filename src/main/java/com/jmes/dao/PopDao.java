package com.jmes.dao;

import java.sql.SQLException;
import java.util.Map;

public interface PopDao {

    void updateControlPartStatus(Map<String, Object> map) throws SQLException;

    void insertPopBarcode(Map<String, Object> map) throws SQLException;

}
