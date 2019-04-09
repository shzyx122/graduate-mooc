package com.graduate.mooc.domain;

/**
 * Created by Chao Wax on 2019/4/1
 */
public class Chscore {
    private String csno;
    private String sno;
    private String chid;
    private int score;
    private String taskno;

    public String getTaskno() {
        return taskno;
    }

    public void setTaskno(String taskno) {
        this.taskno = taskno;
    }

    public String getCsno() {
        return csno;
    }

    public void setCsno(String csno) {
        this.csno = csno;
    }

    public String getSno() {
        return sno;
    }

    public void setSno(String sno) {
        this.sno = sno;
    }

    public String getChid() {
        return chid;
    }

    public void setChid(String chid) {
        this.chid = chid;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    @Override
    public String toString() {
        return "Chscore{" +
                "csno='" + csno + '\'' +
                ", sno='" + sno + '\'' +
                ", chid='" + chid + '\'' +
                ", score=" + score +
                '}';
    }
}
