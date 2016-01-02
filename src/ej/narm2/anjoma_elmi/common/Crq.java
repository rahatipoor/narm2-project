package ej.narm2.anjoma_elmi.common;

import ej.narm2.anjoma_elmi.Db_ui;
import ej.narm2.anjoma_elmi.common.enums.Crequest_type;

/**
 * Created by rahati on 1/2/16.
 */
public class Crq extends Crequest{
    int rq_id;
    String rq_type2;
    String rq_applicant;
    String rq_responsible;
    String rq_responsible_mobile;
    String rq_begin_date;
    String rq_end_date;
    String rq_Videographers;
    String rq_place;
    int rq_count_participants;
    boolean rq_reception;
    boolean rq_vehicles;
    String rq_moveـlocation;
    String rq_comments;
    public Crq(Crequest_type type, String title, String date) {
        super(type, title, date);
        
    }

    public Crq(Crequest_type type, String title, int rq_id, String rq_type2, String rq_applicant, String rq_responsible, String rq_responsible_mobile, String rq_begin_date, String rq_end_date, String rq_Videographers, String rq_place, int rq_count_participants, boolean rq_reception, boolean rq_vehicles, String rq_moveـlocation, String rq_comments) {
        super(type, title, Db_ui.getcurrentdaye());
        this.rq_id = rq_id;
        this.rq_type2 = rq_type2;
        this.rq_applicant = rq_applicant;
        this.rq_responsible = rq_responsible;
        this.rq_responsible_mobile = rq_responsible_mobile;
        this.rq_begin_date = rq_begin_date;
        this.rq_end_date = rq_end_date;
        this.rq_Videographers = rq_Videographers;
        this.rq_place = rq_place;
        this.rq_count_participants = rq_count_participants;
        this.rq_reception = rq_reception;
        this.rq_vehicles = rq_vehicles;
        this.rq_moveـlocation = rq_moveـlocation;
        this.rq_comments = rq_comments;
    }

    public int getRq_id() {
        return rq_id;
    }

    public String getRq_type2() {
        return rq_type2;
    }

    public String getRq_applicant() {
        return rq_applicant;
    }

    public String getRq_responsible() {
        return rq_responsible;
    }

    public String getRq_responsible_mobile() {
        return rq_responsible_mobile;
    }

    public String getRq_begin_date() {
        return rq_begin_date;
    }

    public String getRq_end_date() {
        return rq_end_date;
    }

    public String getRq_Videographers() {
        return rq_Videographers;
    }

    public String getRq_place() {
        return rq_place;
    }

    public int getRq_count_participants() {
        return rq_count_participants;
    }

    public boolean getRq_reception() {
        return rq_reception;
    }

    public boolean getRq_vehicles() {
        return rq_vehicles;
    }

    public String getRq_moveـlocation() {
        return rq_moveـlocation;
    }

    public String getRq_comments() {
        return rq_comments;
    }
}
