package com.jbssm.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jbssm.domain.Employee;
import com.jbssm.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * 员工控制器
 */
@Controller
@RequestMapping("/employee")
public class EmployeeController {

    @Autowired
    private EmployeeService service;

    /**
     * 分页显示员工信息
     * @param pageNum
     * @param model
     * @return
     */
        @RequestMapping(value = {"/","/findAll"})
        public String findAllEmployee(@RequestParam(defaultValue="1",required=true,value="pageNum")Integer pageNum,Model model){
            Integer pageSize=5;//每页显示记录数
            //分页查询
            PageHelper.startPage(pageNum, pageSize);
            List<Employee> employees = service.findAllEmployee();//获取所有用户信息
            PageInfo<Employee> pageInfo=new PageInfo<Employee>(employees);
            model.addAttribute("pageInfo", pageInfo);
            //跳转解析页面
            return "showallemployee";
    }


    /**
     * 分页显示员工信息
     * @param pageNum
     * @param model
     * @return
     */
    @RequestMapping(value = {"/","/ygFindAll"})
    public String ygFindAllEmployee(@RequestParam(defaultValue="1",required=true,value="pageNum")Integer pageNum,Model model){
        Integer pageSize=5;//每页显示记录数
        //分页查询
        PageHelper.startPage(pageNum, pageSize);
        List<Employee> employees = service.findAllEmployee();//获取所有用户信息
        PageInfo<Employee> pageInfo=new PageInfo<Employee>(employees);
        model.addAttribute("pageInfo", pageInfo);
        //跳转解析页面
        return "ygshowallemployee";
    }


    /**
     * 添加员工
     * @param employee
     * @return
     */
    @RequestMapping(value="/addEmployee",method= RequestMethod.POST)
    public String addEmployee(Employee employee){
        int i = service.addEmployee(employee);
        return "addloading";

    }


    /**
     * 按工号删除
     * @param eno
     * @return
     */
    @RequestMapping("/deleteEmployee")
    public String deleteEmployee(String eno){
        int i = service.deleteEmployee(eno);
        return "addloading";
    }


    /**
     * 按工号查找员工
     * @param eno
     * @param model
     * @return
     */
    @RequestMapping("/findByEno")
    public String findEmployeeByEno(String eno,Model model){
        Employee employee = service.findByEno(eno);
        model.addAttribute("employee",employee);
        return "updateemployee";
    }


    /**
     * 更新员工信息
     * @param employee
     * @return
     */
    @RequestMapping("/updateemployee")
    public String updateEmoloyee(Employee employee){
        int i = service.updateEmployee(employee);
        return "addloading";
    }

    /**
     * 模糊条件查询
     * @param pageNum
     * @param model
     * @param ename
     * @return
     */
    @RequestMapping("/findByCondition")
    public String findByCondition(@RequestParam(defaultValue="1",required=true,value="pageNum")Integer pageNum,Model model,String ename,String job){
        Integer pageSize=5;//每页显示记录数
        //分页查询
        PageHelper.startPage(pageNum, pageSize);
        List<Employee> employees = service.findByCondition(ename,job);//获取所有用户信息
        PageInfo<Employee> pageInfo=new PageInfo<Employee>(employees);
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("ConditionJob",job);
        model.addAttribute("ConditionEname",ename);
        //跳转解析页面
        return "showallemployee";
    }

    @RequestMapping("/ygFindByCondition")
    public String ygFindByCondition(@RequestParam(defaultValue="1",required=true,value="pageNum")Integer pageNum,Model model,String ename,String job){
        Integer pageSize=5;//每页显示记录数
        //分页查询
        PageHelper.startPage(pageNum, pageSize);
        List<Employee> employees = service.findByCondition(ename,job);//获取所有用户信息
        PageInfo<Employee> pageInfo=new PageInfo<Employee>(employees);
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("ConditionJob",job);
        model.addAttribute("ConditionEname",ename);
        //跳转解析页面
        return "ygshowallemployee";
    }

    @RequestMapping("/ishava")
    public void isAlreadyHave(String eno, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out=response.getWriter();
        Employee employee = service.findByEno(eno);

        if(employee!=null){
            out.println("该工号不可用！");
        }else{
            out.println("恭喜，该工号可用！");
        }

        out.flush();
        out.close();
    }



}
