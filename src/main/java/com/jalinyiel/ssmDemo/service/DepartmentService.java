package com.jalinyiel.ssmDemo.service;

import com.jalinyiel.ssmDemo.dao.DepartmentMapper;
import com.jalinyiel.ssmDemo.domain.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class DepartmentService {
    @Autowired
    DepartmentMapper departmentMapper;

    public List<Department> getList() {
         return departmentMapper.selectByExample(null);
     }
}
