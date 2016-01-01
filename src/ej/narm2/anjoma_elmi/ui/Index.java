package ej.narm2.anjoma_elmi.ui;

import ej.narm2.anjoma_elmi.Db_ui;
import ej.narm2.anjoma_elmi.common.User;
import ej.narm2.anjoma_elmi.ui.enums.Mycookie;
import ej.narm2.anjoma_elmi.ui.tools.URLHelper;

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




String token= URLHelper.getCookie(request, Mycookie.lg);
        User user= Db_ui.getuser(token);
        if (token==null){
            request.getRequestDispatcher("jsp/login.jsp").forward(request, response);

        }


            request.getRequestDispatcher("jsp/login.jsp").forward(request, response);

    }

}
