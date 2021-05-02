package com.jbssm.dao;

import com.jbssm.domain.Leaveaapli;
import com.jbssm.domain.Leaveifo;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LeaveifoDao {

    @Select("select * from leaveifo")
    public List<Leaveifo> findAllLeaveifo();

    @Select(" select * from leaveappli ")
    public List<Leaveaapli> findAllLeaveappli();

    @Insert(" insert into leaveifo values(null,#{eno},#{ename},#{startdate},#{enddate},#{type},#{agreer}) ")
    public void addleaveifo(Leaveifo leaveifo);

    @Insert(" insert into leaveappli values(null,#{eno},#{ename},#{startdate},#{enddate},#{type},'待审核','') ")
    public void ygleaveappli(Leaveaapli leaveaapli);

    @Delete(" delete from leaveifo where id = #{id} ")
    public void deleteleaveifo(int id);

    @Select(" select * from leaveifo where id = #{id} ")
    public Leaveifo findById(int id);

    @Select(" select * from leaveappli where id = #{id} ")
    public Leaveaapli findLeaveappliById(int id);

    @Update(" update leaveifo set eno = #{eno} , ename=#{ename},startdate=#{startdate},enddate=#{enddate},type=#{type},agreer=#{agreer} where id = #{id} ")
    public void updateLeaveifo(Leaveifo leaveifo);

    @Update(" update leaveappli set agreer = #{agreer},yesorno = '已通过' where id = #{id} ")
    public void agreeLeaveappli(@Param("id")int id, @Param("agreer")String agreer);

    @Update(" update leaveappli set agreer = #{agreer},yesorno = '申请已被拒绝' where id = #{id} ")
    public void disagreeLeaveappli(@Param("id")int id, @Param("agreer")String agreer);

    @Select({"<script> " +
            "select * from leaveifo " +
            "where  1=1 " +
            "<if test='eno!=null and eno!=&quot;&quot; '> and eno = #{eno}</if> " +
            "<if test='startdate!=null and startdate!=&quot;&quot; '> and startdate <![CDATA[>=]]> #{startdate}</if> " +
            "<if test='enddate!=null and enddate!=&quot;&quot; '> and enddate <![CDATA[<=]]> #{enddate}</if> " +
            "</script>"})
    public List<Leaveifo> findByCondition(@Param("eno") String eno, @Param("startdate") String startdate, @Param("enddate")String enddate);
}
