<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reader Card Detail</title>
  <link rel="stylesheet" href="css/reader/readerCard-detail.css" />
  <link
        href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;1,500&family=Roboto:wght@100;300;400;500;700;900&family=Schibsted+Grotesk&display=swap"
        rel="stylesheet"
      />

    <style>
        :root {
            --card-width: 600px;
            --card-width-left: calc(var(--card-width)*0.2);
            --card-width-right: calc(var(--card-width)*0.8);
            --primary-text-color: #273F6E;
        }
        .info {
            margin-bottom: 20px;
        }
        .face {
            margin-top: 30px;
        }

    </style>
</head>
<body>

   <div class="navbar">
         <div><a href="reader-home" class="navbar_text">Trở lại</a></div>
    </div>


    <div class="card-container">
            <ul class="card-content left">
                <li class="logo">
                    <img src="img/ptit-logo.png" alt="">
                </li>
                <li class="face">
                    <img src="img/face.png" alt="">
                </li>
                <li class="student-code">
                    <p class="title">Mã SV</p>
                    <p class="value">${sessionScope.readerCard.getStudent_code()}</p>
                </li>
            </ul>
            <ul class="card-content right">
                <li class="school">
                    <p class="big-title">Học viện</p>
                    <p class="small-title">Công nghệ bưu chính viễn thông</p>
                </li>
                <li class="title-card">
                    <p>Thẻ bạn đọc</p>
                </li>
                <ul class="info">
                    <li>Mã thẻ bạn đọc:
                          <span style="color: red;">${sessionScope.readerCard.getId()}</span>
                    </li>
                    <li>Họ và tên:
                        <span> ${sessionScope.member.getName()}</span>
                    </li>
                    <li>Giới tính:
                        <span>${sessionScope.readerCard.getGender()}</span>
                    </li>
                    <li>
                        Ngày sinh: <span>${sessionScope.member.getDob()}</span>
                    </li>
                    <li>Lớp:
                        <span>${sessionScope.readerCard.getStudent_class()}</span>
                    </li>
                    <li>Email:
                        <span>${sessionScope.member.getEmail()}</span>
                    </li>
                    <li>Ngày đăng ký:
                        <span>${sessionScope.readerCard.getRegis_date()}</span>
                    </li>

                </ul>

            </ul>
        </div>
    <footer>
            <div class="footer__bottom">
                    <p class="footer__text">
                      &copy; 2023 - B20DCCN599
                    </p>
                  </div>
        </footer>

</body>
</html>