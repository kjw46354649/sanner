package com.jmes.dao.impl;

import com.jmes.dao.OrderDao;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class OrderDaoImpl implements OrderDao {
    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    @Override
    public void createControlMaster(Map<String, Object> hashMap) throws SQLException {
        sqlSessionTemplate.insert("createControlMaster", hashMap);
    }

    @Override
    public void createControlPart(Map<String, Object> hashMap) throws SQLException {
        sqlSessionTemplate.insert("createControlPart", hashMap);
    }

    @Override
    public void createControlPartOrder(Map<String, Object> hashMap) throws SQLException {
        sqlSessionTemplate.insert("createControlPartOrder", hashMap);
    }

    @Override
    public void createControlProgress(HashMap<String, Object> hashMap) throws SQLException {
        sqlSessionTemplate.insert("createControlProgress", hashMap);
    }

    @Override
    public void createControlProgressList(Map<String, Object> hashMap) throws SQLException {
        sqlSessionTemplate.insert("createControlProgressList", hashMap);
    }

    @Override
    public void createControlPartProgressList(Map<String, Object> hashMap) throws SQLException {
        sqlSessionTemplate.insert("createControlPartProgressList", hashMap);
    }

    @Override
    public void createMonthFinishClose(HashMap<String, Object> hashMap) throws SQLException {
        sqlSessionTemplate.insert("createMonthFinishClose", hashMap);
    }

    @Override
    public void createMonthFinishCloseHistory(HashMap<String, Object> hashMap) throws SQLException {
        sqlSessionTemplate.insert("createMonthFinishCloseHistory", hashMap);
    }

    @Override
    public void updateControlMaster(HashMap<String, Object> hashMap) throws SQLException {
        sqlSessionTemplate.update("updateControlMaster", hashMap);
    }

    @Override
    public void updateControlPart(HashMap<String, Object> hashMap) throws SQLException {
        sqlSessionTemplate.update("updateControlPart", hashMap);
    }

    @Override
    public void updateControlStatus(HashMap<String, Object> hashMap) throws SQLException {
        sqlSessionTemplate.update("updateControlStatus", hashMap);
    }

    @Override
    public void updateControlPartStatus(HashMap<String, Object> hashMap) throws SQLException {
        sqlSessionTemplate.update("updateControlPartStatus", hashMap);
    }

    @Override
    public void insertControlBarcode(Map<String, Object> hashMap) throws SQLException {
        sqlSessionTemplate.insert("insertControlBarcode", hashMap);
    }

    @Override
    public void createInvoice(HashMap<String, Object> hashMap) throws SQLException {
        sqlSessionTemplate.insert("createInvoice", hashMap);
    }

    @Override
    public void createInvoiceDetail(HashMap<String, Object> hashMap) throws SQLException {
        sqlSessionTemplate.insert("createInvoiceDetail", hashMap);
    }

    @Override
    public void removeInvoice(Map<String, Object> hashMap) throws SQLException {
        sqlSessionTemplate.delete("removeInvoice", hashMap);
    }

    @Override
    public void removeInvoiceDetail(Map<String, Object> hashMap) throws SQLException {
        sqlSessionTemplate.delete("removeInvoiceDetail", hashMap);
    }

    @Override
    public void createControlExcel(Map<String, Object> hashMap) throws SQLException {
        sqlSessionTemplate.insert("createControlExcel", hashMap);
    }

    @Override
    public void createControlExcelBatch(Map<String, Object> hashMap) throws SQLException {
        sqlSessionTemplate.insert("procedure.SP_CONTROL_EXCEL_BATCH", hashMap);
    }

    @Override
    public void updateMonthCloseFinalNego(HashMap<String, Object> hashMap) throws SQLException {
        sqlSessionTemplate.update("updateMonthCloseFinalNego", hashMap);
    }

    @Override
    public void deleteMonthCloseDetail(HashMap<String, Object> hashMap) throws SQLException {
        sqlSessionTemplate.delete("deleteMonthCloseDetail", hashMap);
    }

    @Override
    public void deleteMonthClose(HashMap<String, Object> hashMap) throws SQLException {
        sqlSessionTemplate.delete("deleteMonthClose", hashMap);
    }

}
