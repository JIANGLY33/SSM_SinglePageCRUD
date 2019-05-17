<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
                <button type="button" class="btn btn-success">新增</button>
                <button type="button" class="btn btn-danger">删除</button>
            </div>
        </div>
        <!-- 表格数据 -->
        <div class = "row">
            <div class = "col-md-12">
                <table class="table table-hover">
                    <tr>
                        <th>Employee_ID</th>
                        <th>Employee_Name</th>
                        <th>Gender</th>
                        <th>Email</th>
                        <th>Department_Name</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${pageInfo.list}" var = "emp" >
                        <tr>
                            <th>${emp.empId}</th>
                            <th>${emp.empName}</th>
                            <th>${emp.gender == "M"?"男":"女"}</th>
                            <th>${emp.email}</th>
                            <th>${emp.dept.deptName}</th>
                            <th>
                                <button class = "btn btn-info btn-primary btn-sm">
                                    <span class="glyphicon glyphicon-pencil " aria-hidden="true"></span>编辑
                                </button>
                                <button class="btn btn-warning btn-primary btn-sm">
                                    <span class="glyphicon glyphicon-trash " aria-hidden="true"></span>删除
                                </button>
                            </th>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
        <!-- 分页信息 -->
        <div class = "row">
            <div class = "col-md-6">
                当前在第${pageInfo.pageNum}页，共有${pageInfo.pages}页，${pageInfo.total}条记录
            </div>
            <div class = "col-md-6">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li >
                            <c:if test = "${!pageInfo.isFirstPage}">
                                <a href = "${APP_PATH}/emps?pageNum=1">首页</a>
                            </c:if>
                        </li>
                        <li>
                            <c:if test = "${pageInfo.hasPreviousPage}">
                                <a href="${APP_PATH}/emps?pageNum=${pageInfo.prePage}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                                </a>
                            </c:if>
                        </li>
                            <c:forEach items="${pageInfo.navigatepageNums}" var="pageNum">
                                <c:if test="${pageInfo.pageNum == pageNum}">
                                    <li><a class = "active" href="${APP_PATH}/emps?pageNum=${pageNum}">${pageNum}</a></li>
                                </c:if>
                                <c:if test="${pageInfo.pageNum != pageNum}">
                                    <li><a href="${APP_PATH}/emps?pageNum=${pageNum}">${pageNum}</a></li>
                                </c:if>
                            </c:forEach>
                        <li>
                            <c:if test="${pageInfo.hasNextPage}">
                                <a href="${APP_PATH}/emps?pageNum=${pageInfo.nextPage}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </c:if>
                        </li>
                        <li>
                            <c:if test="${!pageInfo.isLastPage}">
                                <a href = "${APP_PATH}/emps?pageNum=${pageInfo.pages}">末页</a>
                            </c:if>
                        </li>
                    </ul>
                </nav>

            </div>
        </div>
    </div>
</body>
</html>
