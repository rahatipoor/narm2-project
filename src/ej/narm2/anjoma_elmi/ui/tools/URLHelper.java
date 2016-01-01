package ej.narm2.anjoma_elmi.ui.tools;


import ej.narm2.anjoma_elmi.ui.enums.Attribute;
import ej.narm2.anjoma_elmi.ui.enums.Mycookie;
import org.apache.commons.lang3.StringUtils;

import javax.servlet.ServletRequest;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.net.URLEncoder;
import java.util.List;


public class URLHelper {











    public static void setcookie(HttpServletResponse response, Mycookie name,String value) {
        Cookie c = null;
        try {

          c= new Cookie(name.val(), URLEncoder.encode(value, "UTF-8"));
            c.setMaxAge(3600 * 24 * 365);
//            c.setDomain(COOKIEDOMAIN);
            response.addCookie(c);
        } catch (UnsupportedEncodingException ex) {
            LogUtils.error("set Request Mycookie '" + c.toString() + "' Exception", ex);


        }
    }

    public static String getCookie(HttpServletRequest request, Mycookie cookie) {
        String result = "";
        try {
            for (javax.servlet.http.Cookie c : request.getCookies()) {
                if (c.getName().equals(cookie.val())) {
                    result = StringHelper.decode(c.getValue());
                }
            }
        } catch (Exception e) {
            LogUtils.error("Get Request Mycookie '" + cookie + "' Exception", e);
        }
        return result;
    }


    public static Object getAttribute(ServletRequest request, Attribute key) {
        Object result = "";
        try {
            result = request.getAttribute(key.val());
        } catch (Exception e) {
            LogUtils.error("Get Request Attribute '" + key + "' Exception", e);
        }
        return result;
    }

    public static void setAttribute(ServletRequest request, Attribute key, Object value) {
        try {
            request.setAttribute(key.val(), value);
        } catch (Exception e) {
            LogUtils.error("Set Request Attribute '" + key + "' Exception", e);
        }
    }


}
