package com.graduate.mooc.domain;

public class Match {
    private String mno;
    private String sno;
    private String subno;
    private String taskno;
    private String choice;
    private int state;

    public String getTaskno() {
        return taskno;
    }

    public void setTaskno(String taskno) {
        this.taskno = taskno;
    }

    public String getChoice() {
        return choice;
    }

    public void setChoice(String choice) {
        this.choice = choice;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    @Override

    public String toString() {
        return "Match{" +
                "mno='" + mno + '\'' +
                ", sno='" + sno + '\'' +
                ", subno='" + subno + '\'' +
                '}';
    }

    public String getMno() {
        return mno;
    }

    public void setMno(String mno) {
        this.mno = mno;
    }

    public String getSno() {
        return sno;
    }

    public void setSno(String sno) {
        this.sno = sno;
    }

    public String getSubno() {
        return subno;
    }

    public void setSubno(String subno) {
        this.subno = subno;
    }
}
