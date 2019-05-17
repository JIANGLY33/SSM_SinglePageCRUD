package com.jalinyiel.ssmDemo.domain;

import javax.validation.constraints.Pattern;

public class Employee {
    private Integer empId;
    @Pattern(regexp = "(^[a-zA-Z][a-zA-Z0-9_]{4,15}$)|(^[\\u4e00-\\u9fa5]{2,5}$)",
    message = "姓名必须为3-5位汉字或4-15位英文字符和数字的组合")
    private String empName;

    private String gender;
    @Pattern(regexp = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$",
    message = "邮箱格式不正确")
    private String email;

    private Integer dId;

    private Department dept;

    public  Employee() {

    }

    public Employee(Integer empId, String empName, String gender, String email, Integer dId) {
        this.empId = empId;
        this.empName = empName;
        this.gender = gender;
        this.email = email;
        this.dId = dId;
    }

    public Department getDept() {
        return dept;
    }

    public void setDept(Department dept) {
        this.dept = dept;
    }

    public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName == null ? null : empName.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Integer getdId() {
        return dId;
    }

    public void setdId(Integer dId) {
        this.dId = dId;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "empId=" + empId +
                ", empName='" + empName + '\'' +
                ", gender='" + gender + '\'' +
                ", email='" + email + '\'' +
                ", dId=" + dId +
                ", dept=" + dept +
                '}';
    }
}