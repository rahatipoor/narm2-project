package ej.narm2.anjoma_elmi.ui.enums;


public enum Attribute {
    // -----------------------  REQUEST ATTRIBUTE


    Error("error"),
    MENU("menu"),
    USER("user"), CRQS("crqs");//#############################################
    private String value;

    Attribute(String value) {
        this.value = value;
    }

    public String val() {
        return value;
    }
}
