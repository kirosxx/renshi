package com.jbssm.domain;

import java.io.Serializable;

public class Meritsifo implements Serializable {
    private int id;
    private String eno;
    private String ename;
    private String date;
    private String type;
    private String reason;

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

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    @Override
    public String toString() {
        return "Meritsifo{" +
                "id=" + id +
                ", eno='" + eno + '\'' +
                ", ename='" + ename + '\'' +
                ", date='" + date + '\'' +
                ", type='" + type + '\'' +
                ", reason='" + reason + '\'' +
                '}';
    }
}
