package com.dingzhang.model;

/**
 * @author Xiao Xu
 * @create 2017-08-03 15:46
 **/

public class User {
    private int id;
    private String username;
    private String password;
    private String nickname;
    private int ad;

    public User() {
    }

    public User(String username, String password, String nickname, int ad) {
        this.username = username;
        this.password = password;
        this.nickname = nickname;
        this.ad =ad;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", nickname='" + nickname + '\'' +
                ", ad=" + ad +
                '}';
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getPassword() {

        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsername() {

        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getId() {

        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAd() {
        return ad;
    }

    public void setAd(int ad) {
        this.ad = ad;
    }
}
