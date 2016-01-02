package ej.narm2.anjoma_elmi.common;

import ej.narm2.anjoma_elmi.common.enums.User_type;

/**
 * Created by rahati on 1/1/16.
 */
public class User {
    String name;
    String username;
    String pass;
    String token;
    public User_type type;


    public String getPass() {
        return pass;
    }


    public String getName() {
        return name;
    }

    public String getUsername() {
        return username;
    }

    public String getToken() {
        return token;
    }

    public User_type getType() {
        return type;
    }

    public User(String name, String username, String pass, String token, User_type type) {
        this.name = name;
        this.username = username;
        this.pass = pass;
        this.token = token;
        this.type = type;
    }
}
