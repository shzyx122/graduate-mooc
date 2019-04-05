package com.graduate.mooc.domain;

public class Learn {
    private String lno;
    private double grade;
    private Task task;
    private Student stu;

    public Student getStu() {
        return stu;
    }

    public void setStu(Student stu) {
        this.stu = stu;
    }

    @Override
    public String toString() {
        return "Learn{" +
                "lno='" + lno + '\'' +
                ", stu='" + stu + '\'' +
                ", task='"+task+"\'"+
                //", taskno='" + taskno + '\'' +
                ", grade='" + grade + '\'' +
                '}';
    }


    public String getLno() {
        return lno;
    }

    public void setLno(String lno) {
        this.lno = lno;
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

    public double getGrade() {
        return grade;
    }

    public void setGrade(double grade) {
        this.grade = grade;
    }
}
