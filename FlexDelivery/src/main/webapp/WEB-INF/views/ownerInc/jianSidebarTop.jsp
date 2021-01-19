<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FLEX한 사장님을 위한 내 점포 사이트</title>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/bootstrap.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ownerResources/assets/css/app.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/ownerResources/assets/images/favicon.svg" type="image/x-icon">
	
</head>
<
<body>
    <div id="app" style="width:100%;">
        <div id="sidebar" class='active' style="width:250px; ">
            <div class="sidebar-wrapper active" style="position: absolute; " >
			    <div class="sidebar-menu">
			        <ul class="menu">
			            	<li class='sidebar-title'>
			            		 <span>Flex Delivery</span>
			            	</li>
			            	
			            	<div class="dropdown-divider"></div>
			            	<!-- hr 기능 근데 hr 해도 오류뜨고 이걸로해도 오류뜨네요 왜죠? -->
			            	 
			                <li class='sidebar-title'>Main Menu</li>
			            
			            	<!-- 내점포 메인 view -->
			                <li class="sidebar-item">
			                    <a href="#" class='sidebar-link'>
			                        <img data-feather="home" width="20"></img> 
			                        <span>Home</span>
			                    </a>
			                </li>
			
			            
			            	<!-- 가게관리view -->
			                <li class="sidebar-item active has-sub">
			                    <a href="#" class='sidebar-link'>
			                        <img data-feather="triangle" width="20"></img> 
			                        <span>가게</span>
			                    </a>
			                    <ul class="submenu active">
			                        <li>
			                            <a href="#">기본정보</a>
			                        </li>
			                        <li>
			                            <a href="#">운영정보</a>
			                        </li>
			                        <li>
			                            <a href="#">영업중지</a>
			                        </li>
			                    </ul>
			                </li>
							
			            
			            	<!-- 메뉴관리view -->
			                <li class="sidebar-item  has-sub">
			                    <a href="#" class='sidebar-link'>
			                        <img data-feather="briefcase" width="20"></img> 
			                        <span>메뉴</span>
			                    </a>
			                    <ul class="submenu ">
			                        <li>
			                            <a href="#">메뉴관리(품절)</a>
			                            <!-- 전체 메뉴 리스트로 보여주고 품절관리하는 창 
			                            	고민인게 메뉴편집이랑 합칠까 고민입니다. 이름은 
			                            	나중에 같이 바꿔봐요 (품절)은 헷갈리시까봐 붙인거에요 -->
			                        </li>
			                        <li>
			                            <a href="#">메뉴편집</a>
			                            <!-- 메뉴그룹/메뉴 + 수정,삭제 -->
			                        </li>
			                         <li>
			                            <a href="#">옵션편집</a>
			                            <!-- 옵션그룹/메뉴 + 수정,삭제 -->
			                        </li>
			                         <li>
			                            <a href="#">대표메뉴</a>
			                        </li>
			                    </ul>
			                </li>          
			                
			            
			            	<!-- 리뷰관리view -->
			                <li class="sidebar-item  has-sub">
			                    <a href="#" class='sidebar-link'>
			                        <img data-feather="file-text" width="20"></img> 
			                        <span>리뷰</span>
			                    </a>
			                    <ul class="submenu ">
			                        <li>
			                            <a href="#">리뷰관리</a>
			                            <!-- 답변/미답변/차단(보류) 는 탭으로 -->
			                        </li>
			                    </ul>
			                </li>
			            
			            
			            
			            	<!-- 혜택 -->
			                <li class="sidebar-item has-sub">
			                    <a href="#" class='sidebar-link'>
			                        <img data-feather="briefcase" width="20"></img> 
			                        <span>혜택</span>
			                    </a>
			                    <ul class="submenu ">
			                        <!-- 광고view -->
			                        <li>
			                            <a href="#">광고관리</a>
			                        </li>
			                        
			                        <!-- 쿠폰view -->
			                         <li>
			                            <a href="#">쿠폰관리</a>
			                        </li>
			                    </ul>
			                </li>
			                <!-- 광고랑 쿠폰밑에도 혹시 메뉴가 필요하면 저(지안)에게 말씀해주세요 -->
			            
			            
			            
			                 	<!-- 주문정산view -->
			                <li class="sidebar-item  has-sub">
			                    <a href="#" class='sidebar-link'>
			                        <img data-feather="file-text" width="20"></img> 
			                        <span>주문정산</span>
			                    </a>
			                    <ul class="submenu ">
			                        <li>
			                            <a href="#">정산내역</a>
			                        </li>
			                         <li>
			                            <a href="#">주문내역</a>
			                            <!-- 주문상세view는 오픈창으로 띄워야 합니다. -->
			                        </li>
			                    </ul>
			                </li>
			                
			                
			                <div class="dropdown-divider"></div>
			                
			                <!-- 요청처리현황 view -->
			                <li class="sidebar-item  ">
			                    <a href="#" class='sidebar-link'>
			                        <img data-feather="layout" width="20"></img> 
			                        <span>요청처리현황</span>
			                    </a>
			                </li>
			                <!-- 아래로 내리는 메뉴가 없습니다. 위의 href 에 바로 링크적어주세요
			                	혹시 적었는데 a태그가 안먹히면 저에게 말씀해주세요 (지안) -->
				        </ul>
				    </div>
				  
	    
   					 <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
				</div>
        	</div>
        	
	        <div id="main" style="overflow: auto; height:500px;">
	           <nav class="navbar navbar-header navbar-expand navbar-light">
	                <a class="sidebar-toggler" href="#"><span class="navbar-toggler-icon"></span></a>
	                <button class="btn navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
	                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	                    <span class="navbar-toggler-icon"></span>
	                </button>
	                <div class="collapse navbar-collapse" id="navbarSupportedContent">
	                    <ul class="navbar-nav d-flex align-items-center navbar-light ml-auto">
	                        <li class="dropdown nav-icon">
	                            <a href="#" data-toggle="dropdown" class="nav-link  dropdown-toggle nav-link-lg nav-link-user">
	                                <div class="d-lg-inline-block">
	                                    <i data-feather="bell"></i>
	                                </div>
	                            </a>
	                            <div class="dropdown-menu dropdown-menu-right dropdown-menu-large">
	                                <h6 class='py-2 px-4'>알림</h6>
	                                <ul class="list-group rounded-none">
	                                    <li class="list-group-item border-0 align-items-start">
	                                        <div class="avatar bg-success mr-3">
	                                            <span class="avatar-content"><i data-feather="shopping-cart"></i></span>
	                                        </div>
	                                        <div>
	                                            <h6 class='text-bold'>주문현황</h6>
	                                            <p class='text-xs'>
	                                                	주문이 도착했습니다.<br>
	                                                	확인 후 접수 및 취소 버튼을 눌러주세요!
	                                            </p>
	                                        </div>
	                                    </li>
	                                </ul>
	                            </div>
	                        </li>
	                        <li class="dropdown nav-icon mr-2">
	                            <a href="#" data-toggle="dropdown" class="nav-link  dropdown-toggle nav-link-lg nav-link-user">
	                                <div class="d-lg-inline-block">
	                                    <i data-feather="mail"></i>
	                                </div>
	                            </a>
	                            <div class="dropdown-menu dropdown-menu-right">
	                                <a class="dropdown-item" href="#"><i data-feather="user"></i> 관리자</a>
	                                <a class="dropdown-item active" href="#"><i data-feather="mail"></i> 문의사항</a>
	                             
	                            </div>
	                        </li>
	                        <li class="dropdown">
	                            <a href="#" data-toggle="dropdown" class="nav-link dropdown-toggle nav-link-lg nav-link-user">
	                                <div class="avatar mr-1">
	                                    <img src="${pageContext.request.contextPath}/resources/ownerResources/assets/images/favicon.svg" alt="owner">
	                                </div>
	                                <div class="d-none d-md-block d-lg-inline-block">Flex Delivery Admin</div>
	                            </a>
	                            <div class="dropdown-menu dropdown-menu-right">
	                                <a class="dropdown-item" href="#"><i data-feather="user"></i> Account</a>
	                                <a class="dropdown-item active" href="#"><i data-feather="mail"></i> Messages</a>
	                                <a class="dropdown-item" href="#"><i data-feather="settings"></i> Settings</a>
	                                <div class="dropdown-divider"></div>
	                                <a class="dropdown-item" href="#"><i data-feather="log-out"></i> Logout</a>
	                            </div>
	                        </li>
	                    </ul>
	                </div>
	            </nav> 
