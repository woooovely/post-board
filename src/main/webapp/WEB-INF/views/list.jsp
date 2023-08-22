<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="com.pratice.postjsp.domain.post.PostResponse" %>
<html>
<head>
    <title>게시글 목록</title>
</head>
<body>
<div class="content">
    <section>
        <div class="search_box">
            <form id="searchForm" action="/post/list.do" method="get">
                <div class="sch_group fl">
                    <select title="검색 유형 선택" name="searchType" id="searchType">
                        <option value="all" <c:if test="${params.searchType eq 'all'}">selected</c:if>>전체 검색</option>
                        <option value="title" <c:if test="${params.searchType eq 'title'}">selected</c:if>>제목</option>
                        <option value="content" <c:if test="${params.searchType eq 'content'}">selected</c:if>>내용</option>
                        <option value="writer" <c:if test="${params.searchType eq 'writer'}">selected</c:if>>작성자</option>
                    </select>
                    <input type="text" placeholder="키워드를 입력해 주세요." title="키워드 입력" name="keyword" id="keyword" value="<c:out value="${params.keyword}"/> "/>
                    <input type="submit" id="submit-btn">
                </div>
            </form>
        </div>

        <table class="tb tb_col" id="board-table">
            <colgroup>
                <col style="width:50px;"/><col style="width:7.5%;"/><col style="width:auto;"/><col style="width:10%;"/><col style="width:15%;"/><col style="width:7.5%;"/>
            </colgroup>
            <thead>
            <tr>
                <th scope="col"><input type="checkbox"/></th>
                <th scope="col">번호</th>
                <th scope="col">제목</th>
                <th scope="col">작성자</th>
                <th scope="col">등록일</th>
                <th scope="col">조회</th>
            </tr>
            </thead>
            <tbody>
            <c:if test="${not empty posts}">
                <c:forEach var="row" items="${posts}" varStatus="status">
                    <tr>
                        <td><input type="checkbox"/></td>
                        <td><c:out value="${row.noticeYn eq false ? (size[status.index] - index[status.index]) : '공지'}"/></td>
                        <td class="tl">
                            <a href="/post/view.do?id=${row.id}"><c:out value="${row.title}" /></a>

                        </td>
                        <td <c:out value="${row.writer}"/>></td>
                        <td>
                            <c:set var="createdDateFormatted" value="${row.getCreatedDate().format(DateTimeFormatter.ofPattern('yyyy-MM-dd HH:mm'))}" />
                                ${createdDateFormatted}
                        </td>
                        <td <c:out value="${row.viewCnt}"/>></td>
                    </tr>
                </c:forEach>
            </c:if>
            <c:if test="${empty posts}">
                <td colspan="5">
                    <div class="no_data_msg">검색된 결과가 없습니다.</div>
                </td>
            </c:if>
            </tbody>
        </table>

        <div class="paging">
            <a href="#" class="page_bt first">첫 페이지</a><a href="#" class="page_bt prev">이전 페이지 그룹</a>
            <p><span class="on">1</span><a href="#">2</a><a href="#">3</a><a href="#">4</a><a href="#">5</a><a href="#">6</a><a href="#">7</a><a href="#">8</a><a href="#">9</a><a href="#">10</a></p>
            <a href="#" class="page_bt next">다음 페이지 그룹</a><a href="#" class="page_bt last">마지막 페이지</a>
        </div>

        <p class="btn_set tr">
            <a href="/post/write.do" class="btns btn_st3 btn_mid">글쓰기</a>
        </p>
    </section>
</div>
</body>
</html>