package ej.narm2.anjoma_elmi.ui.tools;

import org.apache.commons.lang3.StringUtils;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;


public class StringHelper {

    private static final String ENGLISH_NUMBER[] = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "0"};
    private static final String PERSIAN_NUMBER[] = {"۱", "۲", "۳", "۴", "۵", "۶", "۷", "۸", "۹", "۰"};
    private static final String beforeEncryptString = "sdhjvb";
    private static final String afterEncryptString = "&#(,mv";


    public static String toPersianNumber(String number) {
        String result = number;
        for (int i = 0; i < ENGLISH_NUMBER.length; i++)
            result = result.replace(ENGLISH_NUMBER[i], PERSIAN_NUMBER[i]);
        return result;
    }

    public static String toPersianNumber(String number, Boolean insertComma) {
        String pn = toPersianNumber(number);
        return insertComma ? insertComma(pn) : pn;
    }

    public static String toEnglishNumber(String number) {
        String result = number;
        for (int i = 0; i < ENGLISH_NUMBER.length; i++)
            result = result.replace(PERSIAN_NUMBER[i], ENGLISH_NUMBER[i]);
        return result;
    }

    public static String toEnglishNumber(String number, Boolean insertComma) {
        String en = toEnglishNumber(number);
        return insertComma ? insertComma(en) : en;
    }

    private static String insertComma(String number) {
        StringBuilder result = new StringBuilder();
        for (int i = number.length() - 1, j = 1; i >= 0; i--, j++) {
            result.append(number.charAt(i));
            if (j == 3 && i != 0) {
                result.append(",");
                j = 0;
            }
        }
        return result.reverse().toString();
    }

    public static String listToString(List list) {
        try {
            if (list == null || list.isEmpty()) {
                return "";
            }
            return encode(list.toString());
        } catch (Exception e) {
            LogUtils.error("listToString Exception:", e);
            return "";
        }
    }

    public static String encode(String text) {
        try {
            return URLEncoder.encode(text, "utf-8");
        } catch (Exception ex) {
            return "";
        }
    }

    public static String decode(String text) {
        try {
            return URLDecoder.decode(text, "utf-8");
        } catch (Exception ex) {
            return "";
        }
    }

    public static String encrypt(String str) {
        return (beforeEncryptString.concat(str).concat(str).concat(afterEncryptString)).hashCode() + "";
    }

    public static String decrypt(String raw, String encrypt) {
        if (encrypt(raw).equals(encrypt)) {
            return raw;
        } else {
            return null;
        }
    }

    public static String removeSpecialCharacters(String text) {
        StringUtils.replaceChars(text, "[]!@#$%^&*()_+={};:<>|./?,\\/'\"-+", " ");
        return text.replaceAll("\"", " ");
    }

    public static String normalizeQuery(String query) {
        String backupString = query;
        try {
            query = query.replaceAll("  ", " ");
            char[] replacableChars = "ے ي ى ۀ ة ہ ه ك ؤ ؤ ؤ إ أ".toCharArray();
            char[] replaceCharsWith = "ی ی ی ه ه ه ه ک و و و ا ا".toCharArray();
            for (int i = 0; i < replacableChars.length; i++) {
                char c = replacableChars[i];
                query = query.replace(c, replaceCharsWith[i]);
            }
            //hazfe erab
            replacableChars = "ًٌٍَُِّ".toCharArray();
            for (int i = 0; i < replacableChars.length; i++) {
                char c = replacableChars[i];
                while (query.indexOf(c) >= 0) {
                    query = query.substring(0, query.indexOf(c)) + query.substring(query.indexOf(c) + 1, query.length());
                }
            }
            return query;
        } catch (Exception e) {
            return backupString;
        }
    }
}
