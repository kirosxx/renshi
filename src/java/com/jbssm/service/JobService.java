package com.jbssm.service;


import com.jbssm.domain.Job;

import java.util.List;

public interface JobService {

    public List<Job> findAllJob();

    public int countByName(String jobname);

    public Job findByName(String jobname);

    public void updateJob(Job job);
}
