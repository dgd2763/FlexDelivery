<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../adminInc/top.jsp" %>    
	
<!-- css start -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/simple-datatables/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/app.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/ownerResources/assets/images/favicon.svg" type="image/x-icon">
<!-- css end -->

<div class="container">
	<div class="row">
		<div class="row" id="table-hover-row">
			<div class="col-12">
			 	<div class="card">
			 	
			  		<div class="card-header">
						<h4 class="card-title">쿠폰 관리 - 이벤트 쿠폰</h4>
			    	</div>
			    	<div class="card-content">
						<div class="card-body" style="text-align: right;">
			        		<!-- 등록모달 호출하는 등록버튼 -->
							<button type="button" class="btn btn-dark round block" id="modalWriteBt"
							   data-toggle="modal" data-backdrop="false" data-target="#eventCouponWrite" >
							     등록
							</button>						
							<!-- #eventCouponWrite 모달 start -->
							<div class="modal fade text-left" id="eventCouponWrite" tabindex="-1" 
		                        role="dialog" aria-labelledby="이벤트 쿠폰 등록" aria-hidden="true">
		                        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
		                           <div class="modal-content">
										<form name="frmEventCouponWrite" method="post" action="<c:url value='/admin/menu6/eventCoupon/write.do' />">
		                                	<div class="modal-header">
			                                    <h4 class="modal-title" id="gpWrite">이벤트쿠폰 - 등록</h4>
			                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			                                       <i data-feather="x"></i>
			                                    </button>
			                                </div>
			                                <div class="modal-body">                                 
			                                    <div class="row">
			                                       <div class="col-12">   
			                                          <div class="table-responsive" style="text-align: center;">
			                                             <table class="table mb-0" >
															<thead style="text-align: center;">
																<tr>
																	<th>번호</th>
																	<th colspan="3">쿠폰이름</th>
																	<th>시작일</th>
																	<th>만료일</th>
																	<th>할인가격</th>
													                <th>최소주문금액</th>
																</tr>
															</thead>
			                                                <tbody style="text-align: center;">
			                                                   <tr>
			                                                   	  <td>
			                                                   	  	  <input type="text" name="eCouponNo" value="123" readonly>
			                                                   	  </td>
			                                                      <td colspan="3">
			                                                      	  <input type="text" name="eCouponName">
			                                                      </td>
			                                                      <td>
			                                    	               	<input type="text" name="eCouponStartDate">
			                                                      </td>
			                                                      <td>
			                                    	               	<input type="text" name="eCouponEndDate">
			                                                      </td>
			                                                      <td>
			                                    	               	<input type="text" name="eCouponDc">
			                                                      </td>
			                                                      <td>
			                                    	               	<input type="text" name="eCouponMin">
			                                                      </td>
			                                                   </tr>
			                                                </tbody>
			                                             </table>                      
			                                          </div>
			                                       </div>
			                                    </div>        
			                                 </div>
			                                 <div class="modal-footer">
			                                    <button type="button" class="btn btn-outline-dark" data-dismiss="modal">
			                                       <i class="bx bx-x d-block d-sm-none"></i>
			                                       <span class="d-none d-sm-block">닫기</span>
			                                    </button>
			                                    <button type="button" class="btn btn-dark ml-1" data-dismiss="modal" name="modalWrite" id="modalWrite" onclick="form.submit()">
			                                       <i class="bx bx-check d-block d-sm-none"></i>
			                                       <span class="d-none d-sm-block">등록</span>
			                                    </button>
											</div>
										</form><!-- frmEventCouponWrite등록 폼 모달 -->
									</div>
								</div>
							</div>
						
							<!-- #regularCouponWrite 모달 end -->			    	
						    <div class="table-responsive">
						    	<table class="table table-hover mb-0" style="text-align: center;">
						            <thead>
						              <tr>
						                <th>번호</th>
						                <th colspan="3">쿠폰 코드</th>
										<th>시작일</th>
										<th>만료일</th>
										<th>할인가격</th>
						                <th>최소주문금액</th>
						                <th>비고</th>
						              </tr>
						            </thead>
						            <c:if test="${empty list }">
						              <tr>
						                <td colspan="9" class="text-bold-500" style="text-align: center;">등록된 데이터가 없습니다.</td>
						              </tr>
						           	</c:if>
						           	<c:if test="${!empty list }">
						          		<c:forEach var="vo" items="${list }" varStatus="status" >
						            <tbody>
						              <tr>
						                 <td class="text-bold-500">${vo.eCouponNo }</td>
						                 <td colspan="3">${vo.eCouponName }</td>
						                 <td>${vo.eCouponStartDate }</td>
						                 <td>${vo.eCouponEndDate }</td>
						                 <td>${vo.eCouponDc }</td>
						                 <td>${vo.eCouponMin }</td>
						                 <td>
						                 	<button type="button" class="btn btn-primary round btEdit" id="modalEditBt${vo.eCouponNo}"
		                                       data-toggle="modal" data-backdrop="false" data-target="#eventCouponEdit${vo.eCouponNo}">
		                                       	수정</button>					                                       
	                                        <button type="button" class="round btn btn-danger" data-toggle="modal" data-backdrop="false" 
	                                          data-target="#eventCouponDelete${vo.eCouponNo}" id="modalDeleteBt${vo.eCouponNo}">
	                                          	삭제</button>
	                                          	
                                       		<!-- #eventCouponDelete 삭제 모달 -->
	                                       <div class="modal fade text-left" id="eventCouponDelete${vo.eCouponNo}" tabindex="-1" role="dialog"
	                                          aria-labelledby="이벤트 쿠폰 삭제" aria-hidden="true">
	                                          <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
	                                             <div class="modal-content">
	                                                <form name="frmEventCouponDel" id="frmEventCouponDel" method="post" action="<c:url value='/admin/menu6/eventCoupon/delete.do' />">
	                                                   <div class="modal-header bg-danger">
	                                                      <h5 class="modal-title white" id="myModalLabel140"> 이벤트 쿠폰 삭제</h5>
	                                                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                                                          <i data-feather="x"></i>
	                                                      </button>
	                                                   </div>
	                                                   <div class="modal-body">
	                                                      <input type="hidden" name="eCouponNo" value="${vo.eCouponNo }">
	                                                      <input type="hidden" name="eCouponName" value="${vo.eCouponName }">
	                                                      <input type="hidden" name="eCouponStartDate" value="${vo.eCouponStartDate }">
	                                                      <input type="hidden" name="eCouponEndDate" value="${vo.eCouponEndDate }">
	                                                      <input type="hidden" name="eCouponDc" value="${vo.eCouponDc }">
	                                                      <input type="hidden" name="eCouponMin" value="${vo.eCouponMin }">
	                                                      [<span style="font-weight: bolder;">${vo.eCouponName}</span>] 쿠폰을 삭제하시겠습니까?
	                                                   </div>
	                                                   <div class="modal-footer">
	                                                      <button type="button" class="btn btn-light-secondary" data-dismiss="modal" id="modalDelCancel">
	                                                         <i class="bx bx-x d-block d-sm-none"></i>
	                                                         <span class="d-none d-sm-block">취소</span>
	                                                      </button>
	                                                      
	                                                      <button type="button" class="btn btn-danger ml-1" data-dismiss="modal" id="modalDel" onclick="form.submit()">
	                                                         <i class="bx bx-check d-block d-sm-none"></i>
	                                                         <span class="d-none d-sm-block">삭제</span>
	                                                      </button>
	                                                   </div>
	                                                </form>
	                                             </div>
	                                          </div>
	                                       </div> <!-- #eventCouponDelete 삭제 모달 end-->
	                                       
	                                       <!-- #eventCouponEdit 수정 모달 -->
	                                       <div class="modal fade text-left" id="eventCouponEdit${vo.eCouponNo}" tabindex="-1" 
	                                          role="dialog" aria-labelledby="이벤트 쿠폰 수정" aria-hidden="true">
	                                          <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
	                                             <div class="modal-content">
	                                    			<form name="frmEventCouponEdit" method="post" action="<c:url value='/admin/menu6/eventCoupon/edit.do' />">
	                                                   <div class="modal-header">
	                                                      <h4 class="modal-title" id="myModalEventCouponEdit">이벤트쿠폰 - 수정</h4>
	                                                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                                                         <i data-feather="x"></i>
	                                                      </button>
	                                                   </div>
	                                                   <div class="modal-body">
	                                                   <!-- Hoverable rows start -->
	                                                      <div class="row" id="table-hover-row">
	                                                         <div class="col-12">   
	                                                            <div class="table-responsive" style="text-align: center;">
	                                                               <table class="table mb-0">
		                                                               <thead>
															              <tr>
															                <th>번호</th>
															                <th colspan="3">쿠폰 이름</th>
																			<th>시작일</th>
																			<th>만료일</th>
																			<th>할인가격</th>
															                <th>최소주문금액</th>
															              </tr>
															            </thead>
		                                                                <tbody>
		                                                                    <tr>
			                                                                     <td class="text-bold-500">
		                                                                         	<input type="text" name="eCouponNo" id="eventCouponNo" value="${vo.eCouponNo }" readonly>						                                                                     
			                                                                     </td>
																			  	 <td colspan="3">
		                                                                        	 <input type="text" name="eCouponName" id="eventCouponDc" value="${vo.eCouponName }">
		                                                                         </td>
			                                                                     <td>
		                                                                         	<input type="text" name="eCouponStartDate" id="eventCouponStartDate" value="${vo.eCouponStartDate }">						                                                                     
			                                                                     </td>
			                                                                     <td>
		                                                                         	<input type="text" name="eCouponEndDate" id="eventCouponEndDate" value="${vo.eCouponEndDate }">						                                                                     
			                                                                     </td>
		                                                                         <td>
		                                                                        	<input type="text" name="eCouponDc" id="eventCouponDc" value="${vo.eCouponDc }">
																			 	</td>             
		                                                                         <td>
		                                                                        	<input type="text" name="eCouponMin" id="eventCouponMin" value="${vo.eCouponMin }">
																			 	</td>             
		                                                                    </tr>					                                                                    
		                                                                </tbody>
	                                                               </table>                      
	                                                            </div>
	                                                         </div>
	                                                      </div>
	                                                   </div><!--modal body end-->
	                                                   <div class="modal-footer">
	                                                      <button type="button" class="btn btn-outline-dark" data-dismiss="modal">
	                                                         <i class="bx bx-x d-block d-sm-none"></i>
	                                                         <span class="d-none d-sm-block">닫기</span>
	                                                      </button>
	                                                      <button type="button" class="btn btn-dark ml-1" data-dismiss="modal" name="modalEdit" id="modalEdit" onclick="form.submit()">
	                                                         <i class="bx bx-check d-block d-sm-none"></i>
	                                                         <span class="d-none d-sm-block">수정</span>
	                                                      </button>
	                                                   </div>
	                                                </form>
	                                             </div>
	                                          </div>
	                                       </div> <!-- #eventCouponEdit 수정 모달 -->
						                 </td>
						               </tr>
					              
									</tbody>
									</c:forEach>
									</c:if>
								</table>
							</div><!--table-responsive-->
						</div><!--card-body-->
					</div><!--card-content-->
				</div><!--card-->
			</div>
		</div>
	</div>
</div>


<!-- script start -->
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/feather-icons/feather.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/app.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/simple-datatables/simple-datatables.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/vendors.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/main.js"></script>
<!-- script end -->

<%@include file="../../adminInc/bottom.jsp" %> 
    
    