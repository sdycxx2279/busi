package com.dingzhang.model;

/**
 * @author Xiao Xu
 * @create 2017-08-05 18:40
 **/

public class Menu {
    private int id;
    private int parent_id;
    private int status;
    private String controller;
    private String method;
    public String name;

    public Menu() {
    }

    public Menu(int parent_id, int status, String controller, String method, String name) {
        this.parent_id = parent_id;
        this.status = status;
        this.controller = controller;
        this.method = method;
        this.name = name;
    }

    public int getId() {

        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getParent_id() {
        return parent_id;
    }

    public void setParent_id(int parent_id) {
        this.parent_id = parent_id;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getController() {
        return controller;
    }

    public void setController(String controller) {
        this.controller = controller;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Menu{" +
                "id=" + id +
                ", parent_id=" + parent_id +
                ", status=" + status +
                ", controller='" + controller + '\'' +
                ", method='" + method + '\'' +
                ", name='" + name + '\'' +
                '}';
    }
}
