<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta http-equiv="x-ua-compatible" content="ie=edge" />
  <title>Form Login</title>
  <link rel="stylesheet" href="css/login.css" />
</head>

 <body>
    <body>
        <div class="container">
          <div class="wraper">
            <div class="image--container">
            	<img src="img/banner.jpg"/>
            </div>
            <div class="login-container__main">
              <div class="login-container__title">Đăng nhập</div>

                <!-- Hiển thị thông báo thành công -->
                <%
                String success = (String) request.getSession().getAttribute("success");
                if (success != null && !success.isEmpty()) {
                %>
                <div class="info-message">
                    <p style="color: green;"><%= success %></p>
                </div>
                <% } %>

                <% String error = (String) request.getSession().getAttribute("error"); %>
                <% if (error != null && !error.isEmpty()) { %>
                <div class="error-message">
                    <p style="color: red;"><%= error %></p>
                </div>
                <% } %>


              <form class="login-form" action="login" method="post">
                <div class="login-form__input-email">
                  <label for="email">Tên đăng nhập</label>
                  <input type="text" name="username" required/>
                </div>
                <div class="login-form__input-password">
                  <label for="password">Mật khẩu</label>
                  <input type="password" name="password" required/>
                </div>
                <div class="forgot-password"><a href="#">Quên mật khẩu?</a></div>
                <button class="login-form__button" type="submit">Đăng nhập</button>
                <div class="newuser__sign-in">Chưa có tài khoản?<a href="register"> Đăng ký</a></div>
              </form>
            </div>
          </div>
        </div>
      </body>



 </body>
 </html>