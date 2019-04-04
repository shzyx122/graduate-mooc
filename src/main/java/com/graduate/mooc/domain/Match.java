package com.graduate.mooc.domain;

public class Match {
    private String mno;
    private String sno;
    private Subject subject;
    //private String subno;
    //private String taskno;
    private Task task;
    private String choice;
    private int state;
    private int percent;

    //sno  taskno 是不是可以一起拼接成learn。lno

    public int getPercent() {
        return percent;
    }

    public void setPercent(int percent) {
        this.percent = percent;
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject sub) {
        this.subject = sub;
    }

    public Task getTask() {
        return task;
    }

    public void setTask(Task task) {
        this.task = task;
    }
    /*public String getTaskno() {
        return taskno;
    }

    public void setTaskno(String taskno) {
        this.taskno = taskno;
    }*/

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

    /*public String getSubno() {
        return subno;
    }

    public void setSubno(String subno) {
        this.subno = subno;
    }*/

    @Override
    public String toString() {
        return "Match{" +
                "mno='" + mno + '\'' +
                ", sno='" + sno + '\'' +
                ", sub=" + subject +
                ", task=" + task +
                ", choice='" + choice + '\'' +
                ", state=" + state +
                '}';
    }
}
