package com.graduate.mooc.domain;

public class Subject {
    private String subno;
    private String question;
    private String answer;
    private String aitem;
    private String bitem;
    private String citem;
    private String ditem;
    private String path;
    private int percent;
    private Chapter chapter;

    public Chapter getChapter() {
        return chapter;
    }

    public void setChapter(Chapter chapter) {
        this.chapter = chapter;
    }

    public int getPercent() {
        return percent;
    }

    public void setPercent(int percent) {
        this.percent = percent;
    }

    @Override
    public String toString() {
        return "Subject{" +
                "subno='" + subno + '\'' +
                ", question='" + question + '\'' +
                ", answer='" + answer + '\'' +
                ", chid='" + chapter.getChid() + '\'' +
                '}';
    }

    public String getSubno() {
        return subno;
    }

    public void setSubno(String subno) {
        this.subno = subno;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public String getAitem() {
        return aitem;
    }

    public void setAitem(String aitem) {
        this.aitem = aitem;
    }

    public String getBitem() {
        return bitem;
    }

    public void setBitem(String bitem) {
        this.bitem = bitem;
    }

    public String getCitem() {
        return citem;
    }

    public void setCitem(String citem) {
        this.citem = citem;
    }

    public String getDitem() {
        return ditem;
    }

    public void setDitem(String ditem) {
        this.ditem = ditem;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    /*public String getChid() {
        return chid;
    }

    public void setChid(String chid) {
        this.chid = chid;
    }*/
}
