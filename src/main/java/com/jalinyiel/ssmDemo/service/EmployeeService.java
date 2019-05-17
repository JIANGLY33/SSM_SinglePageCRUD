package com.jalinyiel.ssmDemo.service;

import com.jalinyiel.ssmDemo.dao.EmployeeMapper;
import com.jalinyiel.ssmDemo.domain.Employee;
import com.jalinyiel.ssmDemo.domain.EmployeeExample;
import com.jalinyiel.ssmDemo.domain.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



import java.util.List;


@Service
public class EmployeeService {
    @Autowired
    EmployeeMapper employeeMapper;

    public List<Employee> getAll() {
        return employeeMapper.selectByExampleWithDept(null);
    }

    public Message save(Employee emp) {

        employeeMapper.insertSelective(emp);
        return Message.success();
    }

    public Employee get(Integer  id) {
        return employeeMapper.selectByPrimaryKeyWithDept(id);
    }

    public boolean checkName(String name) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpNameEqualTo(name);
        long count = employeeMapper.countByExample(example);
        return (count == 0);
    }

    public void update(Employee employee) {
        employeeMapper.updateByPrimaryKeySelective(employee);
    }
}
