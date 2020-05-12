package com.jmes.dao;

import java.sql.SQLException;
import java.util.Map;

public interface PopDao {

    void insertPopBarcode(Map<String, Object> map) throws SQLException;

    void updatePopControlPartStatus(Map<String, Object> map) throws SQLException;

    void updatePopMaterialOrderStatus(Map<String, Object> map) throws SQLException;

}
