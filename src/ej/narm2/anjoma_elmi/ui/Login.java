package ej.narm2.anjoma_elmi.ui;

import ej.narm2.anjoma_elmi.Db_ui;
import ej.narm2.anjoma_elmi.common.User;
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
 * Created by rahati on 1/1/16.
 */
@WebServlet(name = "Login",urlPatterns = "/login")
public class Login extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        run(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
run(request,response);
    }

    private void run(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
String username=request.getParameter("user");//get username
String pass=request.getParameter("pass");//get password
        String error=null;

if (username!=null ){
    try {
        //send user and pass for login
        User user= Db_ui.getuser(username, pass);//TODO login
        URLHelper.setcookie(response, Mycookie.lg,user.getToken());
        URLHelper.setAttribute(request,Attribute.USER,user);
        request.getRequestDispatcher("/").forward(request, response);

    }catch (Exception e){
        error="نام کاربری یا گذروازه اشتباه است";
    }
}else {

}

        URLHelper.setAttribute(request, Attribute.Error, error);

//fill and send login  page
        request.getRequestDispatcher("jsp/login.jsp").forward(request, response);

    }

}
