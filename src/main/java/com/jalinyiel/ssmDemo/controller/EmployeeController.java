package com.jalinyiel.ssmDemo.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jalinyiel.ssmDemo.domain.Employee;
import com.jalinyiel.ssmDemo.domain.Message;
import com.jalinyiel.ssmDemo.service.EmployeeService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;


@Controller
public class EmployeeController {
    @Autowired
    EmployeeService employeeService;
    Logger logger = Logger.getLogger(EmployeeController.class);
    /**
     * 分页查询所有员工
     @return
     */
    @RequestMapping(value = "/emps", method = RequestMethod.GET)
    @ResponseBody
    public Message getEmpsWithJson(@RequestParam(value = "pageNum",defaultValue = "1") Integer pageNum) {
        PageHelper.startPage(pageNum,5,"emp_id asc"); //pagehelper的排序字段名是数据库中的字段名
        List<Employee> employeeList =  employeeService.getAll();
        PageInfo page = new PageInfo(employeeList,5);
        return new Message().success().add("pageInfo",page);
    }

    @RequestMapping(value = "/emps",method = RequestMethod.POST)
    @ResponseBody
    public Message saveEmp(@Valid  Employee emp, BindingResult result) {
        if(result.hasErrors()) {
            Map<String,Object> errorMsg = new HashMap<>();
            List<FieldError> list = result.getFieldErrors();
            for(FieldError e:list) {
                errorMsg.put(e.getField(),e.getDefaultMessage());
            }
            return Message.fail().add("errorMsg",errorMsg);
        }else {
            employeeService.save(emp);
        }
        return new Message().success();
    }

    @RequestMapping("/checkEmpName")
    @ResponseBody
    public Message checkName(@RequestParam("empName") String empName) {
        String regx = "(^[a-zA-Z][a-zA-Z0-9_]{4,15}$)|(^[\\u4e00-\\u9fa5]{2,5}$)";
        if(!empName.matches(regx)) {
            return Message.fail().add("Msg","姓名可以为3-5位汉字或4-15位英文字符和数字的组合");
        }
        boolean bool = employeeService.checkName(empName);
        if(bool) return Message.success().add("Msg","用户名可用");
        else return Message.fail().add("Msg","用户名重复");
    }

    @ResponseBody
    @RequestMapping(value = "/emps/{id}",method = RequestMethod.GET)
    public Message getEmp(@PathVariable("id") Integer id) {
        Employee emp = employeeService.get(id);
        return Message.success().add("emp",emp);
    }

    @ResponseBody
    @RequestMapping(value = "/emps/{empId}",method = RequestMethod.POST)
    public Message updateEmp(Employee employee) {
        employeeService.update(employee);
        return Message.success();
    }

    @ResponseBody
    @RequestMapping(value = "/emps/delete/{id}",method = RequestMethod.POST)
    public Message deleteById(@PathVariable("id") String empId) {
        if(empId.contains("_")){
            String[] ids = empId.split("_");
            List<Integer> res = new LinkedList<>();
            for(String s:ids) {
                res.add(Integer.parseInt(s));
            }
            employeeService.deleteBatch(res);
        }else {
            employeeService.deleteEmp(Integer.parseInt(empId));
        }
        return Message.success();
    }
    /**
     * 传统的JSP方式来与页面交互,仅作示范，在本项目中无实际作用
     * @param pageNum
     * @param model
     * @return
     */
    //   @RequestMapping("/emps")
    public String getEmps(@RequestParam(value="pageNum",defaultValue = "1") Integer pageNum, Model model ) {
        PageHelper.startPage(pageNum,5);
        List<Employee> employeeList =  employeeService.getAll();
        //将查询结果封装到pageInfo中交还给视图，pageInfo中封装了丰富的页面信息
        //navigatePages表示要显示的页数
        PageInfo page = new PageInfo(employeeList,5);
        model.addAttribute("pageInfo",page);
        return "list";
    }
}
