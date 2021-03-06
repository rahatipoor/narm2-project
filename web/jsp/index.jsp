<%--
  Created by IntelliJ IDEA.
  User: rahati
  Date: 1/2/16
  Time: 9:56 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/taglibs.jsp" %>
<%@ page import="ej.narm2.anjoma_elmi.ui.tools.StringHelper" %>
<%@ page import="ej.narm2.anjoma_elmi.common.enums.User_type" %>


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
                    ${user.name} </a>
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

                        <a type="button" href="/?q=${item[0]}"
                           class="btn btn-default btn-lg btn-block menu-btn ${item[0].equals(cmenu)?'selected':''}">${item[1]}</a>
                    </c:forEach>
                    <hr style="border-top: 1px solid rgb(204, 204, 204);">
                    <c:choose>
                        <c:when test="${user.type== User_type.NORMAL}">
                            <button type="button" class="btn btn-default btn-lg btn-block menu-btn" data-toggle="modal"
                                    data-target="#myModal2">پیشنهاد
                            </button>

                        </c:when>
                        <c:when test="${user.type== User_type.SECRETARY}">
                            <button type="button" class="btn btn-default btn-lg btn-block menu-btn" data-toggle="modal"
                                    data-target="#myModal2">افزودن
                            </button>
                        </c:when>
                    </c:choose>
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
                    <c:set var="count" value="0" scope="page"/>

                    <c:forEach items="${crqs}" var="rq" varStatus="i">


                        <a data-toggle="modal" data-target="#myModal" style="cursor: pointer;color: #474747"
                           onclick='openrq( "${rq.type.enname}", "${user.type.name}",${rq.rq_id})'>

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
<div class="modal fade" id="rq_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document" style="    width: 540px;margin-top: 85px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">شرح درخواست</h4>
            </div>
            <div class="modal-body" style="padding: 10px;">


                <form id="rq-form" method="post" action="/rq_submit">
                    <input type="email" class="form-control" id="rq_type" name="rq_type" disabled style="display: none">

                    <div class="form-group">
                        <label for="rq_id">شماره درخواست</label>
                        <input type="number" class="form-control" id="rq_id" name="rq_id" disabled
                        >
                    </div>
                    <div class="form-group">
                        <label for="rq_type2">نوع درخواست</label>
                        <input type="tel" class="form-control" id="rq_type2" name="rq_type2"
                        >
                    </div>
                    <div class="form-group">
                        <label for="rq_title">عنوان درخواست</label>
                        <input type="text" class="form-control" id="rq_title" name="rq_title"
                        >
                    </div>
                    <div class="form-group">
                        <label for="rq_applicant"> درخواست کننده</label>
                        <input type="text" class="form-control" id="rq_applicant" name="rq_applicant"
                        >
                    </div>
                    <div class="form-group">
                        <label for="rq_responsible">مسئول برنامه </label>
                        <input type="text" class="form-control" id="rq_responsible" name="rq_responsible"
                        >
                    </div>
                    <div class="form-group">
                        <label for="rq_responsible_mobile">شماره همراه مسئول برنامه</label>
                        <input type="number" class="form-control" id="rq_responsible_mobile"
                               name="rq_responsible_mobile"
                        >
                    </div>
                    <div class="form-group">
                        <label for="rq_begin_date">تاریخ شروع برنامه</label>
                        <input type="datetime-local" class="form-control" id="rq_begin_date" name="rq_begin_date"
                        >
                    </div>
                    <div class="form-group">
                        <label for="rq_end_date">تاریخ پایان برنامه</label>
                        <input type="datetime-local" class="form-control" id="rq_end_date" name="rq_end_date"
                        >
                    </div>
                    <div class="form-group">
                        <label for="rq_Videographers">فیلم برداران</label>
                        <input type="text" class="form-control" id="rq_Videographers" name="rq_Videographers"
                        >
                    </div>
                    <div class="form-group">
                        <label for="rq_place">محل برگزاری</label>
                        <input type="text" class="form-control" id="rq_place" name="rq_place"
                        >
                    </div>
                    <div class="form-group">
                        <label for="rq_count_participants">تعداد شرکت کنندگان</label>
                        <input type="number" class="form-control " id="rq_count_participants"
                               name="rq_count_participants"
                        >
                    </div>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" id="rq_reception" name="rq_reception"> پذیرایی
                        </label>
                    </div>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" id="rq_vehicles" name="rq_vehicles"> نقلیه
                        </label>
                    </div>
                    <div class="form-group">
                        <label for="rq_moveـlocation">مکان حرکت سرویس</label>
                        <input type="text" class="form-control" id="rq_moveـlocation" name="rq_move_location"
                        >
                    </div>
                    <div class="form-group">
                        <label for="rq_comments">توضیحات</label>
                        <textarea id="rq_comments" name="rq_comments" class="form-control"
                                  style="width: 100%;resize: vertical;"></textarea>
                    </div>

                    <button type="submit" class="btn btn-default btn-success" id="rq_ok" value="ok">تایید</button>
                    <button type="submit " class="btn btn-default btn-danger" id="rq_rj" value="rj">رد</button>
                    <button id="rq_participants_list" class="btn btn-default btn-info" data-toggle="modal"
                            data-target="#myModal3">لیست شرکت کنندگان
                    </button>
                    <button id="rq_report" class="btn btn-default btn-info">گزارش پایانی</button>
                    <button id="rq_cancel" class="btn btn-default ">انصراف</button>
                    <button id="rq_reset" type="reset" class="btn btn-default ">پاک کردن</button>

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
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel2">نوع درخواست</h4>
            </div>
            <div class="modal-body">
                <button type="button" class="btn btn-default btn-lg btn-block menu-btn" id="new_hamayesh_rq">همایش
                </button>
                <button type="button" class="btn btn-default btn-lg btn-block menu-btn" id="new_ordoo_rq">اردو</button>


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
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
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
                <form class="form-inline" style="margin-bottom: 10px">
                    <div class="form-group">
                        <label class="sr-only" for="exampleInputEmail3">شماره دانشجویی</label>
                        <input type="number" class="form-control" id="exampleInputEmail3" placeholder="شماره دانشجویی">
                    </div>


                    <button type="submit" class="btn btn-default">افزودن</button>
                </form>
                <button class="btn btn-default ">بازگشت</button>

                <!--<div class="modal-footer">-->
                <!--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>-->
                <!--<button type="button" class="btn btn-primary">Save changes</button>-->
                <!--</div>-->
            </div>
        </div>
    </div>


    <script src="/lib/javascript/jquery.min.js"></script>
    <script src="/lib/javascript/bootstrap.min.js"></script>

    <script type="text/javascript">
        var cmenu = "${cmenu}";
        var utype = "${user.type.name}";
        var rq_action = "";
        var rq_insert_hamayesh = function () {
            rq_action = "new";
            $("#rq_id").val("").prop("disabled", true).parent().hide();
            $("#rq_type2").val("").prop("disabled", false).parent().show();
            $("#rq_title").val("").prop("disabled", false).parent().show();
            $("#rq_applicant").val("").prop("disabled", false).parent().show();
            $("#rq_responsible").val("").prop("disabled", false).parent().show();
            $("#rq_responsible_mobile").val("").prop("disabled", false).parent().show();
            $("#rq_begin_date").val("").prop("disabled", false).parent().show();
            $("#rq_end_date").val("").prop("disabled", false).parent().show();
            $("#rq_Videographers").val("").prop("disabled", false).parent().show();
            $("#rq_place").val("").prop("disabled", false).parent().show();
            $("#rq_count_participants").val("").prop("disabled", false).parent().show();
            $("#rq_reception").prop('checked', "").prop("disabled", false).parent().show();
            $("#rq_vehicles").prop('checked', "").prop("disabled", false).parent().hide();
            $("#rq_moveـlocation").val("").prop("disabled", false).parent().hide();
            $("#rq_comments").val("").prop("disabled", false).parent().show();
            $("#rq_type").val("hamayesh");
//        $("#rq_id").parent().hide();
//        $("#rq_vehicles").parent().hide();
//        $("#rq_moveـlocation").parent().hide();
            $("#rq_report").hide();
            $("#rq_rj").hide();
            $("#rq_participants_list").hide();
            $("#rq_reset").show();
        };
        var rq_insert_ordooo = function () {
            rq_action = "new";
            $("#rq_id").val("").prop("disabled", true).parent().hide();
            $("#rq_type2").val("").prop("disabled", false).parent().show();
            $("#rq_title").val("").prop("disabled", false).parent().show();
            $("#rq_applicant").val("").prop("disabled", false).parent().show();
            $("#rq_responsible").val("").prop("disabled", false).parent().show();
            $("#rq_responsible_mobile").val("").prop("disabled", false).parent().show();
            $("#rq_begin_date").val("").prop("disabled", false).parent().show();
            $("#rq_end_date").val("").prop("disabled", false).parent().show();
            $("#rq_Videographers").val("").prop("disabled", false).parent().show();
            $("#rq_place").val("").prop("disabled", false).parent().show();
            $("#rq_count_participants").val("").prop("disabled", false).parent().show();
            $("#rq_reception").prop('checked', "").prop("disabled", false).parent().show();
            $("#rq_vehicles").prop('checked', "").prop("disabled", false).parent().show();
            $("#rq_moveـlocation").val("").prop("disabled", false).parent().show();
            $("#rq_comments").val("").prop("disabled", false).parent().show();
            $("#rq_type").val("ordoo");
//        $("#rq_id").parent().hide();
//        $("#rq_vehicles").parent().show();
//        $("#rq_moveـlocation").parent().show();
            $("#rq_report").hide();
            $("#rq_rj").hide();
            $("#rq_participants_list").hide();
            $("#rq_reset").show();

        };
        $("#new_hamayesh_rq").on('click', function () {
            rq_insert_hamayesh();
            $('.modal').modal('hide');
            $('#rq_modal').modal('show');
        });

        $("#new_ordoo_rq").on('click', function () {
            rq_insert_ordooo();
            $('.modal').modal('hide');
            $('#rq_modal').modal('show');
        });

        $('#rq_ok').click(function (e) {
            var url = "/rq_submit";
            $.ajax({
                url: url,
                data: $('form#rq-form').serialize(),
                dataType: 'application/json',
                complete: function (data) {
                    var obj = $.parseJSON(data.responseText);
                    if (obj.er == "") {
                        alert("درخواست با موفقیت ثبت شد");
                        $('.modal').modal('hide');
                    } else {
                        alert(obj.er);
                        $('#rq_modal').modal('show');

                    }

                },

            })
//    $.ajax({
//        url: '/rq_submit',
//        type: 'post',
//        dataType: 'json',
//        data: $('form#rq-form').serialize(),
//        success: function(data) {
//            alet(data.responseText);
//        }
//    });
        });

        function show_btn() {
            $("#rq_report").hide();
            if("waiting"==cmenu){
                $("#rq_rj").show();

            }else {
                $("#rq_rj").hide();

            }
            if(("waiting"==cmenu&&utaype=="farhangi_director")||utype=="secretary"){
                $("#rq_participants_list").hide();

            }else {
                $("#rq_participants_list").hide();

            }
            $("#rq_reset").show();
        }
        function openrq(rqtype, usertype, id) {
            var url = "/rq_get?type=" + rqtype + "&id=" + id;
            $.ajax({
                url: url,
                dataType: 'application/json',
                complete: function (data) {
                    var obj = $.parseJSON(data.responseText);

                    switch (obj.rq_type) {
                        case "hamayesh":
                            if (obj.user_type == "normal") {
                                view_hamayesh_normal(obj);
                            } else {
                                view_hamayesh(obj);

                            }
                            break;
                        case "ordoo":
                            if (obj.user_type == "normal") {
                                view_ordoo_normal(obj);
                            } else {
                                view_ordoo(obj);

                            }
                            break;
                    }
                    show_btn();
                    $('.modal').modal('hide');
                    $('#rq_modal').modal('show');

                },

            })

        }
        var view_hamayesh = function (obj) {
            $("#rq_id").val(obj.rq_id).prop("disabled", true).parent().show();
            $("#rq_type2").val(obj.rq_type2).prop("disabled", true).parent().show();
            $("#rq_title").val(obj.rq_title).prop("disabled", true).parent().show();
            $("#rq_applicant").val(obj.rq_applicant).prop("disabled", true).parent().show();
            $("#rq_responsible").val(obj.rq_responsible).prop("disabled", true).parent().show();
            $("#rq_responsible_mobile").val(obj.rq_responsible_mobile).prop("disabled", true).parent().show();
            $("#rq_begin_date").val(obj.rq_begin_date).prop("disabled", true).parent().show();
            $("#rq_end_date").val(obj.rq_end_date).prop("disabled", true).parent().show();
            $("#rq_Videographers").val(obj.rq_Videographers).prop("disabled", true).parent().show();
            $("#rq_place").val(obj.rq_place).prop("disabled", true).parent().show();
            $("#rq_count_participants").val(obj.rq_count_participants).prop("disabled", true).parent().show();
            $("#rq_reception").prop('checked', obj.rq_reception).prop("disabled", true).parent().show();
            $("#rq_vehicles").prop('checked', obj.rq_vehicles).prop("disabled", true).parent().hide();
            $("#rq_moveـlocation").val(obj.rq_moveـlocation).prop("disabled", true).parent().hide();
            $("#rq_comments").val(obj.rq_comments).prop("disabled", true).parent().show();

        };

        var view_hamayesh_normal = function (obj) {
            $("#rq_id").val(obj.rq_id).prop("disabled", true).parent().hide();
            $("#rq_type2").val(obj.rq_type2).prop("disabled", true).parent().show();
            $("#rq_title").val(obj.rq_title).prop("disabled", true).parent().show();
            $("#rq_applicant").val(obj.rq_applicant).prop("disabled", true).parent().hide();
            $("#rq_responsible").val(obj.rq_responsible).prop("disabled", true).parent().show();
            $("#rq_responsible_mobile").val(obj.rq_responsible_mobile).prop("disabled", true).parent().hide();
            $("#rq_begin_date").val(obj.rq_begin_date).prop("disabled", true).parent().show();
            $("#rq_end_date").val(obj.rq_end_date).prop("disabled", true).parent().show();
            $("#rq_Videographers").val(obj.rq_Videographers).prop("disabled", true).parent().hide();
            $("#rq_place").val(obj.rq_place).prop("disabled", true).parent().show();
            $("#rq_count_participants").val(obj.rq_count_participants).prop("disabled", true).parent().hide();
            $("#rq_reception").prop('checked', obj.rq_reception).prop("disabled", true).parent().hide();
            $("#rq_vehicles").prop('checked', obj.rq_vehicles).prop("disabled", true).parent().hide();
            $("#rq_moveـlocation").val(obj.rq_move_location).prop("disabled", true).parent().show();
            $("#rq_comments").val(obj.rq_comments).prop("disabled", true).parent().show();

        };
        var view_ordoo = function (obj) {
            $("#rq_id").val(obj.rq_id).prop("disabled", true).parent().show();
            $("#rq_type2").val(obj.rq_type2).prop("disabled", true).parent().show();
            $("#rq_title").val(obj.rq_title).prop("disabled", true).parent().show();
            $("#rq_applicant").val(obj.rq_applicant).prop("disabled", true).parent().show();
            $("#rq_responsible").val(obj.rq_responsible).prop("disabled", true).parent().show();
            $("#rq_responsible_mobile").val(obj.rq_responsible_mobile).prop("disabled", true).parent().show();
            $("#rq_begin_date").val(obj.rq_begin_date).prop("disabled", true).parent().show();
            $("#rq_end_date").val(obj.rq_end_date).prop("disabled", true).parent().show();
            $("#rq_Videographers").val(obj.rq_Videographers).prop("disabled", true).parent().show();
            $("#rq_place").val(obj.rq_place).prop("disabled", true).parent().show();
            $("#rq_count_participants").val(obj.rq_count_participants).prop("disabled", true).parent().show();
            $("#rq_reception").prop('checked', obj.rq_reception).prop("disabled", true).parent().show();
            $("#rq_vehicles").prop('checked', obj.rq_vehicles).prop("disabled", true).parent().show();
            $("#rq_moveـlocation").val(obj.rq_moveـlocation).prop("disabled", true).parent().show();
            $("#rq_comments").val(obj.rq_comments).prop("disabled", true).parent().show();

        };
        var view_ordoo_normal = function (obj) {
            $("#rq_id").val(obj.rq_id).prop("disabled", true).parent().hide();
            $("#rq_type2").val(obj.rq_type2).prop("disabled", true).parent().show();
            $("#rq_title").val(obj.rq_title).prop("disabled", true).parent().show();
            $("#rq_applicant").val(obj.rq_applicant).prop("disabled", true).parent().hide();
            $("#rq_responsible").val(obj.rq_responsible).prop("disabled", true).parent().show();
            $("#rq_responsible_mobile").val(obj.rq_responsible_mobile).prop("disabled", true).parent().hide();
            $("#rq_begin_date").val(obj.rq_begin_date).prop("disabled", true).parent().show();
            $("#rq_end_date").val(obj.rq_end_date).prop("disabled", true).parent().show();
            $("#rq_Videographers").val(obj.rq_Videographers).prop("disabled", true).parent().hide();
            $("#rq_place").val(obj.rq_place).prop("disabled", true).parent().show();
            $("#rq_count_participants").val(obj.rq_count_participants).prop("disabled", true).parent().hide();
            $("#rq_reception").prop('checked', obj.rq_reception).prop("disabled", true).parent().hide();
            $("#rq_vehicles").prop('checked', obj.rq_vehicles).prop("disabled", true).parent().hide();
            $("#rq_moveـlocation").val(obj.rq_moveـlocation).prop("disabled", true).parent().hide();
            $("#rq_comments").val(obj.rq_comments).prop("disabled", true).parent().show();


        };
    </script>
    <style>
        .modal {
            max-height: 100%;
            overflow-y: auto;
        }
    </style>
</body>

</html>
