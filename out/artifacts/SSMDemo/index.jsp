<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        //获取当前web项目根目录
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <!-- 引入JQuery -->
    <script src = "https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <title>员工列表</title>
    <!-- 引入bootstrap -->
    <link href = "${APP_PATH}/bootstrap-3.3.7-dist/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src = "${APP_PATH}/bootstrap-3.3.7-dist/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<!-- 利用bootstrap栅格系统构建页面 -->
<body>
<!-- 员工添加模态框 -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">员工添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id = "emp_form">
                    <div class="form-group">
                        <label for="inputAddEmpName" class="col-sm-2 control-label">员工姓名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name = "empName" id="inputAddEmpName" placeholder="员工姓名">
                            <span id="empNameHelpBlock" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name = "email" id="inputEmail" placeholder="邮箱">
                            <span id="emailHelpBlock" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <label class="radio-inline">
                            <input type="radio" name="gender" id="choose_genderM" value="M" checked>男
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="gender" id="choose_genderF" value="F">女
                        </label>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门</label>
                        <div class="col-md-3">
                            <select class="form-control" id = "dept_name" name = "dId">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id = "emp_save_button">保存</button>
            </div>
        </div>
    </div>
    </div>
    <!-- 员工编辑模态框 -->
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" >员工编辑</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id = "emp_update_form">
                    <div class="form-group">
                        <label for="inputAddEmpName" class="col-sm-2 control-label">员工姓名</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="update_emp_name"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name = "email" id="inputUpdateEmail" placeholder="邮箱">
                            <span id="emailUpdateHelpBlock" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <label class="radio-inline">
                            <input type="radio" name="gender" id="update_choose_genderM" value="M" checked>男
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="gender" id="update_choose_genderF" value="F">女
                        </label>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门</label>
                        <div class="col-md-3">
                            <select class="form-control" id = "update_dept_name" name = "dId">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id = "update_emp_save_button">更新</button>
            </div>
        </div>
    </div>
</div>
    <div class = "container">
        <!-- 标题 -->
        <div class = "row">
            <div class = "col-md-12">
                <h1>SSM-SimpleDemo</h1>
            </div>
        </div>
        <!-- 按钮 -->
        <div class = "row">
            <div class = "col-md-4 col-md-offset-9">
                <button type="button" class="btn btn-success" id = "create_modal_button">新增</button>
                <button type="button" class="btn btn-danger" id = "delete_modal_button">删除</button>
            </div>
        </div>
        <!-- 表格数据 -->
        <div class = "row">
            <div class = "col-md-12">
                <table class="table table-hover" id = "emps_table">
                    <thead>
                    <tr>
                        <th>Employee_ID</th>
                        <th>Employee_Name</th>
                        <th>Gender</th>
                        <th>Email</th>
                        <th>Department_Name</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- 分页信息 -->
        <div class = "row">
            <div class = "col-md-6" id = "page_info_area">
            </div>
            <div class = "col-md-6" id = "page_nav_area">
            </div>
        </div>
    </div>
    <script type="text/javascript" >

        var totalRecords; //记录总记录数
        var currentPage;
        //初始跳转到第一页
        $(function() {
            jump(1);
        });

        //跳转到某页
        function jump(pageNum) {
            $(function() {
                $.ajax({
                    url:"${APP_PATH}/emps",
                    data:{
                        pageNum:pageNum
                    },
                    type:"GET",
                    success:function (result) {
                        totalRecords = result.pageMsg.pageInfo.total;
                        currentPage = result.pageMsg.pageInfo.pageNum;
                        build_emp_table(result);
                        build_pageInfo(result);
                        build_nav_page(result);
                    }
                });
            });
        }

        //构建员工表格
        function build_emp_table(result) {
            $("#emps_table tbody").empty();
            var emp = result.pageMsg.pageInfo.list;
            $.each(emp,function(index,item){
                var empId = $("<td></td>").append(item.empId);
                var empName = $("<td></td>").append(item.empName);
                var gender = $("<td></td>").append(item.gender == "M" ? "男":"女");
                var email = $("<td></td>").append(item.email);
                var deptNmae = $("<td></td>").append(item.dept.deptName);
                var editButton = $("<button></button>").addClass("btn btn-info btn-primary btn-sm edit_button")
                    .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑").attr("editId",item.empId);
                var delButton = $("<button></button>").addClass("btn btn-warning btn-primary btn-sm delete_button")
                    .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除").attr("deleId",item.empId);
                var buttonTd = $("<td></td>").append(editButton).append(" ").append(delButton);
                $("<tr></tr>").append(empId).append(empName).append(gender).append(email).append(deptNmae)
                    .append(buttonTd).appendTo("#emps_table tbody");
            });
        }
        //构建分页信息
        function build_pageInfo(result) {
            $("#page_info_area").empty();
            $("#page_info_area").append("当前在第" + result.pageMsg.pageInfo.pageNum +
                "页，共有" + result.pageMsg.pageInfo.pages + "页，" +
                result.pageMsg.pageInfo.total +  "条记录");
        }
        //构建分页导航栏
        function build_nav_page(result) {
            $("#page_nav_area").empty();
            var ul = $("<ul></ul>").addClass("pagination");
            var firstPage = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
            var previousPage = $("<li></li>").append($("<a></a>").append($("<span></span>").append("&laquo;")).attr("href","#"));
            if(result.pageMsg.pageInfo.hasPreviousPage == false) {
                previousPage.addClass("disabled");
                firstPage.addClass("disabled");
            }else {
                previousPage.click(function() {
                    jump(result.pageMsg.pageInfo.pageNum-1);
                });
                firstPage.click(function() {
                    jump(1);
                });
            }
            var nextPage = $("<li></li>").append($("<a></a>").append($("<span></span>").append("&raquo;")).attr("href","#"));
            var lastPage = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
            if(result.pageMsg.pageInfo.hasNextPage == false) {
                lastPage.addClass("disabled");
                nextPage.addClass("disabled");
            }else {
                lastPage.click(function() {
                    jump(result.pageMsg.pageInfo.pages);
                });
                nextPage.click(function() {
                    jump(result.pageMsg.pageInfo.pageNum+1);
                });
            }

            ul.append(firstPage).append(previousPage);
            $.each(result.pageMsg.pageInfo.navigatepageNums,function(index,item) {
                var numLi =  $("<li></li>").append($("<a></a>").append(item).attr("href","#"));
                if(result.pageMsg.pageInfo.pageNum == item) {
                    numLi.addClass("active");
                }
                numLi.click(function() {
                    jump(item);
                });
                ul.append(numLi);
            });
            ul.append(nextPage).append(lastPage);
            $("<nav></nav>").append(ul).appendTo("#page_nav_area");
        }

        //点击增加按钮触发的事件
        $("#create_modal_button").click(function () {
            resetForm("#emp_form");
            getDepts("#dept_name");
            //弹出模态框
            $("#myModal").modal({
                backdrop:"static"
            });
        });
        //点击编辑按钮触发的事件
        $(document).on("click",".edit_button",function () {
            var empId = $(this).attr("editId");
            $("#inputUpdateEmail").parent().removeClass("has-error has-success");
            $("#emailUpdateHelpBlock").text(" ");
            getDepts("#update_dept_name");
            getEmpInfo(empId);
            $("#update_emp_save_button").attr("empId",empId);
            $("#updateModal").modal({
                backdrop:"static"
            });
        })

        //点击更新按钮触发的事件
        $("#update_emp_save_button").click(function () {
            $("#inputUpdateEmail").parent().removeClass("has-error has-success");
            $("#emailUpdateHelpBlock").text(" ");
            var email = $("#inputUpdateEmail").val();
            var emailReg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
            if(!emailReg.test(email)) {
                $("#inputUpdateEmail").parent().addClass("has-error");
                $("#emailUpdateHelpBlock").text("请输入正确的邮箱格式！");
                return false;
            }else {
                $("#inputUpdateEmail").parent().addClass("has-success");
                $("#emailUpdateHelpBlock").text("");
            }
            $.ajax({
                url:"${APP_PATH}/emps/" + $("#update_emp_save_button").attr("empId"),
                type:"POST",
                data:$("#emp_update_form").serialize(),
                success:function(result) {
                    $("#updateModal").modal("hide");//提交成功后关闭模态框
                    jump(currentPage);
                }
            })
        })

        function getEmpInfo(id) {
            $.ajax({
                url:"${APP_PATH}/emps/" + id,
                type:"GET",
                success: function(result) {
                    $("#update_emp_name").text(result.pageMsg.emp.empName);
                    $("#inputUpdateEmail").val(result.pageMsg.emp.email);
                    $("#updateModal input[name = gender]").val([result.pageMsg.emp.gender]);
                    alert(result.pageMsg.emp.dId);
                    $("#updateModal select").val([result.pageMsg.emp.dId]);
                }
            })
        }
        function resetForm(elem) {
            $(elem)[0].reset();
            $(elem).find("*").removeClass("has-error has-success");
            $(elem).find(".help-block").text(" ");
        }
        //验证输入的用户名和邮箱是否规范
        function validateEmpForm() {
            var empName = $("#inputAddEmpName").val();
            var empNameReg = /(^[a-zA-Z][a-zA-Z0-9_]{4,15}$)|(^[\u4e00-\u9fa5]{2,5}$)/;
            //在校验前先清除原先的校验提示信息以及添加的校验状态
            $("#inputAddEmpName").parent().removeClass("has-error has-success");
            $("#empNameHelpBlock").text(" ");
            $("#inputEmail").parent().removeClass("has-error has-success");
            $("#emailHelpBlock").text(" ");
            if(!empNameReg.test(empName)) {
                $("#inputAddEmpName").parent().addClass("has-error");
                $("#empNameHelpBlock").text("姓名可以为3-5位汉字或4-15位英文字符和数字的组合");
                return false;
            }else {
                $("#inputAddEmpName").parent().addClass("has-success");
                $("#empNameHelpBlock").text("");
            };
            var email = $("#inputEmail").val();
            var emailReg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
            if(!emailReg.test(email)) {
                $("#inputEmail").parent().addClass("has-error");
                $("#emailHelpBlock").text("请输入正确的邮箱格式！");
                return false;
            }else {
                $("#inputEmail").parent().addClass("has-success");
                $("#emailHelpBlock").text("");
            }
            return true;
        }
        //获取所有部门
        function getDepts(elem) {
            $(elem).empty();
            $.ajax({
                url:"${APP_PATH}/depts",
                type:"GET",
                success:function(result) {
                    $.each(result.pageMsg.deptInfo,function(index,item) {
                        $("<option></option>").append(item.deptName).attr("value",item.deptId).appendTo(elem);
                    });
                }
            });
        }

        $("#inputAddEmpName").change(function check() {
            $.ajax({
                url:"${APP_PATH}/checkEmpName",
                type:"GET",
                data: {
                    empName : $("#inputAddEmpName").val()
                },
                success: function(result) {
                    $("#empNameHelpBlock").text(" ");
                    $("#inputAddEmpName").parent().removeClass("has-error has-success");
                    if(result.code == 200) {
                        $("#inputAddEmpName").parent().addClass("has-success");
                        $("#empNameHelpBlock").text(result.pageMsg.Msg);
                        $("#emp_save_button").attr("check","success");
                    }
                    else {
                        $("#inputAddEmpName").parent().addClass("has-error");
                        $("#empNameHelpBlock").text(result.pageMsg.Msg);
                        $("#emp_save_button").attr("check","error");
                    }
                }})
        })

        //点击模态框保存按钮触发的事件
        $("#emp_save_button").click(function() {
            if($(this).attr("check") == "error") {
                return false;
            }   //后端校验
            if(!validateEmpForm()){return false}  //前端校验
            $.ajax({
                url:"${APP_PATH}/emps",
                type:"POST",
                data:$("#emp_form").serialize(),
                success:function(result) {
                    if(result.code == 200) {
                        $("#myModal").modal("hide");//提交成功后关闭模态框
                        jump(totalRecords); //跳到最后一页
                    }
                    else {
                        if(undefined != result.pageMsg.errorMsg.email)allert(result.pageMsg.errorMsg.email);
                        if(undefined != result.pageMsg.errorMsg.empName)allert(result.pageMsg.errorMsg.empName);
                    }
                }
            })
        })
    </script>
</body>
</html>
