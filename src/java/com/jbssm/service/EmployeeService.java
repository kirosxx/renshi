package com.jbssm.service;


import com.jbssm.domain.Employee;

import java.util.List;

/**
 * 业务层
 */

public interface EmployeeService {

    List<Employee> findAllEmployee();

    public int addEmployee(Employee employee);

    public int deleteEmployee(String eno);

    public Employee findByEno(String eno);

    public int updateEmployee(Employee employee);

    public List<Employee> findByCondition(String ename,String job);



}
