<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<script type="text/javascript" src="<c:url value='/resources/memberResources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		
	});
</script>
<c:forEach var="mVo" items="${menuList}">
	<div class="p-3 border-bottom gold-members">
	    <span class="float-right"><a href="#" class="btn btn-outline-secondary btn-sm" data-toggle="modal" data-target="#option${mVo.memberMenuVo.menuNo}">옵션 선택</a></span>
	    <div class="media">
	        <div class="mr-3 font-weight-bold text-danger non_veg">.</div>
	        <div class="media-body">
	            <h6 class="mb-1">${mVo.memberMenuVo.menuName}</h6>
	            <p class="text-muted mb-0">${mVo.memberMenuVo.menuPrice}원</p>
	        </div>
	    </div>
	</div>
	<div class="modal fade" id="option${mVo.memberMenuVo.menuNo}" tabindex="-1" role="dialog" aria-labelledby="option" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
	                <h5 class="modal-title">${mVo.memberMenuVo.menuName}</h5>
	                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                	<span aria-hidden="true">&times;</span>
	                </button>
                </div>
                <div class="col-md-12" style="text-align: center;line-height: 25">
                	<img src="<c:url value='/resources/imgs/${mVo.memberMenuVo.menuImg}' />" width="250px" height="250px">
                	<br>
					<p class="h5">${mVo.memberMenuVo.menuContent}</p>                 	
                </div>
                <form action="" method="post" id="cartForm">
                	<input type="hidden" name="menuNo" value="${mVo.memberMenuVo.menuNo}">
	                <div class="modal-body p-0">
	                    <div class="osahan-filter">
	                        <div class="filter">
	                            <!--옵션선택 -->
	                            <c:if test="${empty mVo.menuOptionList}">
		                            <div class="p-3 bg-light border-bottom">
		                                <h6 class="m-0">옵션상품이 없습니다.</h6>
		                            </div>
	                            </c:if>
	                            <c:if test="${!empty mVo.menuOptionList}">
		                            <div class="p-3 bg-light border-bottom">
		                                <h6 class="m-0">옵션선택</h6>
		                            </div>
		                            <c:forEach var="oVo" items="${mVo.menuOptionList}">
			                            <div class="custom-control border-bottom px-0  custom-checkbox">
			                                <input type="checkbox" class="custom-control-input" id="defaultCheck${oVo.mOptionNo}" name="mOptionNo" value="${oVo.mOptionNo}">
			                                <label class="custom-control-label py-3 w-100 px-3" for="defaultCheck${oVo.mOptionNo}">${oVo.mOptionName} <p class="text-muted mb-0">${oVo.mOptionPrice}원</p></label>
			                            </div>
		                            </c:forEach>
	                            </c:if>
	                        </div>
	                    </div>
	                </div>
	                <div class="p-3 bg-light border-bottom">
	                    <h6 class="m-0">수량</h6>
	                </div>
	                <div class="modal-footer p-0 border-0">
	                    <div class="col-6 m-0 p-0">
	                        <button type="button" class="btn btn-primary btn-lg btn-block">장바구니담기</button>
	                    </div>
	                    <div class="col-6 m-0 p-0">
	                        <button type="button" class="btn border-top btn-lg btn-block" data-dismiss="modal">취소</button>
	                    </div>
	                </div>
                </form>
            </div>
        </div>
    </div>
</c:forEach>