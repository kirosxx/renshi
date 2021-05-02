package com.jbssm.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jbssm.domain.Employee;
import com.jbssm.domain.Leaveaapli;
import com.jbssm.domain.Leaveifo;
import com.jbssm.domain.Meritsifo;
import com.jbssm.service.EmployeeService;
import com.jbssm.service.LeaveifoService;
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
@RequestMapping("/leaveifo")
public class LeaveifoController {

    @Autowired
    private LeaveifoService service;

    @Autowired
    private EmployeeService employeeService;

    @RequestMapping("/findAll")
    public String findAllLeaveifo(@RequestParam(defaultValue="1",required=true,value="pageNum")Integer pageNum, Model model){
        Integer pageSize=5;//每页显示记录数
        //分页查询
        PageHelper.startPage(pageNum, pageSize);
        List<Leaveifo> leaveifo = service.findAllLeaveifo();//获取所有用户信息
        PageInfo<Leaveifo> pageInfo=new PageInfo<Leaveifo>(leaveifo);
        model.addAttribute("pageInfo", pageInfo);
        //跳转解析页面
        return "showleaveifo";
    }

    @RequestMapping("/ygFindAll")
    public String ygFindAllLeaveifo(@RequestParam(defaultValue="1",required=true,value="pageNum")Integer pageNum, Model model){
        Integer pageSize=5;//每页显示记录数
        //分页查询
        PageHelper.startPage(pageNum, pageSize);
        List<Leaveaapli> leaveaaplis = service.findAllLeaveappli();//获取所有用户信息
        PageInfo<Leaveaapli> pageInfo=new PageInfo<Leaveaapli>(leaveaaplis);
        model.addAttribute("pageInfo", pageInfo);
        //跳转解析页面
        return "ygshowleaveappli";
    }


    @RequestMapping("/findAllLeaveappli")
    public String findAllLeaveappli(@RequestParam(defaultValue="1",required=true,value="pageNum")Integer pageNum, Model model){
        Integer pageSize=5;//每页显示记录数
        //分页查询
        PageHelper.startPage(pageNum, pageSize);
        List<Leaveaapli> leaveaaplis = service.findAllLeaveappli();//获取所有用户信息
        PageInfo<Leaveaapli> pageInfo=new PageInfo<Leaveaapli>(leaveaaplis);
        model.addAttribute("pageInfo", pageInfo);
        //跳转解析页面
        return "showleaveappli";
    }

    /**
     * 添加请假信息输入工号后回显姓名
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

    /**
     * 上司添加请假信息
     * @param leaveifo
     * @param eno
     * @return
     */
    @RequestMapping("/addleaveifo")
    public String addLeaveifo(Leaveifo leaveifo,String eno){
        Employee employee = employeeService.findByEno(eno);
        leaveifo.setEname(employee.getEname());
        service.addLeaveifo(leaveifo);
        return "addloading";
    }


    /**
     * 员工提交请假申请
     * @param leaveaapli
     * @param eno
     * @return
     */
    @RequestMapping("/ygleaveappli")
    public String ygleaveappli(Leaveaapli leaveaapli, String eno){
        Employee employee = employeeService.findByEno(eno);
        leaveaapli.setEname(employee.getEname());
        service.ygleaveappli(leaveaapli);
        return "ygaddloading";
    }


    @RequestMapping("/deleteleaveifo")
    public String deleteLeaveifo(int id){
        service.deleteLeaveifo(id);
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
        Leaveifo leaveifo = service.findByid(id);
        model.addAttribute("leaveifo",leaveifo);
        return "updateleaveifo";
    }


    @RequestMapping("/updateleaveifo")
    public String updateLeaveifo(Leaveifo leaveifo){

        service.updateLeaveifo(leaveifo);
        return "addloading";
    }


    @RequestMapping("/disagreeLeaveappli")
    public String disagreeLeaveappli(int id,String agreer){

        service.disagreeLeaveappli(id, agreer);
        return "addloading2";
    }


    /**
     * 同意请假同时操作两表
     * @param id
     * @param agreer
     * @return
     */
    @RequestMapping("/agreeLeaveappli")
    public String agreeLeaveappli(int id,String agreer){

        Leaveaapli leaveaapli = service.findLeaveappliById(id);
        Leaveifo leaveifo = new Leaveifo();
        leaveifo.setEno(leaveaapli.getEno());
        leaveifo.setEname(leaveaapli.getEname());
        leaveifo.setStartdate(leaveaapli.getStartdate());
        leaveifo.setEnddate(leaveaapli.getEnddate());
        leaveifo.setType(leaveaapli.getType());
        leaveifo.setAgreer(agreer);

        service.addLeaveifo(leaveifo);
        service.agreeLeaveappli(id,agreer);
        return "addloading2";
    }


    @RequestMapping("/findByCondition")
    public String findByCondition(@RequestParam(defaultValue="1",required=true,value="pageNum")Integer pageNum,Model model,String eno,String startdate,String enddate){
        Integer pageSize=5;//每页显示记录数
        //分页查询
        PageHelper.startPage(pageNum, pageSize);
        List<Leaveifo> leaveifos = service.findByCondition(eno,startdate,enddate);//获取所有用户信息
        PageInfo<Leaveifo> pageInfo=new PageInfo<Leaveifo>(leaveifos);
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("ConditionEno",eno);
        model.addAttribute("ConditionStartDate",startdate);
        model.addAttribute("ConditionEndDate",enddate);

        //跳转解析页面
        return "showleaveifo";

    }




}




