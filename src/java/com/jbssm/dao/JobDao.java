package com.jbssm.dao;


import com.jbssm.domain.Job;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface JobDao {

    @Select(" select * from job ")
    public List<Job> findAllJob();

    @Select(" select count(*) from employee where job = #{jobname} ")
    public int countByName(String jobname);

    @Select(" select * from job where jobname = #{jobname} ")
    public Job findByName(String jobname);

    @Update(" update job set jobnum = #{jobnum},jobdescri = #{jobdescri} where jobname=#{jobname}")
    public void updateJob(Job job);
}
