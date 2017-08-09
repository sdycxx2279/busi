package com.dingzhang.model;

import java.util.Date;

/**
 * @author Xiao Xu
 * @create 2017-08-05 17:48
 **/

public class Enterprise {
    private int id;
    private String name;
    private String description;
    private double lng;
    private double lat;
    private int level;
    private String leader;
    private String call_leader;
    private String photo_leader;
    private String member;
    private String call_member;
    private String photo_member;
    private String boss;
    private String call_boss;
    private String photo_boss;
    private int type;
    private Date deadline;
    private String question1;
    private String question2;
    private String question3;
    private String question4;
    private String question5;

    public Enterprise() {
    }

    public Enterprise(String name, String description,double lng, double lat,int level, String leader, String call_leader, String photo_leader, String member, String call_member, String photo_member, String boss, String call_boss, String photo_boss, int type, Date deadline, String question1, String question2, String question3, String question4, String question5) {
        this.name = name;
        this.description = description;
        this.lng = lng;
        this.lat = lat;
        this.level = level;
        this.leader = leader;
        this.call_leader = call_leader;
        this.photo_leader = photo_leader;
        this.member = member;
        this.call_member = call_member;
        this.photo_member = photo_member;
        this.boss = boss;
        this.call_boss = call_boss;
        this.photo_boss = photo_boss;
        this.type = type;
        this.deadline = deadline;
        this.question1 = question1;
        this.question2 = question2;
        this.question3 = question3;
        this.question4 = question4;
        this.question5 = question5;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getLng() {
        return lng;
    }

    public void setLng(double lng) {
        this.lng = lng;
    }

    public double getLat() {
        return lat;
    }

    public void setLat(double lat) {
        this.lat = lat;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public String getLeader() {
        return leader;
    }

    public void setLeader(String leader) {
        this.leader = leader;
    }

    public String getCall_leader() {
        return call_leader;
    }

    public void setCall_leader(String call_leader) {
        this.call_leader = call_leader;
    }

    public String getPhoto_leader() {
        return photo_leader;
    }

    public void setPhoto_leader(String photo_leader) {
        this.photo_leader = photo_leader;
    }

    public String getMember() {
        return member;
    }

    public void setMember(String member) {
        this.member = member;
    }

    public String getCall_member() {
        return call_member;
    }

    public void setCall_member(String call_member) {
        this.call_member = call_member;
    }

    public String getPhoto_member() {
        return photo_member;
    }

    public void setPhoto_member(String photo_member) {
        this.photo_member = photo_member;
    }

    public String getBoss() {
        return boss;
    }

    public void setBoss(String boss) {
        this.boss = boss;
    }

    public String getCall_boss() {
        return call_boss;
    }

    public void setCall_boss(String call_boss) {
        this.call_boss = call_boss;
    }

    public String getPhoto_boss() {
        return photo_boss;
    }

    public void setPhoto_boss(String photo_boss) {
        this.photo_boss = photo_boss;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public Date getDeadline() {
        return deadline;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }

    public String getQuestion1() {
        return question1;
    }

    public void setQuestion1(String question1) {
        this.question1 = question1;
    }

    public String getQuestion2() {
        return question2;
    }

    public void setQuestion2(String question2) {
        this.question2 = question2;
    }

    public String getQuestion3() {
        return question3;
    }

    public void setQuestion3(String question3) {
        this.question3 = question3;
    }

    public String getQuestion4() {
        return question4;
    }

    public void setQuestion4(String question4) {
        this.question4 = question4;
    }

    public String getQuestion5() {
        return question5;
    }

    public void setQuestion5(String question5) {
        this.question5 = question5;
    }

    @Override
    public String toString() {
        return "Enterprise{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", lng=" + lng +
                ", lat=" + lat +
                ", level=" + level +
                ", leader='" + leader + '\'' +
                ", call_leader='" + call_leader + '\'' +
                ", photo_leader='" + photo_leader + '\'' +
                ", member='" + member + '\'' +
                ", call_member='" + call_member + '\'' +
                ", photo_member='" + photo_member + '\'' +
                ", boss='" + boss + '\'' +
                ", call_boss='" + call_boss + '\'' +
                ", photo_boss='" + photo_boss + '\'' +
                ", type=" + type +
                ", deadline=" + deadline +
                ", question1='" + question1 + '\'' +
                ", question2='" + question2 + '\'' +
                ", question3='" + question3 + '\'' +
                ", question4='" + question4 + '\'' +
                ", question5='" + question5 + '\'' +
                '}';
    }
}
