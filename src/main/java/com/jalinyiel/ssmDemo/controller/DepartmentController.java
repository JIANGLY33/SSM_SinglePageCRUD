package com.jalinyiel.ssmDemo.controller;

import com.jalinyiel.ssmDemo.domain.Department;
import com.jalinyiel.ssmDemo.domain.Message;
import com.jalinyiel.ssmDemo.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class DepartmentController {

    @Autowired
    DepartmentService departmentService;

    @ResponseBody
    @RequestMapping("/depts")
    public Message getDepts() {
        List<Department> list = departmentService.getList();
        return new Message().success().add("deptInfo",list);
    }
}
