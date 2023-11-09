<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta http-equiv="x-ua-compatible" content="ie=edge" />
  <title>Register Member</title>
  <link rel="stylesheet" href="css/register.css" />

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>

 <body>
    <div id="wrapper">
        <form id="register" action="register" method="post">
            <h2>Đăng ký tài khoản</h2>

                    <!-- Hiển thị thông báo lỗi -->
                    <%
                    String errorRegis = (String) request.getSession().getAttribute("errorRegis");
                    if (errorRegis != null && !errorRegis.isEmpty()) {
                    %>
                    <div class="error-message">
                        <p style="color: red;"><%= errorRegis %></p>
                    </div>
                    <% } %>

            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <input type="text" required name="username" />
                        <label for="">Tên đăng nhập</label>
                    </div>

                    <div class="form-group">
                        <input type="password" required name="password" />
                        <label for="">Mật khẩu</label>
                    </div>

                    <div class="form-group">
                        <input type="password" required name="repassword" />
                        <label for="">Nhập lại mật khẩu</label>
                    </div>

                    <div class="form-group">
                        <input type="text" required name="name" />
                        <label for="">Họ và tên</label>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <input type="date" required name="dob" />
                        <label for="">Ngày sinh</label>
                    </div>

                    <div class="form-group">
                        <input type="email" required name="email" />
                        <label for="">Email</label>
                    </div>

                    <div class="form-group">
                        <input type="text" required name="address" />
                        <label for="">Địa chỉ</label>
                    </div>

                    <div class="form-group">
                        <input type="text" required name="phone" />
                        <label for="">Số điện thoại</label>
                    </div>
                </div>
            </div>

            <input type="submit" value="Đăng ký" id="btn-register" />
            <div class="form-group">
                <span>Đã có tài khoản? <a href="login">Đăng nhập</a></span>
            </div>
        </form>
    </div>


 </body>
 </html>