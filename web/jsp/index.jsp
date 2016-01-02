<%--
  Created by IntelliJ IDEA.
  User: rahati
  Date: 1/2/16
  Time: 9:56 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/taglibs.jsp" %>
<%--<c:set var="menu" value="${pageContext.request.getParameter('menu')}"/>--%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8"/>
    <title>سامانه</title>
    <link href="lib/stylesheet/bootstrap.min.css" rel="stylesheet">
    <%--<link href="lib/stylesheet/bootstrap-theme.min.css" rel="stylesheet">--%>
    <link href="lib/stylesheet/bootstrap-rtl.min.css" rel="stylesheet">
    <link rel='stylesheet' href='/stylesheet/style.css'/>
</head>
<body>
<div class="container-fluid">

    <div class="row" style="    position: fixed;
    width: 100%;
    z-index: 20">
        <div class="col-xs-12 header">
            <div class="row">
                <div class="col-xs-8">

                </div>
                <a id="usr" class="col-xs-4" style="    color: white;
    font-size: 20px;
    padding: 12px 17px;
    text-align: left;" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    محمد جواد راحتیانپور
                </a>
                <ul class="dropdown-menu" aria-labelledby="dLabel">
                    <li><a href="#">ویرایش</a></li>
                    <li><a href="#">خروج</a></li>
                </ul>
            </div>

        </div>

    </div>
    <div class="row" style="    z-index: 5; display: flex">
        <div class="col-xs-2" style="
        /*background: rgba(68, 66, 66, 0.21);*/
    /*height: 595px;*/
    /*border-left: 1px solid #bbb;  */
      padding: 90px 10px;
    position: fixed;
    height: 100%;;
    ">
            <div class="row">
                <div class="col-xs-12">

                    <c:forEach items="${menu}" var="item">

                    <button type="button" href=""${item[0]}" class="btn btn-default btn-lg btn-block menu-btn selected">${item[1]}</button>

                    </c:forEach>
                    <hr style="border-top: 1px solid rgb(204, 204, 204);">
                    <button type="button" class="btn btn-default btn-lg btn-block menu-btn" data-toggle="modal" data-target="#myModal2">افزودن</button>
                </div>
            </div>
            <div class="row" style="    position: absolute;
    bottom: 0;
    width: 100%;  ">
                <div class="col-xs-12 " style="    padding-left: 5px;
    padding-bottom: 20px;">
                    <button type="button" class="btn btn-default btn-lg btn-block menu-btn">کمک و پشتیبانی</button>
                </div>
            </div>
        </div>

        <div class="col-xs-10" style="    position: fixed;
   padding: 56px 0;
    right: 17%;
    height: 100%;
    overflow: scroll;
    z-index: 2;
             overflow-x: hidden;">
            <div class="row" style="    padding: 15px 0;">
                <div class="col-xs-12" style="padding: 0 115px;">
                    <div class="row record recheader" style="">
                        <div class="col-xs-12 "
                             style="height: 100%;">
                            <div class="row" style="   ">
                                <div class="col-xs-1 "
                                     style="    ">ردیف
                                </div>
                                <div class="col-xs-2 " style=" ">
                                    نوع درخواست
                                </div>
                                <div class="col-xs-7 " style="  text-align: right ">
                                    عنوان درخواست
                                </div>
                                <div class="col-xs-2 " style="  ">
                                    تاریخ درخواست
                                </div>

                            </div>


                        </div>
                    </div>
                    <c:set var="count" value="0" scope="page" />
                    <%@ page import="ej.narm2.anjoma_elmi.ui.tools.StringHelper" %>

                    <c:forEach items="${crqs}" var="rq" varStatus="i">

                    


                    <a data-toggle="modal" data-target="#myModal" style="cursor: pointer;color: #474747">

                        <div class="row record" style="">
                            <div class="col-xs-12"
                                 style=";height: 100%;">
                                <div class="row" style="    ">
                                    <div class="col-xs-1 "
                                         style="    ">
                                         ${StringHelper.toPersianNumber(count)}
                                    </div>
                                    <div class="col-xs-2 " style=" text-align: right   ">
                                       ${rq.type.name}
                                    </div>
                                    <div class="col-xs-7 " style=" text-align: right ">
                                            ${rq.title}
                                    </div>
                                    <div class="col-xs-2 " style="   ">
                                            ${StringHelper.toPersianNumber(rq.date)}
                                    </div>
                                </div>


                            </div>
                        </div>
                    </a>
                        <c:set var="count" value="${count + 1}" scope="page"/>

                    </c:forEach>
                </div>
            </div>
        </div>
    </div>

</div>


<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document" style="    width: 540px;margin-top: 85px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">شرح درخواست</h4>
            </div>
            <div class="modal-body" style="padding: 10px;">


                <form>
                    <div class="form-group">
                        <label for="exampleInputEmail1">شماره درخواست</label>
                        <input type="email" class="form-control" id="exampleInputEmail1" disabled="disabled"
                               value="952">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">نوع درخواست</label>
                        <input type="email" class="form-control" id="exampleInputEmail1" disabled="disabled"
                               value="همایش">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">عنوان درخواست</label>
                        <input type="email" class="form-control" id="exampleInputEmail1" disabled="disabled"
                               value="الیاس تقوی">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1"> درخواست کننده</label>
                        <input type="email" class="form-control" id="exampleInputEmail1" disabled="disabled"
                               value="952">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">مسئول برنامه </label>
                        <input type="email" class="form-control" id="exampleInputEmail1" disabled="disabled"
                               value="952">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">شماره همراه مسئول برنامه</label>
                        <input type="email" class="form-control" id="exampleInputEmail1" disabled="disabled"
                               value="الیاس تقوی">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">تاریخ شروع برنامه</label>
                        <input type="datetime-local" class="form-control" id="exampleInputEmail1" disabled="disabled"
                               value=" ">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">تاریخ پایان برنامه</label>
                        <input type="datetime-local" class="form-control" id="exampleInputEmail1" disabled="disabled"
                               value=" ">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">فیلم برداران</label>
                        <input type="email" class="form-control" id="exampleInputEmail1" disabled="disabled"
                               value="الیاس تقوی">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">محل برگزاری</label>
                        <input type="email" class="form-control" id="exampleInputEmail1" disabled="disabled"
                               value="الیاس تقوی">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">تعداد شرکت کنندگان</label>
                        <input type="email" class="form-control " id="exampleInputEmail1"
                               value="الیاس تقوی">
                    </div>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox"> پذیرایی
                        </label>
                    </div>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox"> نقلیه
                        </label>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">مکان حرکت سرویس</label>
                        <input type="email" class="form-control" id="exampleInputEmail1" disabled="disabled"
                               value="الیاس تقوی">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">توضیحات</label>
                        <textarea class="form-control" style="width: 100%;resize: vertical;"></textarea>
                    </div>

                    <button type="button" class="btn btn-default btn-success">تایید</button>
                    <button type="submit " class="btn btn-default btn-danger">رد </button>
                    <button  class="btn btn-default btn-info" data-toggle="modal" data-target="#myModal3">لیست شرکت کنندگان</button>
                    <button  class="btn btn-default btn-info">گزارش پایانی  </button>
                    <button  class="btn btn-default ">انصراف</button>
                    <button type="reset" class="btn btn-default ">پاک کردن</button>

                </form>

            </div>
        </div>
        <!--<div class="modal-footer" style="padding:5px;text-align: right;">-->
        <!--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>-->
        <!--<button type="button" class="btn btn-primary">Save changes</button>-->
        <!--</div>-->
    </div>
</div>
</div>




<!-- Modal2 -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel2">نوع درخواست</h4>
            </div>
            <div class="modal-body">
                <button type="button" class="btn btn-default btn-lg btn-block menu-btn">همایش</button>
                <button type="button" class="btn btn-default btn-lg btn-block menu-btn">اردو</button>


            </div>
            <!--<div class="modal-footer">-->
            <!--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>-->
            <!--<button type="button" class="btn btn-primary">Save changes</button>-->
            <!--</div>-->
        </div>
    </div>
</div>




<!-- Modal -->
<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel3"> لیست شرکت کنندگان</h4>
            </div>
            <div class="modal-body">
                <table class="table table-striped table-responsive">
                    <thead>
                    <colgroup>
                        <col class="col-xs-3">
                        <col class="col-xs-9">
                    </colgroup>
                    <tr>
                        <th>شماره دانشجویی</th>
                        <th>نام</th>

                    </tr>
                    </thead>

                    <tbody>
                    <tr>
                        <th scope="row">
                            9452633
                        </th>
                        <td>حسن حسینی</td>
                    </tr>

                    <tr>
                        <th scope="row">
                            9225363
                        </th>
                        <td> احمد معینی</td>
                    </tr>


                    </tbody>
                </table>
                <form class="form-inline"style="margin-bottom: 10px">
                    <div class="form-group">
                        <label class="sr-only" for="exampleInputEmail3">شماره دانشجویی</label>
                        <input type="number" class="form-control" id="exampleInputEmail3" placeholder="شماره دانشجویی">
                    </div>


                    <button type="submit" class="btn btn-default">افزودن</button>
                </form>
                <button  class="btn btn-default ">بازگشت</button>

                <!--<div class="modal-footer">-->
                <!--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>-->
                <!--<button type="button" class="btn btn-primary">Save changes</button>-->
                <!--</div>-->
            </div>
        </div>
    </div>


    <script src="/lib/javascript/jquery.min.js"></script>
    <script src="/lib/javascript/bootstrap.min.js"></script>


</body>
</html>
