package ej.narm2.anjoma_elmi.ui;

import com.sun.xml.internal.ws.api.streaming.XMLStreamReaderFactory;
import ej.narm2.anjoma_elmi.Db_ui;
import ej.narm2.anjoma_elmi.common.Crq;
import ej.narm2.anjoma_elmi.common.User;
import ej.narm2.anjoma_elmi.common.enums.Crequest_type;
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
@WebServlet(name = "rq_get",urlPatterns = "/rq_get")
public class rq_get extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        run(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        run(request,response);

    }

    private void run(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("1");
        User user;
        PrintWriter out = response.getWriter(  );
        response.setContentType("application/json");

        String token= URLHelper.getCookie(request, Mycookie.lg);
        if (request.getAttribute("user")==null) {
            user= Db_ui.getuser(token);
            URLHelper.setAttribute(request, Attribute.USER,user);
        }else {
            user= (User) URLHelper.getAttribute(request,Attribute.USER);
        }
Crq crq;
        if (user==null){
            request.getRequestDispatcher("jsp/login.jsp").forward(request, response);

        }else {
            String rq_type = null;
            int rq_id = 0;
            try {
               rq_type = request.getParameter("type");
                 rq_id = Integer.parseInt(request.getParameter("id"));
            }catch(Exception e){
            }
            Crequest_type type;
            System.out.println("2");

            if (rq_type!=null) {
                switch (rq_type) {
                    case "ordoo":
                        type = Crequest_type.ORDOO;
                        break;
                    case "hamayesh":
                        type = Crequest_type.HAMAYESH;
                        break;
                    case "propose":
                        type = Crequest_type.PROPSE;
                        break;
                    default:
                        type = null;
                        System.out.println(rq_type);

                        break;

                }
                if (type != null) {
                    crq = Db_ui.getCrq(type, rq_id, user);
                    if (crq != null) {
                        out.println(
                                "    {\"rq_id\":\"" + crq.getRq_id() + "\"" +
                                        ",    \"rq_type\":\"" + rq_type + "\"" +
                                        " ,   \"rq_type2\":\"" + crq.getRq_type2() + "\"" +
                                        "  ,  \"rq_title\":\"" + crq.getTitle() + "\"" +
                                        "   , \"rq_applicant\":\"" + crq.getRq_applicant() + "\"" +
                                        ",    \"rq_responsible\":\"" + crq.getRq_responsible() + "\"" +
                                        ",    \"rq_responsible_mobile\":\"" + crq.getRq_responsible_mobile() + "\"" +
                                        ",    \"rq_begin_date\":\"" + crq.getRq_begin_date() + "\"" +
                                        ",    \"rq_end_date\":\"" + crq.getRq_end_date() + "\"" +
                                        ",    \"rq_end_date\":\"" + crq.getRq_end_date() + "\"" +
                                        ",    \"rq_Videographers\":\"" + crq.getRq_Videographers() + "\"" +
                                        ",    \"rq_place\":\"" + crq.getRq_place() + "\"" +
                                        ",    \"rq_count_participants\":\"" + crq.getRq_count_participants() + "\"" +
                                        ",    \"rq_reception\":\"" + crq.getRq_reception() + "\"" +
                                        ",    \"rq_vehicles\":\"" + crq.getRq_vehicles() + "\"" +
                                        ",    \"rq_move_location\":\"" + crq.getRq_moveـlocation() + "\"" +
                                        ",    \"rq_comments\":\"" + crq.getRq_comments() + "\"" +
                                        ",    \"user_type\":\"" + user.getType().getName() + "\"" +
                                        "}");
                    }

//
//                }
                }
            }

        }
    }
}
