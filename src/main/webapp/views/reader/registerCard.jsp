<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Register Card</title>
  <link rel="stylesheet" href="css/register.css" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
          crossorigin="anonymous">
    <style>
        .navbar {
            position:fixed !important;
            top:0;
            left: 0;
            right: 0;
            z-index: 1;
        }
        #register {
            margin-top: 50px;
        }

        .form-group input:disabled+ label {
            top: 0px;
            font-size: 13px;
            font-weight: 500;
            color: #1a73e8;
        }

    </style>
</head>

 <body>


     <nav class="navbar navbar-expand-lg navbar-light bg-light">
         <div class="container-fluid">
           <div class="collapse navbar-collapse" id="navbarNav">
             <ul class="navbar-nav me-auto mb-2 mb-lg-0">
               <li class="header nav-item text-center"  style="margin-right:20px;">
                   <a href="reader-home" class="text-decoration-none text-reset">
                        <div class="d-flex align-items-center">
                            <img src="img/home.png" style="margin-right: 5px; transform: translateY(-2px);"> Home
                        </div>
                   </a>
               </li>
               <li class="header nav-item text-center">
                   <a  class="text-decoration-none text-reset">
                         <div class="d-flex align-items-center">
                                <img src="img/add-user.png" style="margin-right: 5px; transform: translateY(-2px);"> Đăng ký thẻ bạn đọc
                         </div>
                   </a>
                </li>

             </ul>

             <ul class="navbar-nav ml-auto mb-2 mb-lg-0">
               <li class="nav-item">
                 <a class="nav-link btn btn-light text-center">
                   <img src="img/user.png">
                   ${sessionScope.username}
                 </a>
               </li>

               <li class="nav-item">
                  <a class="nav-link btn btn-light text-center" href="#" onclick="confirmLogout()">
                    <img src="img/logout.png">
                    Đăng xuất
                  </a>
               </li>
             </ul>
           </div>
         </div>
       </nav>


    <div id="wrapper">
            <form id="register" action="readerCard" method="post">

                <h2>Đăng ký thẻ bạn đọc</h2>
                <br>

                <p id="error-message" style="color:red;" class="errorRegis">${errorRegis}</p>

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <input type="text" required name="name" value="<c:out value='${member.name}' />" disabled />
                            <label for="">Họ và tên</label>
                        </div>

                        <div class="form-group">
                            <input type="text" required name="dob" value="<c:out value='${member.dob}' />" disabled />
                            <label for="">Ngày sinh</label>
                        </div>

                        <div class="form-group">
                            <input type="email" required name="email" value="<c:out value='${member.email}' />" disabled />
                            <label for="">Email</label>
                        </div>

                    </div>
                    <div class="col-md-6">


                        <div class="form-group">
                            <input type="text" required name="studentCode" />
                            <label for="">Mã sinh viên</label>
                        </div>

                        <div class="form-group">
                            <input type="text" required name="student_class" />
                            <label for="">Lớp</label>
                        </div>
                        <div class="form-group">
                            <input type="text" required name="gender" placeholder="Nam/Nữ"/>
                            <label for="">Giới tính</label>
                        </div>
                    </div>
                </div>

                <input type="submit" value="Đăng ký" id="btn-register" />

            </form>
        </div>

<script>
    function confirmLogout() {
        var result = confirm("Bạn có chắc chắn muốn đăng xuất?");
        if (result) {

            window.location.href = "logout";
        }
    }
</script>
</body>
</html>