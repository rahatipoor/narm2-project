package ej.narm2.anjoma_elmi.common.enums;

/**
 * Created by rahati on 1/2/16.
 */
public enum Crequest_type {
    PROPSE("پیشنهاد","propose"),ORDOO("درخواست اردو","ordoo"),HAMAYESH("درخواست همایش","hamayesh");
String name;
    String enname;

    Crequest_type(String name, String enname) {
        this.name = name;
        this.enname = enname;
    }

    public String getName() {
        return name;
    }

    public String getEnname() {
        return enname;
    }
}
