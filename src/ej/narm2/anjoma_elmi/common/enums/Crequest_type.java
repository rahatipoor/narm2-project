package ej.narm2.anjoma_elmi.common.enums;

/**
 * Created by rahati on 1/2/16.
 */
public enum Crequest_type {
    PROPSE("پیشنهاد"),ORDOO("درخواست اردو"),HAMAYESH("درخواست همایش");
String name;

    Crequest_type(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
}
