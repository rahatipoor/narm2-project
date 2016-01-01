package ej.narm2.anjoma_elmi.ui.tools;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;


public class LogUtils {
    final static Logger log = Logger.getLogger(LogUtils.class);

    /**
     * Handle <code>INFO</code> Log.
     *
     * @param message   Message to Write in Log File
     * @param throwable Exception to Write in Log File
    */
    public static void info(Object message, Throwable throwable) {
        log.log(LogUtils.class.getCanonicalName(), Level.INFO, message, throwable);
    }

    /**
     * Handle <code>INFO</code> Log.
     *
     * @param message Message to Write in Log File
    */
    public static void info(Object message) {
        log.log(LogUtils.class.getCanonicalName(), Level.INFO, message, null);
    }

    /**
     * Handle <code>ERROR</code> Log.
     *
     * @param message   Message to Write in Log File
     * @param throwable Exception to Write in Log File
    */
    public static void error(Object message, Throwable throwable) {
        log.log(LogUtils.class.getCanonicalName(), Level.ERROR, message, throwable);
    }

    /**
     * Handle <code>ERROR</code> Log.
     *
     * @param message Message to Write in Log File
    */
    public static void error(Object message) {
        log.log(LogUtils.class.getCanonicalName(), Level.ERROR, message, null);
    }

}
