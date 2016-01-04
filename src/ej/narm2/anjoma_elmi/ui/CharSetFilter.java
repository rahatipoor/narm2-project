package ej.narm2.anjoma_elmi.ui;

/**
 * Created by rahati on 1/4/16.
 */
import java.io.IOException;
import javax.servlet.*;


public class CharSetFilter implements Filter {

    /**
     * This is Initialized Method
     *
     * @param filterConfig FilterConfig.
     * @throws ServletException
     */
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    /**
     * This Method Call When Filter Call
     *
     * @param servletRequest ServletRequest.
     * @param servletResponse ServletResponse.
     * @param filterChain FilterChain.
     * @throws IOException
     * @throws ServletException
     */
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        servletRequest.setCharacterEncoding("utf-8");
        servletResponse.setCharacterEncoding("utf-8");
        filterChain.doFilter(servletRequest, servletResponse);
    }

    /**
     * This is Destroyed Method
     */
    @Override
    public void destroy() {
    }
}
