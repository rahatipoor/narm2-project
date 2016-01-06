package ej.narm2.anjoma_elmi;

import ej.narm2.anjoma_elmi.common.Crequest;
import ej.narm2.anjoma_elmi.common.Crq;
import ej.narm2.anjoma_elmi.common.User;
import ej.narm2.anjoma_elmi.common.enums.Crequest_type;
import ej.narm2.anjoma_elmi.common.enums.User_type;

/**
 * Created by rahati on 1/1/16.
 */
public class Db_ui {

    //login user

    // return :
    // valid user : token
    //invalid user : exception
    public static User getuser(String user, String pass) {
        return new User("محمد","rahatipoor","123","a235", User_type.NORMAL);

    }
    //user identify

    // return :
    // valid user : user class
    //invalid user : null
    public static User getuser(String token) {
        if("a235".equals(token))
        return new User("محمد","rahatipoor","123","a235", User_type.SECRETARY);
        else {
            return null;
        }
    }
// get user request list
    //user is a user class
    // rq is a string in User_type enum > menu like events,signs and ...
      public static Crequest[] getrequests(User user, String rq) {

        return new Crequest[] {new Crequest(Crequest_type.HAMAYESH,"سلام","2.10",123)};
    }
// return current date
    public static String getcurrentdaye() {
        return "";
    }
//get request details
    public static Crq getCrq(Crequest_type ordoo, int rq_id, User user) {

        return new Crq(Crequest_type.ORDOO,"عنوان",123,"نوع","درخواست ..","مسئول","0930","2016-12-31T22:59","2017-01-01T23:01","فیلم بردارali","fajr",12,true,true,"123","256");

    }
//set request(crq)
    public static void setCrq(Crq crq, User user) {
    }
}
