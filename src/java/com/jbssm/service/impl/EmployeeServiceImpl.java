package com.jbssm.service.impl;

import com.jbssm.dao.EmployeeDao;
import com.jbssm.domain.Employee;
import com.jbssm.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    private EmployeeDao employeeDao;


//    查找全部
    public List<Employee> findAllEmployee() {

        return employeeDao.findAllEmployee();
    }

    @Override
    public int addEmployee(Employee employee) {

        return employeeDao.addEmployee(employee);
    }

    @Override
    public int deleteEmployee(String eno) {

        return employeeDao.deleteEmployee(eno);
    }

    @Override
    public Employee findByEno(String eno) {

        return employeeDao.findByEno(eno);

    }

    @Override
    public int updateEmployee(Employee employee) {

        return employeeDao.updateEmployee(employee);
    }

    @Override
    public List<Employee> findByCondition(String ename,String job) {

        return employeeDao.findByCondition(ename,job);
    }


}
