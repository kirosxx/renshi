package com.jbssm.domain;

import java.io.Serializable;


public class Leaveaapli implements Serializable {

    private int id;
    private String eno;
    private String ename;
    private String startdate;
    private String enddate;
    private String type;
    private String yesorno;
    private String agreer;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

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

    public String getStartdate() {
        return startdate;
    }

    public void setStartdate(String startdate) {
        this.startdate = startdate;
    }

    public String getEnddate() {
        return enddate;
    }

    public void setEnddate(String enddate) {
        this.enddate = enddate;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getYesorno() {
        return yesorno;
    }

    public void setYesorno(String yesorno) {
        this.yesorno = yesorno;
    }

    public String getAgreer() {
        return agreer;
    }

    public void setAgreer(String agreer) {
        this.agreer = agreer;
    }

    @Override
    public String toString() {
        return "Leaveaapli{" +
                "id=" + id +
                ", eno='" + eno + '\'' +
                ", ename='" + ename + '\'' +
                ", startdate='" + startdate + '\'' +
                ", enddate='" + enddate + '\'' +
                ", type='" + type + '\'' +
                ", yesorno='" + yesorno + '\'' +
                ", agreer='" + agreer + '\'' +
                '}';
    }
}
