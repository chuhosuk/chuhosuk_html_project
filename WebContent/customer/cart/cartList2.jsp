<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>장바구니</title>

<link rel="stylesheet" href="${path}/resources/css/common/header.css">
<link rel="stylesheet" href="${path}/resources/css/common/footer.css">
<link rel="stylesheet" href="${path}/resources/css/admin/ad_productAdd.css">

<script src="https://kit.fontawesome.com/b435fbc087.js" crossorigin="anonymous"></script>

<!-- 3-3.2. 자바스크립트 이벤트 추가: 햄버거버튼을 클릭하면 아래쪽으로 메뉴가 나오도록 main.js에서 추가-->
<!-- defer : 모든 html 파일을 로딩할 때까지 html이 브라우저창에 표시가 안되는 것을 방지 -->
<script src="${path}/resources/js/customer/main.js" defer></script>

<script type="text/javascript">
	$(function() {
		// 게시글 삭제버튼 클릭
		$(".btnDelete").click(function() {
			if(confirm("삭제하시겠습니까?")){
			
			document.cartForm.action="${path}/cartDeleteAction.do";
			document.cartForm.submit();
			}
		});
		
		$(function() {
			// 게시글 삭제버튼 클릭
			$(".btnBuy").click(function() {
				if(confirm("구매하시겠습니까?")){
				
				document.cartForm.action="${path}/buyCartAction.do";
				document.cartForm.submit();
				}
			});
			
		});
		
	});
		/*
		$(".btnBuy").click(function(){
			
			if($(this).is(":checked")){
				confirm("구매하시겠습니까?");
				chkList.prop("checked", true);
				document.cartForm.action="${path}/buyAction.do";
				document.cartForm.submit();
			}else
				chkList.prop("checked", false);
			
			/* if(confirm("구매하시겠습니까?")){
			let is_checked =$(".cartList").prop("checked", is_checked);
			console.log("is_checked:"+ is_checked); 
				 
				
			}	
		});*/
				

</script>

</head>
<body>

<div class="wrap">
	<!----------- header 시작 ---------->
	<%@ include file="/common/header.jsp" %>
	<!-------------header 끝------------->
	
	  <!---------------------------- 컨텐츠 시작  ---------------------------->
   <div id="container">
      
      <div id="contents">
         <!----------------------- 상단 중앙1 시작 ------------------------>
         <div id="section1">
            <h1 align="center"> 카트목록 </h1>
         </div>
         <!----------------------- 상단 중앙2 시작 ------------------------>
         <div id="section2">
            <!----------------------- 좌측메뉴 시작 ----------------------->
            <div id="left" >
               <div class="left_inside">
               		
               <!----------------------- 좌측메뉴바 시작 ------------------------->
               <%@ include file="/common/leftMenu_cus.jsp" %>
               <!----------------------- 좌측메뉴바 종료 ------------------------->
               </div>
            </div>
            <!----------------------- 좌측 메뉴 종료 ------------------------->
            
            <!----------------------- 우측 메뉴 시작 ------------------------->
            <div id="right">
               <div class="table_div">
               <form method=post name="cartForm">
                  <table class="table table-bordered" id="cartList">
                  
			            <colgroup>
			                <col style="width: 5%" />
			                <col style="width: 5%" />
			                <col style="width: 5%" />
			                <col style="width: 20%" />
			                <col style="width: 20%" />
			                <col style="width: 15%" />
				    		<col style="width: 10%" />
			            </colgroup>
			            <tr>          
			               	<th>checkbox</th>   
			                <th>cartNo.</th>
				    		<th>상품이미지</th>   
			                <th>상품명</th>
			                <th>가격</th>
			                <th>수량</th>
                        	<th>삭제</th>
			            </tr>
			            
			            
			            <c:forEach var="dto" items="${list}">
	                   	<tr>
	                   		<td><input type="checkbox" name="cart" class="cartList" value="1"></td>
	                    	<td>${dto.cartNo}</td>
	                    	<td><img src="${dto.pdImg}" width="100"></td><!-- upload 폴더를 새로고침해야 깨진 이미지가 보임 -->
	                    	<td>${dto.pdName}</td>
	                    	<td>${dto.pdPrice}원</td>
	                    	<td>${dto.pdQuantity}</td>
	                        <td>
	                        	<center>
	                        	<input type="hidden" name="cartNo" value="${dto.cartNo}" >
	                        	<%-- <input type="button" value="삭제" onclick="window.location='${path}/ad_product_deleteAction.pd?pdNo=${dto.pdNo}'"> --%>
	                        	
	                        	
	                        	<input type="button" value="삭제" class="btnDelete">
	                        	</center>
	                        </td>
	                        <td>
	                        	<center>
	                        	<input type="hidden" name="pdNo" value="${dto.pdNo}" >
	                        	<%-- <input type="button" value="삭제" onclick="window.location='${path}/ad_product_deleteAction.pd?pdNo=${dto.pdNo}'"> --%>
	                        	
	                        	
	                        	<input type="button" value="구매" class="btnBuy">
	                        	</center>
	                        </td>
	                    </tr>	
                    	</c:forEach>
                     			
                     	<tr>
                     	<td colspan="7" align="center">
                     		<!-- 페이징 처리 -->
                     		<!-- 이전 버튼 활성화 여부 -->
                     		<c:if test="${paging.startPage > 10}">
                     			<a href="${path}/ad_product_list.pd?pageNum=${paging.prev}">[이전]</a>
                     		</c:if>
                     		
                     		<!-- 페이지번호 처리  -->
                     		<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
                     			<a href="${path}/ad_product_list.pd?pageNum=${num}">${num}</a>
                     		</c:forEach>
                     		
                     		<!-- 다음 버튼 활성화 여부 -->
                     		<c:if test="${paging.endPage < paging.pageCount}">
                     			<a href="${path}/ad_product_list.pd?pageNum=${paging.next}">[다음]</a>
                     		</c:if>
                     	</td>
                     </tr>
                  </table>
                <!--  <input type="button" value="구매하기" class="btnBuy"  style="display:right; width:100%; text-align:center"> -->
                 </form>
                   
                 
               </div>
            </div>
            <!--- 우측 메뉴 종료 --->
         </div>
      </div>
   </div>
   <!--- 컨텐츠 종료  --->
   <br><br><br>
	
	<!------------footer 시작------------->
	<%@ include file="/common/footer.jsp" %>
	<!------------footer 끝-------------->
	
</div>
	


</body>
</html>