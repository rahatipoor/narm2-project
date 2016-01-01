package ej.narm2.anjoma_elmi.ui.enums;

public enum Mycookie {
    // -----------------------  REQUEST ATTRIBUTE
    lg("login"),



    ;//#############################################
    private String value;

    Mycookie(String value) {
        this.value = value;
    }

    public String val() {
        return value;
    }
}
