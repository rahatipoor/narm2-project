package ej.narm2.anjoma_elmi.common.enums;

/**
 * Created by rahati on 1/1/16.
 */
public enum User_type {
    NORMAL(new String[][]{
            {"events","رویداد ها"},
            {"signs", "ثبت نام شده"},
            {"archive","بایگانی"}
    },"normal"),
    SECRETARY(new String[][]{
//            {"waiting","در انتظار"},
            {"working","در گردش"},
            {"archive","آرشیو"},
            {"proposes","پیشنهاد ها"}
    },"secretary"),
    farhangi_DIRECTOR(new String[][]{
            {"waiting","در انتظار"},
            {"archive","آرشیو"}
    },"farhangi_director"),
    salon_DIRECTOR(new String[][]{
        {"waiting","در انتظار"},
        {"archive","آرشیو"}
    },"salon_director"),
    anbar_DIRECTOR(new String[][]{
        {"waiting","در انتظار"},
        {"archive","آرشیو"}
    },"anbar_director"),
    vehicle_DIRECTOR(new String[][]{
        {"waiting","در انتظار"},
        {"archive","آرشیو"}
    },"vehicle_director");


    private String[][] menu;
    private  String name;


    User_type(String[][] menu, String name) {
        this.menu = menu;
        this.name = name;
    }

    public String[][] getMenu() {
        return menu;
    }

    public String getName() {
        return name;
    }
}
