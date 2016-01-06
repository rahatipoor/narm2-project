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
import java.io.PrintWriter;

/**
 * Created by rahati on 1/2/16.
 */
@WebServlet(name = "rq_submit",urlPatterns = "/rq_submit")
public class rq_submit extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        run(request,response);

    }



    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        run(request,response);

    }
    private void run(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user;
        PrintWriter out = response.getWriter(  );
        response.setContentType("application/json");
String error="";
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
             //   rq_id = Integer.valueOf(request.getParameter("rq_id"));
                String rq_type = request.getParameter("rq_type");
                if (rq_type.isEmpty()){
                    error+="درخواست نامعتبر است\n";
                }
                String rq_type2 = request.getParameter("rq_type2");
                if (rq_type.isEmpty()){
                    error+="نوع درخواست را مشخص کنید\n";
                }
                String rq_title = request.getParameter("rq_title");
                if (rq_title.isEmpty()){
                    error+="عنوان درخواست را مشخص کنید\n";
                }
                String rq_applicant = request.getParameter("rq_applicant");
                if (rq_applicant.isEmpty()){
                    error+=" درخواست دهنده را مشخص کنید\n";
                }
                String rq_responsible = request.getParameter("rq_responsible");
                if (rq_responsible.isEmpty()){
                    error+="  مسئول برنامه را مشخص کنید\n";
                }
                String tmp = request.getParameter("rq_responsible_mobile");
                String rq_responsible_mobile = null;
                if (tmp.isEmpty()||tmp.length()!=11){
                    error+="همراه  مسئول برنامه را مشخص کنید\n";
                     rq_responsible_mobile=tmp;
                }
                String rq_begin_date = request.getParameter("rq_begin_date");
                if (rq_begin_date.isEmpty()){
                    error+="زمان شروع برنامه را مشخص کنید\n";
                }
                String rq_end_date = request.getParameter("rq_end_date");
                if (rq_end_date.isEmpty()){
                    error+="زمان پایان برنامه را مشخص کنید\n";
                }
                String rq_Videographers = request.getParameter("rq_Videographers");
                String rq_place = request.getParameter("rq_place");
                if (rq_place.isEmpty()){
                    error+="مکان برنامه را مشخص کنید\n";
                }
                int rq_count_participants = Integer.parseInt(request.getParameter("rq_count_participants"));
                if (rq_place.isEmpty()){
                    error+="تعد شرکت کنندگان  برنامه را مشخص کنید\n";
                }
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
                    Db_ui.setCrq(new Crq(type, rq_title, rq_type2, rq_applicant, rq_responsible, rq_responsible_mobile, rq_begin_date, rq_end_date, rq_Videographers, rq_place, rq_count_participants, rq_reception, rq_vehicles, rq_moveـlocation, rq_comments),user);
                    out.println(
                            "    {\"er\":\"" + error + "\"" +

                                    "}");
                }
            }
        }
  }
}
