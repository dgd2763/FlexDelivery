<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../adminInc/top.jsp" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script>
	$(function(){
		$.ajax({
			type:"GET",
			url :"<c:url value='/admin/menu5/faq/category/list.do' />",
			dataType:'json',
			success: function(res){
				if (res.length > 0) {
					$('#returnCList').empty();
					$.each(res, function(idx, item) {
						var info = "<li>"+"<a onclick='listForCategory("+item.fCategoryNo+")' style='cursor: pointer;' onmouseover='onMouseOver()'>"
							+ item.fCategoryName + "</a>"+"</li>";
						$('#returnCList').append( info );
					});
				}
			},
			error: function(xhr, status, error){
				alert(error);
			}
		});
		
		/* $('form[name=frmFAQWrite]').submit(function(){
			if($('#selectFCategory').val()==0){
				alert("자주 하는 질문 카테고리를 선택해주세요!");
				$('#selectFCategory').focus();
				event.preventDefault;
			}
			
		}); */
		
		
		$('#frmTr').hide();
		$('#frmTr2').hide();
		
	});
	
	/* function readySubmit(){
		var num=$('#frmFAQCategoryWrite').find('input[type=radio]').val();
		if (num==0){
			alert("종류를 선택해주세요!");
			event.preventDefault();
			//return false;
		} 
	} */
	
	function chkModalOpt(){
		var inModalOpt=$('#inModalOpt').val();
		
		if (inModalOpt==0){
			$('#frmTr').hide();			
			$('#frmTr2').hide();			
		} else {
			$('#frmTr').show();	
			$('#frmTr2').show();	
			
			//var result=result.find('option:selected').text();
			var result=$('#inModalOpt').find('option:selected').text();
			var textVal=result;
			//alert(textVal);
			//$('#inModalOpt').text();
			$('#afterCategoryName').val(textVal);
			
			var authorityVal=$('#inModalOpt').find('option:selected').attr('title');
			//alert(authorityVal);
			
			//#frmTd2 > input[type=radio]:nth-child(1) => 회원
			//#frmTd2 > input[type=radio]:nth-child(2) => 사장님

			if (authorityVal==1){
				$('#frmTd2').find('input[type=radio]:nth-child(1)').prop('checked', true);
				$('#frmTd2').find('input[type=radio]:nth-child(2)').prop('checked', false);
				
			} else if (authorityVal==4){
				$('#frmTd2').find('input[type=radio]:nth-child(1)').prop('checked', false);
				$('#frmTd2').find('input[type=radio]:nth-child(2)').prop('checked', true);	
				
			}
			
		}
	}

	
	function beforeSubmit(){
		var delNo=$('#inModalOpt').find('option:selected').val();
		//alert(delNo);
		location.href = "<c:url value='/admin/menu5/faq/category/delete.do?no="+ delNo +"' />";
	}
	
	function onMouseOver(){
		$(this).css("color: white");
	}
	
	function listForCategory(no){
		var categoryNo=no;
		var str="";
		
		//var data=${fn:length(forList) };
		
		
		/*
	        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapse${vo.faqNo }" 
	        	aria-expanded="false" aria-controls="collapse${vo.faqNo }">
	          Q. ${vo.faqQ }
	        </button>
	        
	        <button type="button" style="border: none; outline: none; background: none; font-size: 12px;" class="comment-reply" 
              id="btFaqEdit${vo.faqNo }" data-toggle="modal" data-backdrop="false" data-target="#modalFaqEdit${vo.faqNo }">수정</button> 
            <span style="font-size: 12px;"> | </span> 
            
            <button type="button" style="border: none; outline: none; background: none; font-size: 12px;" class="comment-reply" 
              id="btFaqDelete${vo.faqNo }" data-toggle="modal" data-backdrop="false" data-target="#modalFaqDelete${vo.faqNo }" >삭제</button>
	      
              </h2>
	    </div>
	    
	    
	    <div id="collapse${vo.faqNo }" class="collapse" aria-labelledby="heading${vo.faqNo }" data-parent="#accordionList">
	      <div class="card-body">
	      	${vo.faqA }
		      </div>
	    */
	   
		$.ajax({
			type:"GET",
			url :"<c:url value='/admin/menu5/faq/list.do?categoryNo="+categoryNo+"' />",
			dataType:'json',
			//data: data,
			success: function(res){
				if (res.length == 0){
					
					str+="<div class='mb-70' style='text-align: center;'>";
					str+="<p>등록된 자주 묻는 질문이 없습니다.</p>";
					str+="</div>";
				} else {
					str+="<c:forEach var='vo' items='${list }' varStatus='status'>";
					str+="<div class='card'>";
					str+="<div class='card-header' id='heading${vo.faqNo }'>";
					str+="<h2 class='mb-0'>";
					
					str+="<div class='accordion mb-70' id='accordionList${vo.faqNo}'>";
					str+="<ul class='accordion'>";
				    str+="<li class='item'>";
				    str+="<h2 class='accordionTitle'>${vo.faqQ} <span class='accIcon'></span></h2>";
				    str+="<button type='button' style='border: none; outline: none; background: none; font-size: 12px;' class='comment-reply'";
				    str+="id='btFaqEdit${vo.faqNo }' data-toggle='modal' data-backdrop='false' data-target='#modalFaqEdit${vo.faqNo }'>수정</button>";
				    str+="<span style='font-size: 12px;'> | </span>"; 
				            
				    str+="<button type='button' style='border: none; outline: none; background: none; font-size: 12px;' class='comment-reply'"; 
				    str+="id='btFaqDelete${vo.faqNo }' data-toggle='modal' data-backdrop='false' data-target='#modalFaqDelete${vo.faqNo }' >삭제</button>";
				    str+="</h2>"
				    
				    /*var newFaqA=${vo.faqA}.replace(/\r/gi, '\\r').replace(/\n/gi, '\\n');*/
				    /*var newFaqA=str_replace("\r\n", "<br>", ${vo.faqA});
				    str+=" <div class='text'>"+newFaqA+"</div>";*/
				    str+="</li>";
				    str+="</ul>";
				    str+="</div>"; //accordionList
				    
				    str+="</h2>";
				    str+="</div>"; //card-header
				    
				    str+="</div>";
				    str+="</c:forEach>";
				}
				
				alert(categoryNo+":"+res.length);
				$('#forPrint').html(str);
				
			},
			error: function(xhr, status, error){
				console.log(error);
			}
		});
	}

</script>

<!-- css start -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/simple-datatables/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/app.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/ownerResources/assets/images/favicon.svg" type="image/x-icon">

<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/adminResources/crystal.css">
 --%><!-- css end -->

<div class="container">
	<div class="row">    
		<div class="col-12">
           <div class="card">
           
           		<div class="card-header" style="padding-bottom: 2px;">
	                <h3 class="section-title text-uppercase">자주 묻는 질문</h3>
	                <p class="text-subtitle text-muted">플렉스 딜리버리에 궁금한 점이 있으신가요?</p>
	                <hr>
                </div>
                
                <div class="card-content">
                	<div class="card-body">
	                	<!-- 모달 호출하는 버튼 -->
						<button type="button" class="btn btn-dark" id="modalCategoryWriteBt"
						   data-toggle="modal" data-backdrop="false" data-target="#faqCategoryWrite" >
						     카테고리 등록
						</button>
						<button type="button" class="btn btn-dark" id="modalCategoryEditDeleteBt"
						   data-toggle="modal" data-backdrop="false" data-target="#faqCategoryEditDelete" >
						     카테고리 수정 / 삭제
						</button>
						<button type="button" class="btn btn-dark" id="modalFaqWriteBt"
						   data-toggle="modal" data-backdrop="false" data-target="#faqWrite2" >
						     자주 하는 질문 등록
						</button>		
                	</div>
                	
					<!-- #faqCategoryWrite 모달 start -->
					<div class="modal fade text-left" id="faqCategoryWrite" tabindex="-1" 
                        role="dialog" aria-labelledby="FAQ 카테고리 등록" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
                           <div class="modal-content">
								<form name="frmFAQCategoryWrite" id="frmFAQCategoryWrite" method="post" action="<c:url value='/admin/menu5/faq/category/write.do' />">
                                	<div class="modal-header">
	                                    <h4 class="modal-title" id="faqWrite">자주 하는 질문 - 카테고리 등록</h4>
	                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                                       <i data-feather="x"></i>
	                                    </button>
	                                </div>
                                	<div class="modal-body">                                 
	                                    <div class="row">
	                                       <div class="col-12">   
	                                          <div class="table-responsive" style="text-align: center;">
	                                             <table class="table mb-0">
	                                                <tbody>
                                                   	  <tr>
                                                   	  	<td>카테고리 이름</td>
	                                                      <td colspan="2"  style="text-align: center;">
	                                                      	<input type="text" name="fCategoryName">
	                                                      	<input type="hidden" name="fCategoryNo" value="1">
	                                                      </td>			                                                   	  	
													  </tr>
                                                   	  <tr>
                                                   	  	 <td>종류</td>
	                                                      <td colspan="2"  style="text-align: center;">
	                                                      	<input type="radio" name="authorityNo" value="0" checked>선택해주세요
	                                                      	<input type="radio" name="authorityNo" value="1">회원
	                                                      	<input type="radio" name="authorityNo" value="4">사장님
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
	                                    <button type="button" class="btn btn-dark ml-1" data-dismiss="modal" name="modalWrite"
 	                                     id="modalWrite" onclick="form.submit()">
	                                     <!-- id="modalWrite" onclick="readySubmit()"> -->
	                                       <i class="bx bx-check d-block d-sm-none"></i>
	                                       <span class="d-none d-sm-block">등록</span>
	                                    </button>
	                                 </div>
                              	</form><!-- frmFaqCategoryWrite등록 폼 모달 -->
                            </div>
                         </div>
                     </div>    
					<!-- #faqCategoryWrite 모달 end -->
					
					<!-- #faqCategoryEditDelete 모달 start -->
					<div class="modal fade text-left" id="faqCategoryEditDelete" tabindex="-1" 
                        role="dialog" aria-labelledby="FAQ 카테고리 수정 및 삭제" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
                           <div class="modal-content">
							<form name="frmFAQCategorEditDelete" method="post" action="<c:url value='/admin/menu5/faq/category/edit.do' />">
                               	<div class="modal-header">
                                    <h4 class="modal-title" id="faqEditAndDel">자주 하는 질문 - 카테고리 수정 / 삭제</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                       <i data-feather="x"></i>
                                    </button>
                                </div>
                               	<div class="modal-body">                                 
                                    <div class="row">
                                       <div class="col-12">   
                                          <div class="table-responsive" style="text-align: center;">
                                             <table class="table mb-0">
                                                <tbody>
                                                  	  <tr>
                                                  	  	<td>카테고리</td>
                                                      	<td colspan="2"  style="text-align: center;">
	                                                      	<select id="inModalOpt" name="fCategoryNo" onchange="chkModalOpt()">
	                                                      		<option value="0">선택하세요</option>
		                                                      		<c:forEach var="cVo2" items="${ctList }">
		                                                      			<option value="${cVo2.fCategoryNo }" title="${cVo2.authorityNo }">${cVo2.fCategoryName }</option>
		                                                      		</c:forEach>
	                                                      	</select>
                                                       </td>			                                                   	  	
												     </tr>
												     <tr id="frmTr">
												     	<td>변경 후 카테고리 이름</td>
												     	<td colspan="2"><input type="text" id="afterCategoryName" name="fCategoryName"></td>
											     	</tr>
												     <tr id="frmTr2">
												     	<td>종류</td>
		                                              	<td colspan="2" id="frmTd2">
	                                                      	<input type="radio" name="authorityNo" value="1">회원
	                                                      	<input type="radio" name="authorityNo" value="4">사장님
	                                                      		
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
                                    <button type="button" class="btn btn-dark ml-1" data-dismiss="modal" name="modalEditDelete1"
                                     id="modalEditBt1" onclick="form.submit()">
                                       <i class="bx bx-check d-block d-sm-none"></i>
                                       <span class="d-none d-sm-block">수정</span>
                                    </button>
                                    <button type="button" class="btn btn-dark ml-1" data-dismiss="modal" name="modalEditDelete2"
                                     id="modalDeleteBt1" onclick="beforeSubmit()">
                                       <i class="bx bx-check d-block d-sm-none"></i>
                                       <span class="d-none d-sm-block">삭제</span>
                                    </button>
                                 </div>
						     	</form>
                              </div>
                          </div>
                     </div>    
					<!-- #faqCategoryWrite 모달 end -->

                            					
					<!-- #faqWrite2 모달 start -->
					<div class="modal fade text-left" id="faqWrite2" tabindex="-1" 
                        role="dialog" aria-labelledby="FAQ 등록" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg" role="document">
                           <div class="modal-content">
								<form name="frmFAQWrite" method="post" action="<c:url value='/admin/menu5/faq/write.do' />">
                                	<div class="modal-header">
	                                    <h4 class="modal-title">자주 하는 질문 - 질문과 답변 등록</h4>
	                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                                       <i data-feather="x"></i>
	                                    </button>
	                                </div>
                                	<div class="modal-body">                                 
	                                    <div class="row">
	                                       <div class="col-12">   
	                                          <div class="table-responsive" style="text-align: center;">
	                                             <table class="table mb-0">
	                                                <tbody>
                                                   	  <tr>
                                                   	  	<td>카테고리 종류</td>
	                                                      <td colspan="2"  style="text-align: center;">
	                                                      	<input type="hidden" name="authorityNo" value="6">
	                                                      	<select name="fCategoryNo" id="selectFCategory">
                                                      			<option value="0">선택하세요</option>
	                                                      		<c:forEach var="cVo2" items="${ctList }">
	                                                      			<option value="${cVo2.fCategoryNo }">${cVo2.fCategoryName }</option>
	                                                      		</c:forEach>
	                                                      	</select>
	                                                      </td>			                                                   	  	
													  </tr>
                                                   	  <tr>
                                                   	  	<td>질문</td>
	                                                      <td colspan="2"  style="text-align: center;">
	                                                      	<textarea rows="3" cols="70" name="faqQ"></textarea>
	                                                      </td>			                                                   	  	
													  </tr>
													  <tr>
													  	<td>답변</td>
													  	<td colspan="2">
													  		<textarea rows="10" cols="70" name="faqA"></textarea>
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
	                                    <button type="button" class="btn btn-dark ml-1" data-dismiss="modal" name="modalWrite2"
	                                     id="modalWrite2" onclick="form.submit()">
	                                       <i class="bx bx-check d-block d-sm-none"></i>
	                                       <span class="d-none d-sm-block">등록</span>
	                                    </button>
	                                 </div>
                              	</form><!-- frmFAQWrite등록 폼 모달 -->
                            </div>
                         </div>
                     </div>
					<!-- #faqWrite2 모달 end -->
					
			        <div class="sidebar-widget-area">
			            <div class="widget-content">
			            	<ul class="tags"><li><a href='#'>전체보기</a></li></ul>
			                <ul class="tags" id="returnCList">
			                </ul>
			                <span class="badge bg-transparent">4</span>
			            </div>
			        </div>
			        
			        <div class="card-body" id="forPrint">
						<!-- 카테고리 클릭 시 list 개수 따라 다른 출력 -->
						  
						  <%-- <div class="card">
						  	<c:forEach var="vo" items="${list }" varStatus="status">
						    <div class="card-header" id="heading${vo.faqNo }">
						      <h2 class="mb-0">
						        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapse${vo.faqNo }" 
						        	aria-expanded="false" aria-controls="collapse${vo.faqNo }">
						          Q. ${vo.faqQ }
						        </button>
						        
						        <button type="button" style="border: none; outline: none; background: none; font-size: 12px;" class="comment-reply" 
					              id="btFaqEdit${vo.faqNo }" data-toggle="modal" data-backdrop="false" data-target="#modalFaqEdit${vo.faqNo }">수정</button> 
					            <span style="font-size: 12px;"> | </span> 
					            <button type="button" style="border: none; outline: none; background: none; font-size: 12px;" class="comment-reply" 
					              id="btFaqDelete${vo.faqNo }" data-toggle="modal" data-backdrop="false" data-target="#modalFaqDelete${vo.faqNo }" >삭제</button>
						      </h2>
						    </div>
						    <div id="collapse${vo.faqNo }" class="collapse" aria-labelledby="heading${vo.faqNo }" data-parent="#accordionList">
						      <div class="card-body">
						      	<div>
						      		
						      	</div>
						      	${vo.faqA }
				 		      </div>
						    </div>
						    </c:forEach>
						  	</div> --%>
						  	
						    <%-- <div class="card-header" id="headingTwo">
						      <h2 class="mb-0">
						        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
						          Q. 주문 상태가 조리중일 때 고객이 주문취소 요청을 할 수 있나요?
						        </button>
						      </h2>
						    </div>
						    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionList">
						      <div class="card-body">
						      	플렉스 딜리버리 측에서는 '배달중' 상태가 되기 전까지 주문취소가 가능합니다. '주문접수' 상태일 때는 고객과 점포 측에, '조리중' 일 때에는 점포 측에 주문취소 권한이 있습니다.
						      	
				 		      </div>
						    </div> --%>
						    
					</div>
						    <c:forEach var="vo" items="${list }" varStatus="status">
                           <!-- FAQ 수정 start -->
							<div class="modal fade text-left" id="modalFaqEdit${vo.faqNo }" tabindex="-1" 
		                        role="dialog" aria-labelledby="FAQ 수정" aria-hidden="true">
		                        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg" role="document">
		                           <div class="modal-content">
										<form name="frmFaqEdit" method="post" action="<c:url value='/admin/menu5/faq/edit.do' />">
		                                	<div class="modal-header">
			                                    <h4 class="modal-title">자주 하는 질문 - 질문과 답변 수정</h4>
			                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			                                       <i data-feather="x"></i>
			                                    </button>
			                                </div>
		                                	<div class="modal-body">                                 
			                                    <div class="row">
			                                       <div class="col-12">   
			                                          <div class="table-responsive" style="text-align: center;">
			                                             <table class="table mb-0">
			                                                <tbody>
		                                                   	  <tr>
		                                                   	  	<input type="hidden" name="faqNo" value=${vo.faqNo }>
		                                                   	  	<td>카테고리 종류</td>
			                                                      <td colspan="2"  style="text-align: center;">
			                                                      	<select name="fCategoryNo" id="selectFCategory">
		                                                      			<option value="0">선택하세요</option>
			                                                      		<c:forEach var="cVo2" items="${ctList }">
			                                                      			<option value="${cVo2.fCategoryNo }">${cVo2.fCategoryName }</option>
			                                                      		</c:forEach>
			                                                      	</select>
			                                                      </td>			                                                   	  	
															  </tr>
		                                                   	  <tr>
		                                                   	  	<td>질문</td>
			                                                      <td colspan="2"  style="text-align: center;">
			                                                      	<textarea rows="3" cols="70" name="faqQ">${vo.faqQ }</textarea>
			                                                      </td>			                                                   	  	
															  </tr>
															  <tr>
															  	<td>답변</td>
															  	<td colspan="2">
															  		<textarea rows="10" cols="70" name="faqA">${vo.faqA }</textarea>
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
			                                    <button type="button" class="btn btn-dark ml-1" data-dismiss="modal" name="modalEdit"
			                                     id="btModalEdit" onclick="form.submit()">
			                                       <i class="bx bx-check d-block d-sm-none"></i>
			                                       <span class="d-none d-sm-block">등록</span>
			                                    </button>
			                                 </div>
		                              	</form><!-- frmFAQEdit 폼 모달 -->
		                            </div>
		                         </div>
		                     </div>
							<!-- #faqEdit모달 end -->
						    
							 <!-- FAQ 삭제 모달 -->
	                          <div class="modal fade text-left" id="modalFaqDelete${vo.faqNo }" tabindex="-1" role="dialog" 
	                              aria-labelledby="FAQ 삭제" aria-hidden="true">
	                              <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
	                                 <div class="modal-content">
	                                    <form name="frmFaqDel" id="frmFaqDel" method="post" action="<c:url value='/admin/menu5/faq/deleteFaq.do?no=${vo.faqNo }' />">
	                                       <div class="modal-header bg-danger">
	                                          <h5 class="modal-title white" id="myModalFaqEdit">자주 묻는 질문 삭제</h5>
	                                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                                              <i data-feather="x"></i>
	                                          </button>
	                                       </div>
	                                       <div class="modal-body">
	                                            <input type="hidden" name="faqNo" value="${vo.faqNo }" >
	                                           
	                                          	[<span style="font-weight: bolder;">${vo.faqQ}</span>] 에 대한 답변을 삭제하시겠습니까?
	                                       </div>
	                                       <div class="modal-footer">
	                                          <button type="button" class="btn btn-light-secondary" data-dismiss="modal" id="modalFaqDelCancel">
	                                             <i class="bx bx-x d-block d-sm-none"></i>
	                                             <span class="d-none d-sm-block">취소</span>
	                                          </button>
	                                          
	                                          <button type="button" class="btn btn-danger ml-1" data-dismiss="modal" id="modalFaqDelOk" onclick="form.submit()">
	                                             <i class="bx bx-check d-block d-sm-none"></i>
	                                             <span class="d-none d-sm-block">삭제</span>
	                                          </button>
	                                       </div>
	                                    </form>
	                                 </div>
	                              </div>
	                           </div> <!-- 삭제 모달 end-->
							</c:forEach>
				</div><!-- card-content -->
				
			</div><!-- card -->
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