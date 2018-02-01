<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!--  -->

<div class="ui container contents">
	<table class="ui celled padded table">
		
			<tr align="center">
				<th>'${map.keyword }' 에 대한 영화 검색결과 (${map.searchcount }개)</th>
			</tr>
		
			<tr>
				<td>

					<div class="ui link special cards four columns">
						<c:forEach var="i" items="${map.searchmov}">
							<div class="card column blurring dimmable image main_movie">
								<!-- 영화 번호 넣을자리 -->
								<input type="hidden" value="${i.movie_num}" />
								<!-- 영화이미지 넣을자리 -->
								<c:choose>
									<c:when test="${i.movie_image eq '이미지 없음'}">
										<img src="resources/images/no_image.png">
									</c:when>
									<c:otherwise>
										<c:forTokens var="item" items="${i.movie_image}" delims="|"
											end="0">
											<img src="${item}">
										</c:forTokens>
									</c:otherwise>
								</c:choose>
								<div class="ui dimmer">
									<div class="ui content">
										<div class="ui center">
											<p>${i.movie_kor_title}</p>
											<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
											<br /> <br />
											<div class="ui divider"></div>
											<br /> <br /> <br />
											<div class="ui star rating" data-rating="5"
												data-max-rating="5"></div>
										</div>
									</div>
								</div>
							</div>

							<div class="ui modal movie" id="modal${i.movie_num}">
								<i class="close icon"></i>
								<div class="header">영화</div>
								<div class="image content">
									<div class="ui medium image">
										<img src="resources/images/travel.jpg">
									</div>
									<div class="description">
										<div class="ui header">영화제목 : ${i.movie_kor_title}</div>
										<h4>줄거리 : ${i.movie_summary}</h4>
										<p>
											개봉일 :
											<fmt:formatDate pattern="yyyy/MM/dd" dateStyle="short"
												value="${i.movie_opening_date}" />
										</p>
									</div>
								</div>
								<div class="actions">
									<div class="ui black deny button">닫기</div>
									<div class="ui positive right labeled icon button">
										상세페이지로 이동 <i class="checkmark icon"></i>
									</div>
								</div>
								<div id="bb"></div>

							</div>
						</c:forEach>
					</div>

				</td>
			</tr>

	</table>

	
			
			
			<table class="ui celled padded table">
					<tr align="center">
						<th>'${map.keyword }' 에 대한 자유게시판 검색결과 (${map.boardcount }개)</th>
					</tr>
			</table>
			<table class="ui selectable celled padded table">
					<tr>
						<th class="center aligned two wide">작성일</th>
						<th class="center aligned two wide">작성자</th>
						<th class="center aligned ten wide">제목</th>
						<th class="center aligned two wide">조회 수</th>
	
					</tr>
				
				
					<c:forEach items="${map.searchbod }" var="boardDTO">
						<tr>
							<td class="center aligned">
								<span>${boardDTO.board_date }</span>
							</td>
							<td class="center aligned">
								<a href="#">${boardDTO.board_writer }</a>
							</td>
							<td class="center aligned">
								<c:url var="boardView" value="boardDetail">
									<c:param name="num" value="${boardDTO.board_num }"></c:param>
									<c:param name="currentPage" value="${pv.currentPage}"></c:param>
								</c:url>
								<a href="${boardView }">
									${boardDTO.board_name }
								</a>
							</td>
							<td class="center aligned">
								${boardDTO.board_hits }
							</td>
						</tr>
					</c:forEach>
			</table>
			
		<c:if test="${pv.startPage > 1}">
			<div class="ui animated button" onclick="location.href='free?currentPage=${pv.startPage - pv.blockPage}'">
				<div class="visible content">이전</div>
				<div class="hidden content">
					<i class="left arrow icon"></i>
				</div>
			</div>
		</c:if>
	
		<c:forEach var="i" begin="${pv.startPage }" end="${pv.endPage }">
			<c:url var="currPage" value="free">
				<c:param name="currentPage" value="${i }" />
			</c:url>
			<a class="ui button" href="${currPage }"> <c:out value="${i }" />
			</a>
		</c:forEach>
		
		<c:if test="${pv.totalPage>pv.endPage }">
			<div class="ui animated button" onclick="location.href='free?currentPage=${pv.startPage + pv.blockPage }'">
				<div class="visible content">다음</div>
				<div class="hidden content">
					<i class="right arrow icon"></i>
				</div>
			</div>
		</c:if>
</div>
