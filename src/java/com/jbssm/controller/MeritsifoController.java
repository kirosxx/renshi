package com.jbssm.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jbssm.domain.Employee;
import com.jbssm.domain.Meritsifo;
import com.jbssm.service.EmployeeService;
import com.jbssm.service.MeritsifoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * 绩效信息控制器
 */
@Controller
@RequestMapping("/meritsifo")
public class MeritsifoController {

    @Autowired
    private MeritsifoService service;

    @Autowired
    private EmployeeService employeeService;

    @RequestMapping("/findAll")
    public String findAllMeritsifo(@RequestParam(defaultValue="1",required=true,value="pageNum")Integer pageNum, Model model){
        Integer pageSize=5;//每页显示记录数
        //分页查询
        PageHelper.startPage(pageNum, pageSize);
        List<Meritsifo> meritsifos = service.findAllMeritsifo();//获取所有用户信息
        PageInfo<Meritsifo> pageInfo=new PageInfo<Meritsifo>(meritsifos);
        model.addAttribute("pageInfo", pageInfo);
        //跳转解析页面
        return "showmeritsifo";
    }

    @RequestMapping("/ygFindAll")
    public String ygFindAllMeritsifo(@RequestParam(defaultValue="1",required=true,value="pageNum")Integer pageNum, Model model){
        Integer pageSize=5;//每页显示记录数
        //分页查询
        PageHelper.startPage(pageNum, pageSize);
        List<Meritsifo> meritsifos = service.findAllMeritsifo();//获取所有用户信息
        PageInfo<Meritsifo> pageInfo=new PageInfo<Meritsifo>(meritsifos);
        model.addAttribute("pageInfo", pageInfo);
        //跳转解析页面
        return "ygshowmeritsifo";
    }


    /**
     * 添加绩效输入工号后回显姓名
     * @param eno
     * @param response
     * @throws IOException
     */
    @RequestMapping("/ishava")
    public void isAlreadyHaveMerits(String eno, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out=response.getWriter();
        Employee employee = employeeService.findByEno(eno);

        if(employee!=null){
            out.println(employee.getEname());
        }else{
            out.println("工号输入有误");
        }

        out.flush();
        out.close();
    }

    @RequestMapping("/addmeritsifo")
    public String addMeritsifo(Meritsifo meritsifo,String eno){
        Employee employee = employeeService.findByEno(eno);
        meritsifo.setEname(employee.getEname());
        service.addMeritsifo(meritsifo);
        return "addloading";
    }


    @RequestMapping("/deletemeritsifo")
    public String deleteMeritsifo(int id){
        service.deleteMeritsifo(id);
        return "addloading";
    }


    /**
     * 按照事件id查找
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/findById")
    public String findEmployeeByEno(int id,Model model){
        Meritsifo meritsifo = service.findByid(id);
        model.addAttribute("meritsifo",meritsifo);
        return "updatemeritsifo";
    }


    @RequestMapping("/updatemeritsifo")
    public String updateMeritsifo(Meritsifo meritsifo){

        service.updateMeritsifo(meritsifo);
        return "addloading";
    }


    @RequestMapping("/findByCondition")
    public String findByCondition(@RequestParam(defaultValue="1",required=true,value="pageNum")Integer pageNum,Model model,String eno,String date){
        Integer pageSize=5;//每页显示记录数
        //分页查询
        PageHelper.startPage(pageNum, pageSize);
        List<Meritsifo> meritsifos = service.findByCondition(eno,date);//获取所有用户信息
        PageInfo<Meritsifo> pageInfo=new PageInfo<Meritsifo>(meritsifos);
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("ConditionEno",eno);
        model.addAttribute("ConditionDate",date);
        //跳转解析页面
        return "showmeritsifo";

    }

    @RequestMapping("/ygFindByCondition")
    public String ygFindByCondition(@RequestParam(defaultValue="1",required=true,value="pageNum")Integer pageNum,Model model,String eno,String date){
        Integer pageSize=5;//每页显示记录数
        //分页查询
        PageHelper.startPage(pageNum, pageSize);
        List<Meritsifo> meritsifos = service.findByCondition(eno,date);//获取所有用户信息
        PageInfo<Meritsifo> pageInfo=new PageInfo<Meritsifo>(meritsifos);
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("ConditionEno",eno);
        model.addAttribute("ConditionDate",date);
        //跳转解析页面
        return "ygshowmeritsifo";

    }


}




