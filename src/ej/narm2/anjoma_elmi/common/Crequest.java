package ej.narm2.anjoma_elmi.common;

import ej.narm2.anjoma_elmi.common.enums.Crequest_type;

/**
 * Created by rahati on 1/2/16.
 */
public class Crequest {
    int rq_id;
    Crequest_type type;
    String date;
    String title;

    public Crequest_type getType() {
        return type;
    }

    public String getDate() {
        return date;
    }

    public String getTitle() {
        return title;
    }

    public Crequest( Crequest_type type, String title, String date ,int rq_id) {
        this.rq_id = rq_id;
        this.type = type;
        this.date = date;
        this.title = title;
    }
    public Crequest( Crequest_type type, String title, String date ) {

        this.type = type;
        this.date = date;
        this.title = title;
    }

    public int getRq_id() {
        return rq_id;
    }
}

