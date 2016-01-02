package ej.narm2.anjoma_elmi.ui;

import ej.narm2.anjoma_elmi.Db_ui;
import ej.narm2.anjoma_elmi.common.Crequest;
import ej.narm2.anjoma_elmi.common.User;
import ej.narm2.anjoma_elmi.ui.enums.Attribute;
import ej.narm2.anjoma_elmi.ui.enums.Mycookie;
import ej.narm2.anjoma_elmi.ui.tools.StringHelper;
import ej.narm2.anjoma_elmi.ui.tools.URLHelper;
import net.sourceforge.stripes.util.StringUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by rahati on 1/1/16.
 */
@WebServlet(name ="Index",urlPatterns = "")

public class Index extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 run(request,response);
    }



    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
run(request, response);
    }


    private void run(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        User user;


String token= URLHelper.getCookie(request, Mycookie.lg);
        if (request.getAttribute("user")==null) {
            user= Db_ui.getuser(token);
        }else {
            user= (User) URLHelper.getAttribute(request,Attribute.USER);
        }

        if (user==null){
            request.getRequestDispatcher("jsp/login.jsp").forward(request, response);

        }else {
            //get sidebar menu items
            String [][] menu= user.type.getMenu();
            URLHelper.setAttribute(request, Attribute.MENU, menu);
            // get result of page
            String rq=null;
            String q=request.getParameter("q");
            if (q==null||"".equals(q)){
                rq=menu[0][0];
            }else {
                for (int i = 0; i < menu.length; i++) {
                    if (menu[i][0].equals(q)){
                        rq=menu[i][0];
                    }
                }
                if (rq==null){
                    rq=menu[0][0];

                }
            }
            Crequest[] crqs=Db_ui.getrequests(user,rq);
            URLHelper.setAttribute(request, Attribute.CRQS, crqs);



            request.getRequestDispatcher("jsp/index.jsp").forward(request, response);



        }



    }




}
