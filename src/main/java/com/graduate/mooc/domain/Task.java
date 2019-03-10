package com.graduate.mooc.domain;

import java.time.LocalDateTime;

public class Task {
    private String taskno;
    private LocalDateTime begin;
    private LocalDateTime end;
    //private String cid;
    private Course course; //一对一，直接用对象

    @Override
    public String toString() {
        return "Task{" +
                "taskno='" + taskno + '\'' +
                ", begin=" + begin +
                ", end=" + end +
               // ", cid='" + cid + '\'' +
                '}';
    }

    public String getTaskno() {
        return taskno;
    }

    public void setTaskno(String taskno) {
        this.taskno = taskno;
    }

    public LocalDateTime getBegin() {
        return begin;
    }

    public void setBegin(LocalDateTime begin) {
        this.begin = begin;
    }

    public LocalDateTime getEnd() {
        return end;
    }

    public void setEnd(LocalDateTime end) {
        this.end = end;
    }

   /* public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }*/

    public Course getCou() {
        return course;
    }

    public void setCou(Course cou) {
        this.course = cou;
    }
}
