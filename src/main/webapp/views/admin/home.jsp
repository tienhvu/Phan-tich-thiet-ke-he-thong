<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Home</title>
  <link rel="stylesheet" href="css/admin/home.css" />


</head>

 <body>
     <div class="dashboard-container">

              <div class="dashboard">

                <div class="ui-row-1">

                  <div class="logo-comp">
                    <p>LIBMAN599</p>
                  </div>

                  <div class="search">
                    <input type="search" id="search" name="search" placeholder="Tìm kiếm...">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                      <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                    </svg>
                  </div>

                  <div class="profile">
                    <a class="nav-link" >
                      <img src="img/admin.png">
                      ${sessionScope.username}
                    </a>
                     <a class="nav-link second" href="#" onclick="confirmLogout()">
                       <img src="img/logout.png">
                       Đăng xuất
                     </a>
                  </div>
                </div>

                <div class="ui-row-2">


                      <c:if test="${not empty sessionScope.success}">
                              <div class="alert alert-success">${sessionScope.success}</div>
                                      <%
                                           session.removeAttribute("success");
                                      %>
                              </c:if>


                  <div class="main-content">

                    <div class="header">

                      <div class="page-display">
                        <h1>Trang chủ</h1>
                        <h2>Nhân viên thư viện</h2>
                      </div>

                      <div class="clay-category">
                        <img src="img/payment-method.png" style="width: 21px; height: 21px;" alt="">
                        <p><a href="return-documents">Mượn / Trả tài liệu</a></p>
                      </div>

                      <div class="clay-category">
                        <img src="img/user.png" alt="">
                        <p><a href="#">Bạn đọc</a></p>
                      </div>

                      <div class="clay-category">
                        <img src="img/book1.png" alt="">
                        <p><a href="#">Tài liệu</a></p>
                      </div>
                       <div class="clay-category">
                        <img src="img/book2.png" alt="">
                        <p><a href="bill-list">Hóa đơn</a></p>
                      </div>

                    </div>
                    <hr>
                    <div id="banner" style="background-image: url('img/banner.jpg');">
                        <div class="box-left">
                            <h2>
                                <span>THƯ VIỆN</span> <span>PTIT</span>
                            </h2>

                            <p style="color: white; text-align: left;"">
                                Trong không gian tri thức vô tận,
                                 bạn sẽ đắm chìm trong những trang sách đa dạng,
                                  từ những tác phẩm học thuật sâu sắc đến những kiệt tác văn học kinh điển,
                                   đồng hành cùng sự phát triển và truyền cảm hứng cho tâm hồn bạn.
                                    <br>
                                    "Khám phá thế giới tri thức và truyền cảm hứng cho tâm hồn thông qua
                                     những trang sách tuyệt vời tại thư viện này."
                            </p>
                            <button>Khám phá ngay</button>
                        </div>
                        <div class="box-right">
                            <img src="img/img_1.png" alt="">
                            <img src="img/img_2.png" alt="">
                            <img src="img/img_3.png" alt="">
                        </div>
                        <div class="to-bottom">
                            <a><img src="img/to_bottom.png" alt="">
                            </a>
                        </div>
                    </div>
                    <hr>

                  </div>
                </div>
              </div>
            </div>

    <footer>
        <div class="footer__bottom">
                <p class="footer__text">
                  &copy; 2023 - B20DCCN599
                </p>
              </div>
    </footer>
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