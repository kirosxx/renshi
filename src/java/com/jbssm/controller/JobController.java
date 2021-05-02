package com.jbssm.controller;


import com.jbssm.domain.Job;
import com.jbssm.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/job")
public class JobController {

    @Autowired
    private JobService service;


    @RequestMapping("/findAll")
    public String findAllJob(Model model) {

        List<Job> jobs = service.findAllJob();

        for (int i = 0; i < jobs.size(); i++) {
            int count = service.countByName(jobs.get(i).getJobname());
            jobs.get(i).setJobnum(String.valueOf(count));
        }

        model.addAttribute("jobs", jobs);

        return "showjob";
    }


    @RequestMapping("/dsFindAll")
    public String dsFindAllJob(Model model) {

        List<Job> jobs = service.findAllJob();

        for (int i = 0; i < jobs.size(); i++) {
            int count = service.countByName(jobs.get(i).getJobname());
            jobs.get(i).setJobnum(String.valueOf(count));
        }

        model.addAttribute("jobs", jobs);

        return "dsshowjob";
    }


    @RequestMapping("/findByName")
    public String findByName(String jobname,Model model){
        Job job= service.findByName(jobname);
        int count = service.countByName(jobname);
        job.setJobnum(String.valueOf(count));

        model.addAttribute("job",job);
        return "updatejob";
    }

    @RequestMapping("/updateJob")
    public String updateJob(Job job){
        service.updateJob(job);
        return "redirect:/job/dsFindAll";
    }

}
