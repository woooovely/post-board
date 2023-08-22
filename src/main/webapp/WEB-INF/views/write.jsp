<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>글작성 페이지</title>
</head>
<body>
<div class="page_tits">
    <h3>게시판 관리</h3>
    <p class="path"><strong>현재 위치 :</strong> <span>게시판 관리</span> <span>리스트형</span> <span>글작성</span></p>
</div>
<div class="content">
    <section>
        <form id="saveForm" method="post" action="<c:if test="${post == null}">/post/save.do</c:if><c:if test="${post != null}">/post/update.do</c:if>" autocomplete="off">
            <!-- 게시글 수정인 경우, 서버로 전달할 게시글 번호 (PK) -->
            <input type="hidden" id="id" name="id" value="${post != null ? post.id : ''}" />
            <!-- 서버로 전달할 공지글 여부 -->
            <input type="hidden" id="noticeYn" name="noticeYn" />

            <table class="tb tb_row">
                <colgroup>
                    <col style="width:15%;" /><col style="width:35%;" /><col style="width:15%;" /><col style="width:35%;" />
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row">공지글</th>
                    <td><span class="chkbox"><input type="checkbox" id="isNotice" name="isNotice" class="chk" /><i></i><label for="isNotice"> 설정</label></span></td>
                    <th scope="row">등록일</th>
                    <td colspan="3"><input type="text" id="createdDate" name="createdDate" readonly value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>" /></td>
                </tr>
                <tr>
                    <th>제목 <span class="es">필수 입력</span></th>
                    <td colspan="3"><input type="text" id="title" name="title" maxlength="50" placeholder="제목을 입력해 주세요." /></td>
                </tr>
                <tr>
                    <th>이름 <span class="es">필수 입력</span></th>
                    <td colspan="3"><input type="text" id="writer" name="writer" maxlength="10" placeholder="이름을 입력해 주세요." /></td>
                </tr>
                <tr>
                    <th>내용 <span class="es">필수 입력</span></th>
                    <td colspan="3"><textarea id="content" name="content" cols="50" rows="10" placeholder="내용을 입력해 주세요."></textarea></td>
                </tr>
            </table>

            <p class="btn_set">
                <button type="button" id="saveBtn" class="btns btn_st3 btn_mid">저장</button>
                <a href="/post/list.do" class="btns btn_bdr3 btn_mid">뒤로</a>
            </p>
        </form>
    </section>
</div>
<script type="text/javascript">
    window.onload = function() {
        initCreatedDate();

        // 저장 버튼 클릭 이벤트에 savePost 함수 연결
        document.getElementById('saveBtn').addEventListener('click', function() {
            savePost();
        });
    }

    function initCreatedDate() {
        document.getElementById('createdDate').value = new Date().toISOString().slice(0, 10);
    }

    function savePost() {
        var form = document.getElementById('saveForm');
        var fields = [form.title, form.writer, form.content];
        var fieldNames = ['제목', '이름', '내용'];

        for (var i = 0, len = fields.length; i < len; i++) {
            // isValid 함수 호출 대신 예시 메시지 출력
            if (!fields[i].value) {
                alert(fieldNames[i] + '을(를) 입력해주세요.');
                return;
            }
        }

        document.getElementById('saveBtn').disabled = true;
        form.noticeYn.value = form.isNotice.checked;
        form.submit();
    }
</script>
</body>
</html>
