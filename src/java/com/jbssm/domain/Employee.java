package com.jbssm.domain;

import java.io.Serializable;

public class Employee implements Serializable {
    private String eno;
    private String ename;
    private String sex;
    private String wyear;
    private int wages;
    private String job;
    private String merits;

    public String getEno() {
        return eno;
    }

    public void setEno(String eno) {
        this.eno = eno;
    }

    public String getEname() {
        return ename;
    }

    public void setEname(String ename) {
        this.ename = ename;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getWyear() {
        return wyear;
    }

    public void setWyear(String wyear) {
        this.wyear = wyear;
    }

    public int getWages() {
        return wages;
    }

    public void setWages(int wages) {
        this.wages = wages;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public String getMerits() {
        return merits;
    }

    public void setMerits(String merits) {
        this.merits = merits;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "eno='" + eno + '\'' +
                ", ename='" + ename + '\'' +
                ", sex='" + sex + '\'' +
                ", wyear='" + wyear + '\'' +
                ", wages=" + wages +
                ", job='" + job + '\'' +
                ", merits='" + merits + '\'' +
                '}';
    }
}
