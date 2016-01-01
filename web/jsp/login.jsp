<%--
  Created by IntelliJ IDEA.
  User: rahati
  Date: 1/1/16
  Time: 6:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/taglibs.jsp" %>
<c:set var="error" value="${pageContext.request.getParameter('error')}"/>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
    <title>ورود</title>
    <link href="lib/stylesheet/bootstrap.min.css" rel="stylesheet">
    <link href="lib/stylesheet/bootstrap-theme.min.css" rel="stylesheet">
    <link href="lib/stylesheet/bootstrap-rtl.min.css" rel="stylesheet">
    <link rel='stylesheet' href='/stylesheet/style.css'/>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="xol-xs-12 header">
            <div class="row">
                <div class="col-xs-3">

                </div>
            </div>

        </div>

    </div>
    <div class="row">
        <div class="col-xs-12">
            <div class="row" style="padding: 50px 0">
                <div class="col-xs-12" style="padding: 0 515px;">
                    <div class="row" style=";height: 100%;    background-color: #eaeaea;
box-shadow: 0 0 6px rgba(0,0,0,.16),0 6px 12px rgba(0,0,0,.32);">
                        <div class="col-xs-12" style="background-color: #FFFFFF;height: 100%">
                            <div class="row" style="height: 50px;border-bottom: 1px solid #bbb;">
                                <h1 style="    margin: 0;
    padding: 5px 20px;
    font-size: 30px;">ورود</h1>
                            </div>

                            <div class="row" style="    padding: 5px  15px;">

                                <form>
                                    <c:if test=" ${!empty error}">
                                    <div class="alert alert-danger" role="alert" style="    margin: 0px;
    margin-bottom: 10px;"><c:out value="error"></c:out></div>
                                    </c:if>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">نام کاربری</label>
                                        <input type="email" class="form-control" id="exampleInputEmail1" >
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">گذروازه</label>
                                        <input type="password" class="form-control" id="exampleInputPassword1" >
                                    </div>


                                    <button type="submit" class="btn btn-default">ورود</button>
                                    <button class="btn btn-default">ثبت نام</button>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/lib/javascript/jquery.min.js"></script>
</body>
</html>

