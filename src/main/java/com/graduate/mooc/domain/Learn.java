package com.graduate.mooc.domain;

public class Learn {
    private String lno;
    private String sno;
    private String taskno;
    private int grade;
    private String gra;

    @Override
    public String toString() {
        return "Learn{" +
                "lno='" + lno + '\'' +
                ", sno='" + sno + '\'' +
                ", taskno='" + taskno + '\'' +
                ", gra='" + gra + '\'' +
                '}';
    }

    public String getGra(){
        if(grade==-1)
            return "未开放考试";
        return String.valueOf(grade);
    }

    public String getLno() {
        return lno;
    }

    public void setLno(String lno) {
        this.lno = lno;
    }

    public String getSno() {
        return sno;
    }

    public void setSno(String sno) {
        this.sno = sno;
    }

    public String getTaskno() {
        return taskno;
    }

    public void setTaskno(String taskno) {
        this.taskno = taskno;
    }

    public int getGrade() {
        return grade;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }
}
