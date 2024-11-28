<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>회원가입</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.min.css">
  <style>
    * {
      margin: 0;
      padding: 0;
    }

    body {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
      font-family: Arial, sans-serif;
      background-color: #cfd4f3;
    }

    /* 회원가입 컨테이너 */
    .signup-container {
      width: 430px;
      padding: 30px;
      background-color: rgba(255, 255, 255, 0.9);
      border-radius: 8px;
      box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.3);
      text-align: center;
    }

    /* 로고 스타일 */
    .logo {
      font-size: 30px;
      color: #0b101ae1;
      font-weight: bold;
      margin-bottom: 5px;
    }

    /* 입력 필드 */
    .input-field {
      width: 90%;
      padding: 12px;
      margin: 8px 0;
      font-size: 14px;
      border: 1px solid #ddd;
      border-radius: 4px;
    }

    /* 회원가입 버튼 스타일 */
    .signup-btn {
      width: 100%;
      padding: 12px;
      margin-top: 8px;
      font-size: 16px;
      font-weight: bold;
      background-color: #0b101ae1;
      color: #fff;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }

    .signup-btn:hover {
      background-color: #0b101af2;
    }

    /* 오류 메시지 스타일 */
    .message {
      margin-top: 5px;
      font-size: 14px;
      color: red;
    }

    /* 기타 링크 스타일 */
    .extra-options {
      margin-top: 20px;
      font-size: 12px;
      color: #666;
    }

    .extra-options a {
      color: #032140;
      text-decoration: none;
      margin: 0 5px;
    }

    .extra-options a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>
<div class="container">
  <div class="row d-flex justify-content-center align-items-center">
    <div class="card-body p-md-5">
      <div class="row justify-content-center">
        <form class="container signup-container" method="post" action="/TIP_REVIEW_war_exploded/userController?action=register" >
          <div class="logo">회원 가입</div>
          </a>
          <p class="text-center h1 fw-bold"></p>
          <!-- 아이디 입력 -->
          <div class="form-outline">
            <input type="text" id="username" name="username" class="input-field" placeholder="이름" />
          </div>
          <!-- 비밀번호 입력 -->
          <div class="form-outline">
            <input type="email" id="email" name="email" class="input-field" placeholder="이메일"/>
          </div>
          <!-- 이메일 입력 -->
          <div class="form-outline">
            <input type="password" id="password" name="password" class="input-field" placeholder="비밀번호"/>
          </div>
          <!-- 회원가입 버튼 -->
          <!-- <button type="submit" class="signup-btn btn btn-primary btn-block">회원가입</button> -->
          <!-- 회원가입 버튼 -->
          <button type="submit" class="signup-btn" style="margin-bottom: 10px;">회원가입</button>
          <!-- 로그인 화면으로 버튼 -->
          <a href="/TIP_REVIEW_war_exploded/home" class="btn btn-secondary btn-block">로그인 화면으로</a>

        </form>
        <script>
          document.querySelector('.signup-btn').addEventListener('click', function (event) {
            const username = document.getElementById('username').value.trim();
            const email = document.getElementById('email').value.trim();
            const password = document.getElementById('password').value.trim();

            if (!username || !email || !password) {
              event.preventDefault();
              alert("모든 필드를 입력해주세요.");
              return;
            }

            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(email)) {
              event.preventDefault();
              alert("유효한 이메일 주소를 입력해주세요.");
              return;
            }

            if (password.length < 6) {
              event.preventDefault();
              alert("비밀번호는 최소 6자 이상이어야 합니다.");
            }
          });
        </script>
      </div>
    </div>
  </div>
</div>

</body>
</html>
