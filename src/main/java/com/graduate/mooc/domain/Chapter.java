package com.graduate.mooc.domain;

public class Chapter {
    private String chid;
    private String chname;
    private String cid;         //应该也要换成实体
    private int exstate;
    private String video;

    public String getChid() {
        return chid;
    }

    public void setChid(String chid) {
        this.chid = chid;
    }

    public String getChname() {
        return chname;
    }

    public void setChname(String chname) {
        this.chname = chname;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public int getExstate() {
        return exstate;
    }

    public void setExstate(int exstate) {
        this.exstate = exstate;
    }

    public String getVideo() {
        return video;
    }

    public void setVideo(String video) {
        this.video = video;
    }



    @Override
    public String toString() { //"child='"+child+"',chname='"+....
        return "Chapter{" +
                "chid='" + chid + '\'' +", chname='" + chname + '\'' +
                ", cid='" + cid + '\'' +
                ", video='" + video + '\'' +
                ", ex='" + exstate + '\'' +
                '}';
    }
}
