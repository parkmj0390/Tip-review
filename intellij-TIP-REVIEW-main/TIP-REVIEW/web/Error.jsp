<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>로그인 실패</title>
  <script>
    // 페이지 로드 후 메시지가 있으면 알림 팝업 띄우기
    window.onload = function() {
      var message = "<%= request.getAttribute("resultMessage") %>";
      if (message) {
        alert(message); // 메시지가 있으면 팝업
        // 팝업 확인을 누르면 로그인 페이지로 이동
        window.location.href = "/TIP_REVIEW_war_exploded/Main.jsp"; // 로그인 페이지로 바로 이동
      }
    }
  </script>
</head>
<body>
<h1>로그인 실패</h1>
<p>이 페이지는 로그인에 실패했을 때 표시됩니다. 팝업을 확인한 후 로그인 페이지로 이동합니다.</p>
</body>
</html>

