<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reader Home</title>
  <link rel="stylesheet" href="css/reader/home.css" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
          crossorigin="anonymous">

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
                <a href="readerCard" class="text-decoration-none text-reset">
                      <div class="d-flex align-items-center">
                             <img src="img/reader-card.jpg" style="width: 33px ; height: 21px; margin-right: 5px; transform: translateY(-2px);"> Thẻ bạn đọc
                      </div>
                </a>
             </li>

          </ul>

          <ul class="navbar-nav ml-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link btn btn-light text-center" >
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


     <section>
            <div id="notification" class="alert alert-warning" style="display: none; padding-top: 90px;">
                        Chức năng này hiện tại chưa phát triển. Vui lòng thử lại sau.
                    </div>
            <c:if test="${not empty sessionScope.success}">
                    <div class="alert alert-success" style="padding-top: 90px;">${sessionScope.success}. Xem chi tiết thẻ bạn đọc<a href="readerCard-detail">
                     tại đây</a>
                    </div>
                    <%
                        session.removeAttribute("success");
                    %>
                </c:if>
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
                     <img src="img/img_2.png" alt="">
                     <img src="img/img_1.png" alt="">
                     <img src="img/img_3.png" alt="">
                 </div>
                 <div class="to-bottom">
                     <a><img src="img/to_bottom.png" alt="">
                     </a>
                 </div>
             </div>
             <div class="container">
                    <div id="wp-products1">
                            <h2 class="text-center">SÁCH THỊNH HÀNH</h2>
                        </div>
                    <div class="row">
                              <!-- Sách 1 -->
                              <div class="col-md-3 mb-5 ">
                                  <div class="card crd-ho">
                                      <div class="card-body text-center">
                                          <img src="img/product_1.jpg" alt="" style="width: 150px; height: 200px;" class="img-thumblin">
                                          <div class="stars">
                                              <span> <img src="img/star.png" alt="">
                                              </span> <span> <img src="img/star.png" alt="">
                                              </span> <span> <img src="img/star.png" alt="">
                                              </span> <span> <img src="img/star.png" alt="">
                                              </span> <span> <img src="img/star.png" alt="">
                                              </span>
                                          </div>
                                          <div class="name">Bí Mật bị thời gian vùi lấp</div>
                                          <div class="author">Tác giả: Đồng Hoa</div>

                                          <div class="row">
                                              <div class="col">
                                                  <a href="" class="btn btn-muon btn-danger btn-sm d-inline-block"
                                                      style="width: 66px; text-align: center;">Mượn</a>
                                                  <a href="" class="btn btn-chitiet btn-success btn-sm d-inline-block">
                                                      Chi tiết
                                                  </a>
                                              </div>
                                          </div>
                                      </div>
                                  </div>
                              </div>

                              <!-- Sách 2 -->
                              <div class="col-md-3 mb-5">
                                  <div class="card  crd-ho">
                                      <div class="card-body text-center">
                                          <img src="img/product_2.jpg" alt="" style="width: 150px; height: 200px;" class="img-thumblin">
                                          <div class="stars">
                                              <span> <img src="img/star.png" alt="">
                                              </span> <span> <img src="img/star.png" alt="">
                                              </span> <span> <img src="img/star.png" alt="">
                                              </span> <span> <img src="img/star.png" alt="">
                                              </span> <span> <img src="img/star.png" alt="">
                                              </span>
                                          </div>
                                          <div class="name">Ái tình nơi đầu lưỡi</div>
                                          <div class="author">Tác giả: Jo Kyung Ran</div>

                                          <div class="row">
                                              <div class="col">
                                                  <a href="" class="btn btn-muon btn-danger btn-sm d-inline-block"
                                                      style="width: 66px; text-align: center;">Mượn</a> <a href=""
                                                      class="btn btn-chitiet btn-success btn-sm d-inline-block">Chi tiết</a>

                                              </div>
                                          </div>
                                      </div>
                                  </div>
                              </div>
                              <!-- Sách 3 -->
                              <div class="col-md-3 mb-5 ">
                                  <div class="card crd-ho">
                                      <div class="card-body text-center">
                                          <img src="img/product_3.jpg" alt="" style="width: 150px; height: 200px;" class="img-thumblin">
                                          <div class="stars">
                                              <span> <img src="img/star.png" alt="">
                                              </span> <span> <img src="img/star.png" alt="">
                                              </span> <span> <img src="img/star.png" alt="">
                                              </span> <span> <img src="img/star.png" alt="">
                                              </span> <span> <img src="img/star.png" alt="">
                                              </span>
                                          </div>
                                          <div class="name">Anh không muốn để em một mình</div>
                                          <div class="author">Tác giả: Diệp Lạc Vũ Tâm</div>

                                          <div class="row">
                                              <div class="col">
                                                  <a href="" class="btn  btn-muon btn-danger btn-sm d-inline-block"
                                                      style="width: 66px; text-align: center;">Mượn</a>
                                                  <a href="" class="btn btn-chitiet btn-success btn-sm d-inline-block">
                                                      Chi tiết
                                                  </a>
                                              </div>
                                          </div>
                                      </div>
                                  </div>
                              </div>
                              <!-- Sách 4 -->
                              <div class="col-md-3 mb-5 ">
                                  <div class="card crd-ho">
                                      <div class="card-body text-center">
                                          <img src="img/product_4.jpg" alt="" style="width: 150px; height: 200px;" class="img-thumblin">
                                          <div class="stars">
                                              <span> <img src="img/star.png" alt="">
                                              </span> <span> <img src="img/star.png" alt="">
                                              </span> <span> <img src="img/star.png" alt="">
                                              </span> <span> <img src="img/star.png" alt="">
                                              </span> <span> <img src="img/star.png" alt="">
                                              </span>
                                          </div>
                                          <div class="name">Ngôi nhà nghìn hành lang</div>
                                          <div class="author">Tác giả: Diana Wynne Jones</div>

                                          <div class="row">
                                              <div class="col">
                                                  <a href="" class="btn btn-muon btn-danger btn-sm d-inline-block"
                                                      style="width: 66px; text-align: center;">Mượn</a>
                                                  <a href="" class="btn btn-chitiet btn-success btn-sm d-inline-block">
                                                      Chi tiết
                                                  </a>
                                              </div>
                                          </div>
                                      </div>
                                  </div>
                              </div>
                              <!-- Sách 5 -->
                              <div class="col-md-3 mb-5 ">
                                  <div class="card crd-ho">
                                      <div class="card-body text-center">
                                          <img src="img/product_5.jpg" alt="" style="width: 150px; height: 200px;" class="img-thumblin">
                                          <div class="stars">
                                              <span> <img src="img/star.png" alt="">
                                              </span> <span> <img src="img/star.png" alt="">
                                              </span> <span> <img src="img/star.png" alt="">
                                              </span> <span> <img src="img/star.png" alt="">
                                              </span> <span> <img src="img/star.png" alt="">
                                              </span>
                                          </div>
                                          <div class="name">The Sun, The Moon, The Stars</div>
                                          <div class="author">Tác giả: Junot Díaz</div>

                                          <div class="row">
                                              <div class="col">
                                                  <a href="" class="btn btn-muon btn-danger btn-sm d-inline-block"
                                                      style="width: 66px; text-align: center;">Mượn</a>
                                                  <a href="" class="btn btn-chitiet btn-success btn-sm d-inline-block">
                                                      Chi tiết
                                                  </a>
                                              </div>
                                          </div>
                                      </div>
                                  </div>
                              </div>
                              <!-- Sách 6 -->
                              <div class="col-md-3 mb-5 ">
                                  <div class="card crd-ho">
                                      <div class="card-body text-center">
                                          <img src="img/product_6.jpg" alt="" style="width: 150px; height: 200px;" class="img-thumblin">
                                          <div class="stars">
                                              <span> <img src="img/star.png" alt="">
                                              </span> <span> <img src="img/star.png" alt="">
                                              </span> <span> <img src="img/star.png" alt="">
                                              </span> <span> <img src="img/star.png" alt="">
                                              </span> <span> <img src="img/star.png" alt="">
                                              </span>
                                          </div>
                                          <div class="name">Dangerous Frames</div>
                                          <div class="author">Tác giả: Richard A. Muller</div>

                                          <div class="row">
                                              <div class="col">
                                                  <a href="" class="btn btn-muon btn-danger btn-sm d-inline-block"
                                                      style="width: 66px; text-align: center;">Mượn</a>
                                                  <a href="" class="btn btn-chitiet btn-success btn-sm d-inline-block">
                                                      Chi tiết
                                                  </a>
                                              </div>
                                          </div>
                                      </div>
                                  </div>
                              </div>
                              <!-- Sách 7 -->
                              <div class="col-md-3 mb-5 ">
                                  <div class="card crd-ho">
                                      <div class="card-body text-center">
                                          <img src="img/product_7.jpg" alt="" style="width: 150px; height: 200px;" class="img-thumblin">
                                          <div class="stars">
                                              <span> <img src="img/star.png" alt="">
                                              </span> <span> <img src="img/star.png" alt="">
                                              </span> <span> <img src="img/star.png" alt="">
                                              </span> <span> <img src="img/star.png" alt="">
                                              </span> <span> <img src="img/star.png" alt="">
                                              </span>
                                          </div>
                                          <div class="name">Kinh Thi Việt Nam</div>
                                          <div class="author">Tác giả: Nguyễn Bách Khoa</div>

                                          <div class="row">
                                              <div class="col">
                                                  <a href="" class="btn btn-muon btn-danger btn-sm d-inline-block"
                                                      style="width: 66px; text-align: center;">Mượn</a>
                                                  <a href="" class="btn btn-chitiet btn-success btn-sm d-inline-block">
                                                      Chi tiết
                                                  </a>
                                              </div>
                                          </div>
                                      </div>
                                  </div>
                              </div>
                              <!-- Sách 8 -->
                              <div class="col-md-3 mb-5 ">
                                  <div class="card crd-ho">
                                      <div class="card-body text-center">
                                          <img src="img/product_8.jpg" alt="" style="width: 150px; height: 200px;" class="img-thumblin">
                                          <div class="stars">
                                              <span> <img src="img/star.png" alt="">
                                              </span> <span> <img src="img/star.png" alt="">
                                              </span> <span> <img src="img/star.png" alt="">
                                              </span> <span> <img src="img/star.png" alt="">
                                              </span> <span> <img src="img/star.png" alt="">
                                              </span>
                                          </div>
                                          <div class="name">Hành trình về phương Đông</div>
                                          <div class="author">Tác giả: Baird T. Spalding</div>

                                          <div class="row">
                                              <div class="col">
                                                  <a href="" class="btn btn-muon btn-danger btn-sm d-inline-block"
                                                      style="width: 66px; text-align: center;">Mượn</a>
                                                  <a href="" class="btn btn-chitiet btn-success btn-sm d-inline-block">
                                                      Chi tiết
                                                  </a>
                                              </div>
                                          </div>
                                      </div>
                                  </div>
                              </div>


                              <div class="text-center mt-1 mb-1">
                                  <a class="btn btn-danger btn-md text-white" style="margin-bottom: 8px;">Tất cả</a>
                              </div>
                              <br>
                              <hr>
                          </div>
              </div>
         </section>

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

document.addEventListener("DOMContentLoaded", function () {
    var notification = document.getElementById("notification");
    var borrowButtons = document.querySelectorAll(".btn-muon");
    var detailButtons = document.querySelectorAll(".btn-chitiet");
    var allButtons = [...borrowButtons, ...detailButtons];
    allButtons.forEach(function (button) {
        button.addEventListener("click", function (event) {
            event.preventDefault();

            // Kiểm tra trạng thái đăng ký thẻ bạn đọc ở đây
            var userHasLibraryCard = false; // Đây là ví dụ, bạn cần kiểm tra theo dữ liệu thực tế

            if (userHasLibraryCard) {
                window.location.href = this.getAttribute("href"); // Chuyển đến trang Mượn
            } else {
                notification.style.display = "block";

                window.scrollTo({
                     top: notification.offsetTop,
                     behavior: "smooth"
                });
            }
        });
    });
});


</script>
 </body>
 </html>