package com.jbssm.domain;

import java.io.Serializable;

public class Job implements Serializable {
    private String jobname;
    private String jobdescri;  //岗位简介
    private String jobnum;  //岗位人数

    public String getJobname() {
        return jobname;
    }

    public void setJobname(String jobname) {
        this.jobname = jobname;
    }

    public String getJobdescri() {
        return jobdescri;
    }

    public void setJobdescri(String jobdescri) {
        this.jobdescri = jobdescri;
    }

    public String getJobnum() {
        return jobnum;
    }

    public void setJobnum(String jobnum) {
        this.jobnum = jobnum;
    }

    @Override
    public String toString() {
        return "Job{" +
                "jobname='" + jobname + '\'' +
                ", jobdescri='" + jobdescri + '\'' +
                ", jobnum='" + jobnum + '\'' +
                '}';
    }
}
