package ej.narm2.anjoma_elmi;

import ej.narm2.anjoma_elmi.common.User;

/**
 * Created by rahati on 1/1/16.
 */
public class Db_ui {
    //login user

    // return :
    // valid user : token
    //invalid user : exception
    public static String getuser(String user, String pass) {
        return user;

    }
    //user identify

    // return :
    // valid user : user class
    //invalid user : null
    public static User getuser(String token) {
        return new User();
    }
}
