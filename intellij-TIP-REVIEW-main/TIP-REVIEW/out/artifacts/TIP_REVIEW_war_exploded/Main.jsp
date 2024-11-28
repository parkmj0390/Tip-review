<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>로그인</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.min.css">
    <style>
        body{
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #cfd4f3;
        }

        /* 로그인 컨테이너 */
        .login-container {
            width: 400px;
            padding: 40px;
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
            margin-bottom: 20px;
        }

        /* 입력 필드 */
        .input-field {
            width: 93%;
            padding: 12px;
            margin: 0 3px;
            font-size: 14px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        /* 로그인 버튼 스타일 */
        .login-btn {
            width: 100%;
            padding: 12px;
            margin-top: 5px;
            font-size: 16px;
            font-weight: bold;
            background-color: #0b101ae1;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .login-btn:hover {
            background-color: #0b101af2;
        }

        /* 오류 메시지 스타일 */
        .message {
            margin: 5px;
            font-size: 14px;
            color: red;
        }

        /* 기타 링크 스타일 */
        .extra-options {
            margin-top: 5px;
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
<section>
    <div class="login-container">
        <form action="/TIP_REVIEW_war_exploded/userController?action=login" method="post">
            <div class="logo">스터디 메모</div>

            <!-- 아이디 입력 필드 -->
            <div class="form-outline mb-3">
                <input type="text" id="email" name="email" class="input-field" placeholder="아이디" />
            </div>

            <!-- 비밀번호 입력 필드 -->
            <div class="form-outline mb-3">
                <input type="password" id="password" name="password" class="input-field" placeholder="비밀번호" />
            </div>

            <!-- 오류 메시지 -->
            <%
                String resultMessage = (String) request.getAttribute("resultMessage");
                if (resultMessage == null) {
                    resultMessage = "";
                }
            %>
            <p class="message"><%= resultMessage %></p>

            <!-- 로그인 버튼 -->
            <button type="submit" class="login-btn">로그인</button>

            <!-- 회원가입 링크 -->
            <div class="extra-options">
                <p><a href="/TIP_REVIEW_war_exploded/signUpForm.jsp"> 회원가입</a></p>
            </div>
        </form>
    </div>
</section>
</body>
</html>
