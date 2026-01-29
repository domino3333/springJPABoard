<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>

<style>
    * {
        box-sizing: border-box;
    }

    body {
        margin: 0;
        min-height: 100vh;
        background: linear-gradient(135deg, #667eea, #764ba2);
        font-family: 'Segoe UI', sans-serif;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .container {
        width: 520px;
        background: #ffffff;
        padding: 35px 40px;
        border-radius: 14px;
        box-shadow: 0 20px 40px rgba(0,0,0,0.25);
        animation: fadeIn 0.6s ease;
    }

    @keyframes fadeIn {
        from {
            opacity: 0;
            transform: translateY(20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    h2 {
        margin-bottom: 30px;
        text-align: center;
        font-size: 24px;
        color: #4b4b9b;
        letter-spacing: 1px;
    }

    .form-group {
        margin-bottom: 22px;
    }

    label {
        display: block;
        margin-bottom: 8px;
        font-size: 14px;
        font-weight: 600;
        color: #555;
    }

    input,
    textarea {
        width: 100%;
        padding: 12px 14px;
        border-radius: 8px;
        border: 1px solid #ddd;
        font-size: 14px;
        transition: all 0.25s ease;
    }

    input:focus,
    textarea:focus {
        outline: none;
        border-color: #667eea;
        box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.15);
    }

    textarea {
        resize: none;
    }

    .btn-area {
        display: flex;
        justify-content: space-between;
        margin-top: 35px;
    }

    button {
        width: 48%;
        padding: 12px;
        border-radius: 8px;
        border: none;
        font-size: 15px;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.25s ease;
    }

    .btn-submit {
        background: linear-gradient(135deg, #667eea, #764ba2);
        color: #fff;
    }

    .btn-submit:hover {
        transform: translateY(-2px);
        box-shadow: 0 10px 20px rgba(102,126,234,0.4);
    }

    .btn-reset {
        background: #f0f0f0;
        color: #555;
    }

    .btn-reset:hover {
        background: #e2e2e2;
    }

</style>

</head>
<body>

<div class="container">

    <h2>${message}</h2>
    
    <a href="/board/insertForm"><button class="btn">게시판 등록</button></a> 
    <a href="/board/boardList"><button class="btn">게시판 리스트</button></a> 


</div>

</body>
</html>