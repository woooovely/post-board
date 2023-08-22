<%--
  Created by IntelliJ IDEA.
  User: efusioni
  Date: 2023-08-16
  Time: 오후 4:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="com.pratice.postjsp.domain.post.PostResponse" %>
<html>
<head>
    <title>상세 페이지</title>
</head>
<body>
<div class="content">
    <section>
        <table class="tb tb_row">
            <colgroup>
                <col style="width:10%;"/><col style="width:23%;"/><col style="width:10%;"/><col style="width:23%;"/>
            </colgroup>
            <tbody>
            <tr>
                <th scope="row">글 유형</th>
                <td><c:out value="${post.noticeYn eq false ? '일반' : '공지'}"/> </td>

                <th scope="row">등록일</th>
                <td>
                    <c:set var="createdDateFormatted" value="${post.getCreatedDate().format(DateTimeFormatter.ofPattern('yyyy-MM-dd HH:mm'))}" />
                    ${createdDateFormatted}
                </td>
            </tr>
            <tr>
                <th scope="row">제목</th>
                <td>${post.title}</td>

                <th scope="row">조회</th>
                <td colspan="3">${post.viewCnt}</td>
            </tr>
            <tr>
                <th scope="row">이름</th>
                <td colspan="3">${post.writer}</td>
            </tr>
            <tr>
                <th scope="row">내용</th>
                <td colspan="3">${post.content}</td>
            </tr>
            </tbody>
        </table>
        <p class="btn_set">
            <a href="/post/write.do?id=${post.id}" class="btns btn_bdr4 btn_mid">수정</a>
            <button type="button" onclick="deletePost();" class="btns btn_bdr1 btn_mid">삭제</button>
            <a href="/post/list.do" class="btns btn_bdr3 btn_mid">뒤로</a>
        </p>
    </section>
</div>
</body>
<c:set var="id" value="${post.id}" />

<c:if test="${not empty id}">
    <c:set var="jsId" value="${id}" />
    <script type="text/javascript">
        function deletePost() {
            var id = ${jsId};

            if (!confirm(id + '번 게시글을 삭제할까요?')) {
                return false;
            }

            var formHtml = `
                    <form id="deleteForm" action="/post/delete.do" method="post">
                        <input type="hidden" id="id" name="id" value="${jsId}" />
                    </form>
                `;
            var doc = new DOMParser().parseFromString(formHtml, 'text/html');
            var form = doc.body.firstChild;
            document.body.append(form);
            document.getElementById('deleteForm').submit();
        }
    </script>
</c:if>
</html>
