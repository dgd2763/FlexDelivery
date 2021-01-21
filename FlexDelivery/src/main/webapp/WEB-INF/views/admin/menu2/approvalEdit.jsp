<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../adminInc/top.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/app.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/ownerResources/assets/images/favicon.svg" type="image/x-icon">

<!-- main start -->
<div class="main-content container" >
    <div class="page-title">
        <div class="row">
            <div class="col-12 col-md-6 order-md-1 order-last">
                <h3>점포 변경 세부 조회</h3>
                <p class="text-subtitle text-muted">점포 변경 요청과 관련된 세부 내역입니다.</p>
            </div>
            <div class="col-12 col-md-6 order-md-2 order-first">
                <nav aria-label="breadcrumb" class='breadcrumb-header'>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="<c:url value='/admin/main.do'/> ">Main</a></li>
                        <li class="breadcrumb-item"><a href="<c:url value='/admin/menu2/approval.do'/> ">점포 등록/변경 승인 관리</a></li>
                        <li class="breadcrumb-item active" aria-current="page">점포 변경 세부 조회</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>

    <!-- // Basic multiple Column Form section start -->
    <section id="multiple-column-form">
        <div class="row match-height">
            <div class="col-6">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title" >변경 요청 내역</h4>
                        <h4 class="card-title" >[접수번호 : 123456, 접수일자 : 2015년 05월 25일]</h4>
                    </div>
                    <div class="card-content">
                        <div class="card-body">
                            <form class="form">
                                <div class="row">
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="first-name-column" >사업자 번호</label>
                                            <input type="text" id="lisence-no-column" class="form-control" value="License No"
                                                name="fname-column" disabled="disabled">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="owner-name-column">대표자 성함</label>
                                            <input type="text" id="owner-name-column" class="form-control" value="Owner Name"
                                                name="Oname-column" disabled="disabled">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="shop-name">점포명</label>
                                            <input type="text" id="shop-name" class="form-control" value="Shop Name" name="shop-name"
                                            	disabled="disabled" >
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="shop-address">점포 주소</label>
                                            <input type="text" id="shop-address" class="form-control" name="shop-address"
                                                value="Shop Address" disabled="disabled">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="phone-number">연락처</label>
                                            <input type="text" id="phone-number" class="form-control" name="phone-number"
                                                value="Phone Number" disabled="disabled">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="email-id-column">Email</label>
                                            <input type="email" id="email-id-column" class="form-control" name="email-id-column"
                                                value="Email" disabled="disabled">
                                        </div>
                                    </div>
                                    <br><br>
                                    <!-- 요청사항 -->
                                    <div class="row">
           								<div class="col">
                							<div class="card">
                								<div class="card-header">
                        							승인 요청 사항 :
                   								</div>
                    							<div class="card-body">
                        							<div class="form-group with-title mb-3">
                            							<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" disabled="disabled" 
                            							 >긴급 승인 부탁드립니다.</textarea>
                            							<label>요청 내용</label>
                        							</div>
                    							</div>
                							</div>
            							</div>
        							</div>
                                    <!-- 요청사항 끝 -->
                                    <div class="col-12 d-flex justify-content-end">
                                        <button type="submit" class="btn btn-primary mr-1 mb-1">승인</button>
                                        <button type="reset" class="btn btn-danger mr-1 mb-1">반려</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-6">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title" >기존 등록 내역</h4>
                        <h4 class="card-title" >[접수번호 : 3456, 접수일자 : 2014년 04월 25일]</h4>
                    </div>
                    <div class="card-content">
                        <div class="card-body">
                            <form class="form">
                                <div class="row">
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="first-name-column" >사업자 번호</label>
                                            <input type="text" id="lisence-no-column" class="form-control" value="License No"
                                                name="fname-column" disabled="disabled">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="owner-name-column">대표자 성함</label>
                                            <input type="text" id="owner-name-column" class="form-control" value="Owner Name"
                                                name="Oname-column" disabled="disabled">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="shop-name">점포명</label>
                                            <input type="text" id="shop-name" class="form-control" value="Shop Name" name="shop-name"
                                            	disabled="disabled" >
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="shop-address">점포 주소</label>
                                            <input type="text" id="shop-address" class="form-control" name="shop-address"
                                                value="Shop Address" disabled="disabled">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="phone-number">연락처</label>
                                            <input type="text" id="phone-number" class="form-control" name="phone-number"
                                                value="Phone Number" disabled="disabled">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12">
                                        <div class="form-group">
                                            <label for="email-id-column">Email</label>
                                            <input type="email" id="email-id-column" class="form-control" name="email-id-column"
                                                value="Email" disabled="disabled">
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- // Basic multiple Column Form section end -->
</div>

<!-- main end -->

<!-- script start -->
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/feather-icons/feather.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/app.js"></script>   
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/simple-datatables/simple-datatables.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/vendors.js"></script>
<script src="${pageContext.request.contextPath}/resources/ownerResources/assets/js/main.js"></script>
<!-- script end -->
<%@ include file="../../adminInc/bottom.jsp" %>