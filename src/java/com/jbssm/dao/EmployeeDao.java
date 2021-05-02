package com.jbssm.dao;

import com.jbssm.domain.Employee;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 用户持久层接口
 */
@Repository
public interface EmployeeDao {

    @Select(" select * from employee  ")
    public List<Employee> findAllEmployee();

    @Insert(" insert into employee values(#{eno},#{ename},#{sex},#{wyear},#{wages},#{job},#{merits}) ")
    public int addEmployee(Employee employee);

    @Delete(" delete from employee where eno = #{eno} ")
    public int deleteEmployee(String eno);

    @Select(" select * from employee where eno = #{eno} ")
    public Employee findByEno(String eno);

    @Update(" update  employee set ename=#{ename},sex=#{sex},wyear=#{wyear},wages=#{wages},job=#{job},merits=#{merits} where eno=#{eno} ")
    public int updateEmployee(Employee employee);

    @Select({"<script> " +
            "select * from employee " +
            "where  1=1 " +
            "<if test='ename!=null and ename!=&quot;&quot; '> and ename like concat('%',#{ename},'%')</if> " +
            "<if test='job!=null and job!=&quot;&quot; '> and job = #{job}</if> " +
            "</script>"})
    public List<Employee> findByCondition(@Param("ename")String ename, @Param("job")String job);
}