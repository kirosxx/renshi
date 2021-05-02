package com.jbssm.service.impl;

import com.jbssm.dao.JobDao;
import com.jbssm.domain.Job;
import com.jbssm.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JobServiceImpl implements JobService {

    @Autowired
    private JobDao dao;

    @Override
    public List<Job> findAllJob() {

        return dao.findAllJob();
    }

    @Override
    public int countByName(String jobname) {

        return dao.countByName(jobname);
    }

    @Override
    public Job findByName(String jobname) {

       return dao.findByName(jobname);
    }

    @Override
    public void updateJob(Job job) {
        dao.updateJob(job);
    }
}
