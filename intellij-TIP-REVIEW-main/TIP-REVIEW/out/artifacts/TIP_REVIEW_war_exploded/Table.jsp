<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="style2.css" rel="stylesheet" />
    <title>스터디 메모</title>
    <style>
        /* 전체 레이아웃 스타일 */
        body {
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            background-color: #cfd4f3;
        }

        h1 {
            color: #333;
            margin-top: 20px;
        }

        /* 시간표 스타일 */
        table {
            width: 80%;
            max-width: 750px;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th,
        td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        th {
            background-color: #0b101ae1;
            color: white;
            border-radius: 4px;
        }

        tr {
            background-color: #ffffff;
        }

        textarea {
            width: 90%;
            height: 69px;
            resize: none;
            border: none;
            text-align: center;
            font-size: 14px;
            padding: 3px;
            background-color: #ffffff;
        }
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.4);
        }

        .modal-content {
            background-color: #fefefe;
            margin: 8% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 50%;
            height: 65%;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 35px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        .modal input, .modal textarea {
            width: 100%;
            height: 65%;
            padding: 10px;
            margin-top: 3px;
            font-size: 20px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

    </style>
</head>
<body>
<h1>스터디 메모</h1>
<!-- 시간표 테이블 -->
<table>
    <tr>
        <th>시간</th>
        <th>월요일</th>
        <th>화요일</th>
        <th>수요일</th>
        <th>목요일</th>
        <th>금요일</th>
    </tr>

    <!-- 첫 번째 시간: 9:30 - 10:20 -->
    <tr>
        <td>9:30 - 10:20</td>
        <td>
            <textarea id="monday1" placeholder=""></textarea>
            <button onclick="openModal('monday1', '9:30 - 10:20', '월요일')">+</button>
        </td>
        <td>
            <textarea id="tuesday1" placeholder=""></textarea>
            <button onclick="openModal('tuesday1', '9:30 - 10:20', '화요일')">+</button>
        </td>
        <td>
            <textarea id="wednesday1" placeholder=""></textarea>
            <button onclick="openModal('wednesday1', '9:30 - 10:20', '수요일')">+</button>
        </td>
        <td>
            <textarea id="thursday1" placeholder=""></textarea>
            <button onclick="openModal('thursday1', '9:30 - 10:20', '목요일')">+</button>
        </td>
        <td>
            <textarea id="friday1" placeholder=""></textarea>
            <button onclick="openModal('friday1', '9:30 - 10:20', '금요일')">+</button>
        </td>
    </tr>

    <!-- 두 번째 시간: 10:30 - 11:20 -->
    <tr>
        <td>10:30 - 11:20</td>
        <td>
            <textarea id="monday2" placeholder=""></textarea>
            <button onclick="openModal('monday2', '10:30 - 11:20', '월요일')">+</button>
        </td>
        <td>
            <textarea id="tuesday2" placeholder=""></textarea>
            <button onclick="openModal('tuesday2', '10:30 - 11:20', '화요일')">+</button>
        </td>
        <td>
            <textarea id="wednesday2" placeholder=""></textarea>
            <button onclick="openModal('wednesday2', '10:30 - 11:20', '수요일')">+</button>
        </td>
        <td>
            <textarea id="thursday2" placeholder=""></textarea>
            <button onclick="openModal('thursday2', '10:30 - 11:20', '목요일')">+</button>
        </td>
        <td>
            <textarea id="friday2" placeholder=""></textarea>
            <button onclick="openModal('friday2', '10:30 - 11:20', '금요일')">+</button>
        </td>
    </tr>

    <!-- 세 번째 시간: 11:30 - 12:20 -->
    <tr>
        <td>11:30 - 12:20</td>
        <td>
            <textarea id="monday3" placeholder=""></textarea>
            <button onclick="openModal('monday3', '11:30 - 12:20', '월요일')">+</button>
        </td>
        <td>
            <textarea id="tuesday3" placeholder=""></textarea>
            <button onclick="openModal('tuesday3', '11:30 - 12:20', '화요일')">+</button>
        </td>
        <td>
            <textarea id="wednesday3" placeholder=""></textarea>
            <button onclick="openModal('wednesday3', '11:30 - 12:20', '수요일')">+</button>
        </td>
        <td>
            <textarea id="thursday3" placeholder=""></textarea>
            <button onclick="openModal('thursday3', '11:30 - 12:20', '목요일')">+</button>
        </td>
        <td>
            <textarea id="friday3" placeholder=""></textarea>
            <button onclick="openModal('friday3', '11:30 - 12:20', '금요일')">+</button>
        </td>
    </tr>

    <!-- 세 번째 시간: 11:30 - 12:20 -->
    <tr>
        <td>12:30 - 13:20</td>
        <td>
            <textarea id="monday4" placeholder=""></textarea>
            <button onclick="openModal('monday4', '12:30 - 13:20', '월요일')">+</button>
        </td>
        <td>
            <textarea id="tuesday4" placeholder=""></textarea>
            <button onclick="openModal('tuesday4', '12:30 - 13:20', '화요일')">+</button>
        </td>
        <td>
            <textarea id="wednesday4" placeholder=""></textarea>
            <button onclick="openModal('wednesday4', '12:30 - 13:20', '수요일')">+</button>
        </td>
        <td>
            <textarea id="thursday4" placeholder=""></textarea>
            <button onclick="openModal('thursday4', '12:30 - 13:20', '목요일')">+</button>
        </td>
        <td>
            <textarea id="friday4" placeholder=""></textarea>
            <button onclick="openModal('friday4', '12:30 - 13:20', '금요일')">+</button>
        </td>
    </tr>

    <tr>
        <td>13:30 - 14:20</td>
        <td>
            <textarea id="monday5" placeholder=""></textarea>
            <button onclick="openModal('monday5', '13:30 - 14:20', '월요일')">+</button>
        </td>
        <td>
            <textarea id="tuesday5" placeholder=""></textarea>
            <button onclick="openModal('tuesday5', '13:30 - 14:20', '화요일')">+</button>
        </td>
        <td>
            <textarea id="wednesday5" placeholder=""></textarea>
            <button onclick="openModal('wednesday5', '13:30 - 14:20', '수요일')">+</button>
        </td>
        <td>
            <textarea id="thursday5" placeholder=""></textarea>
            <button onclick="openModal('thursday5', '13:30 - 14:20', '목요일')">+</button>
        </td>
        <td>
            <textarea id="friday5" placeholder=""></textarea>
            <button onclick="openModal('friday5', '13:30 - 14:20', '금요일')">+</button>
        </td>
    </tr>

    <tr>
        <td>14:30 - 15:20</td>
        <td>
            <textarea id="monday6" placeholder=""></textarea>
            <button onclick="openModal('monday6', '14:30 - 15:20', '월요일')">+</button>
        </td>
        <td>
            <textarea id="tuesday6" placeholder=""></textarea>
            <button onclick="openModal('tuesday6', '14:30 - 15:20', '화요일')">+</button>
        </td>
        <td>
            <textarea id="wednesday6" placeholder=""></textarea>
            <button onclick="openModal('wednesday6', '14:30 - 15:20', '수요일')">+</button>
        </td>
        <td>
            <textarea id="thursday6" placeholder=""></textarea>
            <button onclick="openModal('thursday6', '14:30 - 15:20', '목요일')">+</button>
        </td>
        <td>
            <textarea id="friday6" placeholder=""></textarea>
            <button onclick="openModal('friday6', '14:30 - 15:20', '금요일')">+</button>
        </td>
    </tr>

    <tr>
        <td>15:30 - 16:20</td>
        <td>
            <textarea id="monday7" placeholder=""></textarea>
            <button onclick="openModal('monday7', '15:30 - 16:20', '월요일')">+</button>
        </td>
        <td>
            <textarea id="tuesday7" placeholder=""></textarea>
            <button onclick="openModal('tuesday7', '15:30 - 16:20', '화요일')">+</button>
        </td>
        <td>
            <textarea id="wednesday7" placeholder=""></textarea>
            <button onclick="openModal('wednesday7', '15:30 - 16:20', '수요일')">+</button>
        </td>
        <td>
            <textarea id="thursday7" placeholder=""></textarea>
            <button onclick="openModal('thursday7', '15:30 - 16:20', '목요일')">+</button>
        </td>
        <td>
            <textarea id="friday7" placeholder=""></textarea>
            <button onclick="openModal('friday7', '15:30 - 16:20', '금요일')">+</button>
        </td>
    </tr>

    <tr>
        <td>16:30 - 17:20</td>
        <td>
            <textarea id="monday8" placeholder=""></textarea>
            <button onclick="openModal('monday8', '16:30 - 17:20', '월요일')">+</button>
        </td>
        <td>
            <textarea id="tuesday8" placeholder=""></textarea>
            <button onclick="openModal('tuesday8', '16:30 - 17:20', '화요일')">+</button>
        </td>
        <td>
            <textarea id="wednesday8" placeholder=""></textarea>
            <button onclick="openModal('wednesday8', '16:30 - 17:20', '수요일')">+</button>
        </td>
        <td>
            <textarea id="thursday8" placeholder=""></textarea>
            <button onclick="openModal('thursday8', '16:30 - 17:20', '목요일')">+</button>
        </td>
        <td>
            <textarea id="friday8" placeholder=""></textarea>
            <button onclick="openModal('friday8', '16:30 - 17:20', '금요일')">+</button>
        </td>
    </tr>

    <tr>
        <td>17:25 - 18:15</td>
        <td>
            <textarea id="monday9" placeholder=""></textarea>
            <button onclick="openModal('monday9', '17:25 - 18:15', '월요일')">+</button>
        </td>
        <td>
            <textarea id="tuesday9" placeholder=""></textarea>
            <button onclick="openModal('tuesday9', '17:25 - 18:15', '화요일')">+</button>
        </td>
        <td>
            <textarea id="wednesday9" placeholder=""></textarea>
            <button onclick="openModal('wednesday9', '17:25 - 18:15', '수요일')">+</button>
        </td>
        <td>
            <textarea id="thursday9" placeholder=""></textarea>
            <button onclick="openModal('thursday9', '17:25 - 18:15', '목요일')">+</button>
        </td>
        <td>
            <textarea id="friday9" placeholder=""></textarea>
            <button onclick="openModal('friday9', '17:25 - 18:15', '금요일')">+</button>
        </td>
    </tr>

    <tr>
        <td>18:15 - 19:05</td>
        <td>
            <textarea id="monday10" placeholder=""></textarea>
            <button onclick="openModal('monday10', '18:15 - 19:05', '월요일')">+</button>
        </td>
        <td>
            <textarea id="tuesday10" placeholder=""></textarea>
            <button onclick="openModal('tuesday10', '18:15 - 19:05', '화요일')">+</button>
        </td>
        <td>
            <textarea id="wednesday10" placeholder=""></textarea>
            <button onclick="openModal('wednesday10', '18:15 - 19:05', '수요일')">+</button>
        </td>
        <td>
            <textarea id="thursday10" placeholder=""></textarea>
            <button onclick="openModal('thursday10', '18:15 - 19:05', '목요일')">+</button>
        </td>
        <td>
            <textarea id="friday10" placeholder=""></textarea>
            <button onclick="openModal('friday10', '18:15 - 19:05', '금요일')">+</button>
        </td>
    </tr>

    <tr>
        <td>19:05 - 19:55</td>
        <td>
            <textarea id="monday11" placeholder=""></textarea>
            <button onclick="openModal('monday11', '19:05 - 19:55', '월요일')">+</button>
        </td>
        <td>
            <textarea id="tuesday11" placeholder=""></textarea>
            <button onclick="openModal('tuesday11', '19:05 - 19:55', '화요일')">+</button>
        </td>
        <td>
            <textarea id="wednesday11" placeholder=""></textarea>
            <button onclick="openModal('wednesday11', '19:05 - 19:55', '수요일')">+</button>
        </td>
        <td>
            <textarea id="thursday11" placeholder=""></textarea>
            <button onclick="openModal('thursday11', '19:05 - 19:55', '목요일')">+</button>
        </td>
        <td>
            <textarea id="friday11" placeholder=""></textarea>
            <button onclick="openModal('friday11', '19:05 - 19:55', '금요일')">+</button>
        </td>
    </tr>

    <tr>
        <td>19:55 - 20:45</td>
        <td>
            <textarea id="monday12" placeholder=""></textarea>
            <button onclick="openModal('monday12', '19:55 - 20:45', '월요일')">+</button>
        </td>
        <td>
            <textarea id="tuesday12" placeholder=""></textarea>
            <button onclick="openModal('tuesday12', '19:55 - 20:45', '화요일')">+</button>
        </td>
        <td>
            <textarea id="wednesday12" placeholder=""></textarea>
            <button onclick="openModal('wednesday11', '19:55 - 20:45', '수요일')">+</button>
        </td>
        <td>
            <textarea id="thursday12" placeholder=""></textarea>
            <button onclick="openModal('thursday11', '19:55 - 20:45', '목요일')">+</button>
        </td>
        <td>
            <textarea id="friday12" placeholder=""></textarea>
            <button onclick="openModal('friday12', '19:55 - 20:45', '금요일')">+</button>
        </td>
    </tr>

    <tr>
        <td>20:45 - 21:35</td>
        <td>
            <textarea id="monday13" placeholder=""></textarea>
            <button onclick="openModal('monday13', '20:45 - 21:35', '월요일')">+</button>
        </td>
        <td>
            <textarea id="tuesday13" placeholder=""></textarea>
            <button onclick="openModal('tuesday13', '20:45 - 21:35', '화요일')">+</button>
        </td>
        <td>
            <textarea id="wednesday13" placeholder=""></textarea>
            <button onclick="openModal('wednesday13', '20:45 - 21:35', '수요일')">+</button>
        </td>
        <td>
            <textarea id="thursday13" placeholder=""></textarea>
            <button onclick="openModal('thursday13', '20:45 - 21:35', '목요일')">+</button>
        </td>
        <td>
            <textarea id="friday13" placeholder=""></textarea>
            <button onclick="openModal('friday13', '20:45 - 21:35', '금요일')">+</button>
        </td>
    </tr>
</table>

<!-- 모달 (팝업창) -->
<div id="studyModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <h2 id="modalTitle"></h2>
        <textarea id="modalTextArea" placeholder="추가 메모"></textarea><br>
        <button onclick="saveModalData()">저장</button>
    </div>
</div>

<!-- 모달 관련 스크립트 -->
<script>
    // 각 날짜마다 별도의 모달을 관리하기 위한 객체
    const modalData = {
        monday: '',
        tuesday: '',
        wednesday: '',
        thursday: '',
        friday: ''
    };

    let currentDay = '';

    function openModal(textAreaId, time, day) {
        // 클릭한 날짜에 해당하는 모달 열기
        currentDay = day.toLowerCase(); // 날짜 정보 저장 (예: monday, tuesday)
        document.getElementById('modalTitle').innerText = `${time} - ${day} 추가 메모`;
        document.getElementById('modalTextArea').value = modalData[currentDay] || ''; // 이미 저장된 메모가 있다면 채워넣기
        document.getElementById('studyModal').style.display = 'block';
    }

    function closeModal() {
        document.getElementById('studyModal').style.display = 'none';
    }

    function saveModalData() {
        // 모달에 작성한 내용을 modalData에 저장 (textarea와는 별개)
        const modalText = document.getElementById('modalTextArea').value;
        modalData[currentDay] = modalText; // 현재 날짜에 대한 메모만 저장
        closeModal(); // 저장 후 모달 닫기
    }
</script>

</body>
</html>