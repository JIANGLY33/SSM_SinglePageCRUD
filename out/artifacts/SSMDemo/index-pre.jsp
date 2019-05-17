<%--
  Created by IntelliJ IDEA.
  User: 82708
  Date: 2019/5/12
  Time: 20:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:forward page="/emps" />
<html>
<head>
    <!-- 引入JQuery -->
    <script src = "https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <title>Title</title>
    <!-- 引入bootstrap -->
    <link href = "bootstrap-3.3.7-dist/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src = "bootstrap-3.3.7-dist/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<form class="form-horizontal">
    <div class="form-group has-success has-feedback">
        <label class="control-label col-sm-3" for="inputSuccess3">Input with success</label>
        <div class="col-sm-9">
            <input type="text" class="form-control" id="inputSuccess3" aria-describedby="inputSuccess3Status">
            <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
            <span id="inputSuccess3Status" class="sr-only">(success)</span>
        </div>
    </div>
    <div class="form-group has-success has-feedback">
        <label class="control-label col-sm-3" for="inputGroupSuccess2">Input group with success</label>
        <div class="col-sm-9">
            <div class="input-group">
                <span class="input-group-addon">@</span>
                <input type="text" class="form-control" id="inputGroupSuccess2" aria-describedby="inputGroupSuccess2Status">
            </div>
            <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
            <span id="inputGroupSuccess2Status" class="sr-only">(success)</span>
        </div>
    </div>
</form>

</body>
</html>
