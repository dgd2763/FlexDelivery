


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- top 시작-->


<%@include file="../../../ownerInc/jianSidebarTop.jsp"%>
<!-- top 끝 -->


<script type="text/javascript">
	$(function(){
		$('.btn').click(function(){
			var advertiseNo = $(this).val();
			location.href='<c:url value="/owner/menu2/advertise/advertiseWrite.do?advertiseNo='+advertiseNo+'" />';
		});
		
	});
</script>
		<br>
		<br>
		<br>
		<br>
			<div class="text-center">
				  <p class="card-text text-center mb-5 mt-3" style="font-size:30px; color:#023047;"><b>✅광고 선택 부탁드려요✅</b></p>
			</div>
		<br>
		
		<!-- row 시작 -->
		<div class="row"> 
			<c:forEach var="vo" items="${list}">
			<!-- flex deivery ad 설명 -->
			<div class="col-md-2 col-sm-12"></div>
			<div class="col-md-8 col-sm-12">
				<div class="card">
					<div class="card-content">
				       <img class="card-img-top img-fluid" src="${pageContext.request.contextPath}/resources/ownerResources/assets/images/samples/aerial-panoramic-image-of-sansonvale-lake-X6TCENW.jpg" alt="Card image cap">
				       <div class="card-body">
				           <h4 class="card-title">${vo.advertiseName }</h4>
				           <p class="card-text">
				               	안녕하세요. ${vo.advertiseName }는 고객들의 니즈를 파악하기 위해 항상 노력중이며
				               	이로 인한 사장님들의 만족도가 높을것으로 예상됩니다.
				           </p>
				            <p class="card-text">
				               	승인날을 기준으로 한달의 유효기간을 가집니다.
				           </p>
				           <p class="card-text text-right">
				               	<span>가격 : ${vo.advertisePrice }</span>
				               	<span>월정액 시스템 입니다.</span>
				           </p>
				           <div class="text-right">
				         	  <button class="btn btn-primary block" id="btFlexAD" value="${vo.advertiseNo}" name="btFlexAD">선택</button>
				           </div>
				       </div>
				   </div>
				</div>
			</div>
			<div class="col-md-2 col-sm-12"></div>
			</c:forEach>
		
		</div>
		<!-- row 끝 -->
		
		
<!-- bottom 시작-->
<%@include file="../../../ownerInc/jianSidebarBottom.jsp"%>


		