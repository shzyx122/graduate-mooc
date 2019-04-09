package com.graduate.mooc.domain;

import java.sql.Time;

/**
 * Created by Chao Wax on 2019/3/24
 */
public class Video {  //好像是个多对多
    private String vno;
    private String chid;
    private String sno;
    private int    play;
    private Time   time;
    private String taskno;

    public String getTaskno() {
        return taskno;
    }

    public void setTaskno(String taskno) {
        this.taskno = taskno;
    }
    public String getVno() {
        return vno;
    }

    public void setVno(String vno) {
        this.vno = vno;
    }

    public String getChid() {
        return chid;
    }

    public void setChid(String chid) {
        this.chid = chid;
    }

    public String getSno() {
        return sno;
    }

    public void setSno(String sno) {
        this.sno = sno;
    }



    public int getPlay() {
        return play;
    }

    public void setPlay(int play) {
        this.play = play;
    }

    public Time getTime() {
        return time;
    }

    public void setTime(Time time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "Video{" +
                "vno='" + vno + '\'' +
                ", chid='" + chid + '\'' +
                ", sno='" + sno + '\'' +

                ", play=" + play +
                ", time=" + time +
                '}';
    }
}
