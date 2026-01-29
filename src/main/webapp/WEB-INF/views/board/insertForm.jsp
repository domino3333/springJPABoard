<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>T1 Community | Write</title>
<style>
    /* T1 Official Theme */
    :root {
        --t1-red: #E2012D;
        --t1-black: #0f0f0f;
        --t1-gray: #1a1a1a;
        --t1-gold: #C69C6D;
    }

    body {
        background-color: var(--t1-black);
        font-family: 'Pretendard', sans-serif;
        color: #ffffff;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        margin: 0;
    }

    .write-container {
        width: 100%;
        max-width: 700px;
        background: var(--t1-gray);
        padding: 40px;
        border-radius: 15px;
        border: 2px solid var(--t1-red);
        box-shadow: 0 0 30px rgba(226, 1, 45, 0.2);
    }

    .header {
        text-align: center;
        margin-bottom: 40px;
    }

    .header h1 {
        font-size: 2rem;
        font-weight: 900;
        letter-spacing: -1px;
    }

    .header span {
        color: var(--t1-red);
    }

    /* Form Styles */
    .form-group {
        margin-bottom: 25px;
    }

    .form-group label {
        display: block;
        font-size: 0.9rem;
        color: var(--t1-gold);
        margin-bottom: 8px;
        text-transform: uppercase;
        font-weight: bold;
    }

    input[type="text"], textarea {
        width: 100%;
        padding: 12px 15px;
        background: #0b0b0b;
        border: 1px solid #333;
        border-radius: 5px;
        color: #fff;
        font-size: 1rem;
        box-sizing: border-box;
        transition: 0.3s;
    }

    input[type="text"]:focus, textarea:focus {
        border-color: var(--t1-red);
        outline: none;
        box-shadow: 0 0 10px rgba(226, 1, 45, 0.3);
    }

    textarea {
        resize: none;
        height: 250px;
    }

    /* Buttons */
    .btn-area {
        display: flex;
        gap: 15px;
        margin-top: 30px;
    }

    .btn {
        flex: 1;
        padding: 15px;
        font-size: 1rem;
        font-weight: bold;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: 0.3s;
        text-transform: uppercase;
        /* 중앙 정렬 핵심 속성 */
        display: flex;           
        justify-content: center; /* 가로 중앙 */
        align-items: center;     /* 세로 중앙 */
        text-decoration: none;   /* 링크 밑줄 제거 */
        text-align: center;
        box-sizing: border-box;  /* 패딩이 너비에 영향을 주지 않도록 설정 */
    }

    .btn-submit {
        background: var(--t1-red);
        color: #fff;
    }

    .btn-submit:hover {
        background: #ff1a4a;
        transform: translateY(-3px);
        box-shadow: 0 5px 15px rgba(226, 1, 45, 0.5);
    }

    .btn-cancel {
        background: #333;
        color: #bbb;
    }

    .btn-cancel:hover {
        background: #444;
        color: #fff;
    }

    /* Decoration */
    .bottom-deco {
        margin-top: 30px;
        font-size: 12px;
        color: #444;
        text-align: center;
        font-family: monospace;
    }
</style>
</head>
<body>

<div class="write-container">
    <div class="header">
        <h1>게시판</h1>
    </div>

    <form action="/board/insert" method="post">
        <div class="form-group">
            <label for="writer">작성자</label>
            <input type="text" id="writer" name="writer" placeholder="작성자 이름을 입력하세요" required>
        </div>

        <div class="form-group">
            <label for="title">제목</label>
            <input type="text" id="title" name="title" placeholder="게시글 제목을 입력하세요" required>
        </div>

        <div class="form-group">
            <label for="content">글내용</label>
            <textarea id="content" name="content" placeholder="T1 선수들에게 보낼 응원의 메시지를 작성하세요"></textarea>
        </div>

        <div class="btn-area">
            <a href="/board/boardList" class="btn btn-cancel">게시판리스트</a>
            <button type="submit" class="btn btn-cancel">게시판전송</button>
            <button type="reset" class="btn btn-cancel">게시판취소</button>
        </div>
    </form>

</div>

</body>
</html>