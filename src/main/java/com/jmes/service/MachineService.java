package com.jmes.service;

import org.springframework.ui.Model;

import java.util.List;
import java.util.Map;

public interface MachineService {

    public void managerEquip(Model model, Map<String, Object> map) throws Exception;
}
