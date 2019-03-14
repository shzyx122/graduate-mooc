package com.graduate.mooc.domain;

import java.util.List;

public class Student {
    private String sno;
    private String name;
    private String pass;
    private List<Learn> learn;

//要去map定义
    public List<Learn> getLearn() {
        return learn;
    }

    public void setLearn(List<Learn> learn) {
        this.learn = learn;
    }

    @Override
    public String toString() {
        return "Student{" +
                "sno='" + sno + '\'' +
                ", name='" + name + '\'' +
                '}';
    }

    public String getSno() {
        return sno;
    }

    public void setSno(String sno) {
        this.sno = sno;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }
}
