package ej.narm2.anjoma_elmi.common.enums;

/**
 * Created by rahati on 1/1/16.
 */
public enum User_type {
    NORMAL(new String[][]{
            {"events","رویداد ها"},
            {"signs", "ثبت نام شده"},
            {"archive","بایگانی"}
    }),
    SECRETARY(new String[][]{
            {"waiting","در انتظار"},
            {"working","در گردش"},
            {"archive","آرشیو"},
            {"proposes","پیشنهاد ها"}
    }),
    DIRECTOR(new String[][]{
            {"waiting","در انتظار"},
            {"archive","آرشیو"}
    });


    private String[][] menu;


    User_type(String[][] menu) {
        this.menu = menu;
    }

    public String[][] getMenu() {
        return menu;
    }
}
