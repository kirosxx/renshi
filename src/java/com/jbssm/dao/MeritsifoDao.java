package com.jbssm.dao;

import com.jbssm.domain.Meritsifo;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MeritsifoDao {

    @Select("select * from meritsifo")
    public List<Meritsifo> findAllMeritsifo();

    @Insert(" insert into meritsifo values(null,#{eno},#{ename},#{date},#{type},#{reason}) ")
    public void addMeritsifo(Meritsifo meritsifo);

    @Delete(" delete from meritsifo where id = #{id} ")
    public void deleteMeritsifo(int id);

    @Select(" select * from meritsifo where id = #{id} ")
    public Meritsifo findById(int id);

    @Update(" update meritsifo set eno = #{eno} , ename=#{ename},date=#{date},type=#{type},reason=#{reason} where id = #{id} ")
    public void updateMeritsifo(Meritsifo meritsifo);

    @Select({"<script> " +
            "select * from meritsifo " +
            "where  1=1 " +
            "<if test='eno!=null and eno!=&quot;&quot; '> and eno = #{eno}</if> " +
            "<if test='date!=null and date!=&quot;&quot; '> and date = #{date}</if> " +
            "</script>"})
    public List<Meritsifo> findByCondition(@Param("eno")String eno, @Param("date")String date);
}
