package ej.narm2.anjoma_elmi.ui;

import ej.narm2.anjoma_elmi.Db_ui;
import ej.narm2.anjoma_elmi.common.Crq;
import ej.narm2.anjoma_elmi.common.User;
import ej.narm2.anjoma_elmi.common.enums.Crequest_type;
import ej.narm2.anjoma_elmi.common.enums.User_type;
import ej.narm2.anjoma_elmi.ui.enums.Attribute;
import ej.narm2.anjoma_elmi.ui.enums.Mycookie;
import ej.narm2.anjoma_elmi.ui.tools.URLHelper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by rahati on 1/2/16.
 */
@WebServlet(name = "rq_submit")
public class rq_submit extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        run(request,response);

    }



    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        run(request,response);

    }
    private void run(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user;


        String token= URLHelper.getCookie(request, Mycookie.lg);
        if (request.getAttribute("user")==null) {
            user= Db_ui.getuser(token);
            URLHelper.setAttribute(request, Attribute.USER,user);
        }else {
            user= (User) URLHelper.getAttribute(request,Attribute.USER);
        }

        if (user==null){
            request.getRequestDispatcher("jsp/login.jsp").forward(request, response);

        }else {
            if (user.type == User_type.SECRETARY) {

                Crequest_type type = null;
                int rq_id;
                rq_id = Integer.valueOf(request.getParameter("rq_id"));
                String rq_type = request.getParameter("rq_type");
                String rq_type2 = request.getParameter("rq_type2");
                String rq_title = request.getParameter("rq_title");
                String rq_applicant = request.getParameter("rq_applicant");
                String rq_responsible = request.getParameter("rq_responsible");
                String rq_responsible_mobile = request.getParameter("rq_responsible_mobile");
                String rq_begin_date = request.getParameter("rq_begin_date");
                String rq_end_date = request.getParameter("rq_end_date");
                String rq_Videographers = request.getParameter("rq_Videographers");
                String rq_place = request.getParameter("rq_place");
                int rq_count_participants = Integer.parseInt(request.getParameter("rq_count_participants"));
                boolean rq_reception = request.getParameter("rq_reception") != null;
                boolean rq_vehicles = request.getParameter("rq_vehicles") != null;
                String rq_moveـlocation = request.getParameter("rq_moveـlocation");
                String rq_comments = request.getParameter("rq_comments");
                if ("ordoo".equals(rq_type)) {
                    type = Crequest_type.ORDOO;
                } else {
                    if ("hamayesh".equals(rq_type)) {
                        type = Crequest_type.HAMAYESH;
                    }
                }
                if (type != null) {
                    Db_ui.setCrq(new Crq(type, rq_title, rq_id, rq_type2, rq_applicant, rq_responsible, rq_responsible_mobile, rq_begin_date, rq_end_date, rq_Videographers, rq_place, rq_count_participants, rq_reception, rq_vehicles, rq_moveـlocation, rq_comments),user);
                }
            }
        }
  }
}
