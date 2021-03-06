<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<!-- default header name is X-CSRF-TOKEN -->
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${detailset.name}</title>
	<link rel="stylesheet" type="text/css" media="screen" href="/jquery-ui-1.12.1.custom/jquery-ui.min.css"/>
    <link rel="stylesheet" type="text/css" media="screen" href="/jqGrid/css/ui.jqgrid.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="/css/main.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="/css/detailpage.css"/>
    
    <script src="/js/html2canvas.js"></script>
				<script src="/js/jspdf.min.js"></script>
	<script src="/js/jquery-3.6.0.min.js" type="text/javascript"></script>
	<script src="/js/main.js" type="text/javascript"></script>
    <script src="/js/detailpage.js" type="text/javascript"></script>
    <script src="/js/setting.js" type="text/javascript"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
    <script src="/jqGrid/js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="/jqGrid/js/i18n/grid.locale-kr.js" type="text/javascript"></script>
    <script src="/jqGrid/js/jquery.jqGrid.min.js" type="text/javascript"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
</head>
<body>
<jsp:include page="../layout/navbar.jsp"></jsp:include>

<div>
    <ul class="nav nav-tabs m-3" id="pills-tab" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active" id="pills-info-tab" data-bs-toggle="pill" data-bs-target="#pills-info" type="button" role="tab" aria-controls="pills-info" aria-selected="true">????????????</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="pills-work-tab" data-bs-toggle="pill" data-bs-target="#pills-work" type="button" role="tab" aria-controls="pills-work" aria-selected="false">????????????</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="pills-career-tab" data-bs-toggle="pill" data-bs-target="#pills-career" type="button" role="tab" aria-controls="pills-career" aria-selected="false">????????????</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="pills-education-tab" data-bs-toggle="pill" data-bs-target="#pills-education" type="button" role="tab" aria-controls="pills-education" aria-selected="false">????????????</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="pills-edumatter-tab" data-bs-toggle="pill" data-bs-target="#pills-edumatter" type="button" role="tab" aria-controls="pills-edumatter" aria-selected="false">????????????</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="pills-qualifications-tab" data-bs-toggle="pill" data-bs-target="#pills-qualifications" type="button" role="tab" aria-controls="pills-qualifications" aria-selected="false">?????????</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="pills-prize-tab" data-bs-toggle="pill" data-bs-target="#pills-prize" type="button" role="tab" aria-controls="pills-prize" aria-selected="false">??????</button>
        </li>
    </ul>
    
    <div class="tab-content" id="pills-tabContent">
        <div class="tab-pane fade show active table-responsive" id="pills-info" role="tabpanel" aria-labelledby="pills-info-tab">
            <form id="UpdateForm" name="UpdateForm" method="POST" enctype="multipart/form-data">
                <input type="hidden" id="info_id"   name="info_id"  value="${detailset.id}">
                <table class="detailTable table" border="0">
                    <colgroup>
                        <col width="12%"/>
                        <col width="29%"/>
                        <col width="12%"/>
                        <col width="27%"/>
                        <col width="20%"/>
                    </colgroup>
                    <tbody>
                        <tr>
                            <td>??????</td>
                            <td><input type="text" class="form-control"  id="name"       name="name"     value="${detailset.name}" placeholder="??????"></td>
                            <td>????????????</td>
                            <td><input type="text" class="form-control"  id="birth"      name="birth"    value="${detailset.birth}" onfocus="(this.type='date')" onblur="(this.type='text')" placeholder="????????????"></td>
                            <td rowspan="2" each="img : ${img}">
                                <%-- <input type="hidden" name="photo" value="${img.imgname}">
                                <img class="detail-info-img" src="@{img/${img.imgname}}"/> --%>
                                <input type="hidden" id="photo" name="photo" value="${detailset.imgname}">
                                <img src="${pageContext.request.contextPath}/resources/images/${detailset.imgname}"width="94.4" height="113.3" />
                            </td>
                            
                        </tr>
                        <tr>
                            <td>?????????</td>
                            <td><input type="text" class="form-control"  id="phone"      name="phone"    value="${detailset.phone}" placeholder="?????????"></td>
                            <td>?????????</td>
                            <td><input type="text" class="form-control"  id="email"      name="email"    value="${detailset.email}" placeholder="?????????"></td>
                        </tr>   
                        <tr>
                            <td>??????</td>
                            <td><input type="text" class="form-control" name="address" id="user_address" onclick="AddressSearch()" value="${detailset.address}" placeholder="??????"></td>
                            <td>????????????</td>
                            <td><input type="text" class="form-control" name="detailaddress" id="user_detail_address" value="${detailset.detailaddress}" placeholder="????????????"></td>
                        </tr>
                        <tr>
                            <td>??????</td>
                            <td>
                                <select name="occupation" id="user_occupation" class="form-select" onchange='DetailoccupationSelected(this)'>
                                    <option value="0">????????? ??????????????????.</option>
                                    <c:forEach var="occupation" items="${occupation}">
                                    <c:choose>
                                    	<c:when test="${detailset.occupation eq occupation.occupation_nm}">
                                    		<option value="${occupation.occupation_nm}" selected><c:out value="${occupation.name}"/></option>
                                    	</c:when>
                                    	<c:otherwise>
                                    		<option value="${occupation.occupation_nm}"><c:out value="${occupation.name}"/></option>
                                    	</c:otherwise>                            
                                    </c:choose>
                                    </c:forEach>                                  
                                </select>
                            </td>
                            <td>?????? <%-- <c:out value="${detailset.task }"/> --%></td>
                            <td>
								<c:if test="${detailset.task==null||detailset.task==0}">
                                	<select name="task" id="user_task" class="form-select" disabled>
                                </c:if>
                                <c:if test="${detailset.task>0}">
                                	<select name="task" id="user_task" class="form-select">
                                </c:if>
                                    <option class="detailoccupation0" value="0">????????? ??????????????????</option>
                                    <c:forEach var="task" items="${task}">
                                    	<c:choose>
                                    		<c:when test="${detailset.task eq task.task_nm}">
                                        		<option class="detailoccupation${task.occupation} usertask" value="${task.task_nm}" selected><c:out value="${task.name}"/></option>                            
                                			</c:when>
                                			<c:otherwise>
                                				<option class="detailoccupation${task.occupation} usertask" value="${task.task_nm}"><c:out value="${task.name}"/></option>
                                			</c:otherwise>
                                		</c:choose>
                                	</c:forEach>
                                </select>

                            </td>
                            
                        	
                        </tr>
                        <tr>
                            <td>??????????????????</td>
                            <td colspan="3" class="areaCheckBox" style="display:block;">
                                	<c:forEach var="area" items="${area}" varStatus="status">
                                		<c:choose>
                                    		<c:when test="${detailArea[status.index] eq area.name}">
                                        		<input class="form-check-input" type="checkbox" id="areaCheckbox<c:out value="${area.id}"/>" name="area" value="${area.name}"  checked>
                                    			<label class="form-check-label" for="areaCheckbox<c:out value="${area.id}"/>"><c:out value="${area.name}"/></label>                         
                                			</c:when>
                                			<c:otherwise>
                                				<input class="form-check-input" type="checkbox" id="areaCheckbox<c:out value="${area.id}"/>" name="area" value="${area.name}" >
                                    			<label class="form-check-label" for="areaCheckbox<c:out value="${area.id}"/>"><c:out value="${area.name}"/></label>
                                    	    </c:otherwise>
                                		</c:choose>                             
                                	</c:forEach>                                  
                            </td>
                            
                        </tr>
                        <tr>
                            <td>??????</td>
                            <td><input type="file" class="form-control" id="attachImg" name="attachImg"></td>
                            <td>????????????</td>
                            <td><input type="file" class="form-control" id="attachFile" name="attachFile"></td>
                        </tr>
                        <c:forEach var="file" items="${file}">
                        <tr>
                            <td class="td-file" colspan="3">
                                <a href="/fileDown/${file.id}"><c:out value="${file.fileoriginname}"/></a>
                                <button type="button" class="btn btn-danger m-2" id="file-delete-btn${file.id}" onclick="fileDelete('${file.id}')">??????</button>
                            </td>
                        </tr>
                        
                        </c:forEach>
                        
                    </tbody>
                </table>
            </form>
        </div>
        <div class="tab-pane fade" id="pills-work" role="tabpanel" aria-labelledby="pills-work-tab">
	        <div class="grid-container" style="margin-top: 25px; padding: 15px;">
	            <table id="workList"></table>
	            <div id="workListPager"></div>
            </div>
        </div>
        <div class="tab-pane fade" id="pills-career" role="tabpanel" aria-labelledby="pills-career-tab">
	        <div class="grid-container" style="margin-top: 25px; padding: 15px;">
	            <table id="careerList"></table>
            	<div id="careerListPager"></div>
            </div>
        </div>
        <div class="tab-pane fade" id="pills-education" role="tabpanel" aria-labelledby="pills-education-tab">
	        <div class="grid-container" style="margin-top: 25px; padding: 15px;">
	            <table id="educationList"></table>
	            <div id="educationListPager"></div>
            </div>
        </div>
        <div class="tab-pane fade" id="pills-edumatter" role="tabpanel" aria-labelledby="pills-edumatter-tab">
	        <div class="grid-container" style="margin-top: 25px; padding: 15px;">
	            <table id="edumatterList"></table>
	            <div id="edumatterListPager"></div>
            </div>
        </div>
        <div class="tab-pane fade" id="pills-qualifications" role="tabpanel" aria-labelledby="pills-qualifications-tab">
	        <div class="grid-container" style="margin-top: 25px; padding: 15px;">
	            <table id="qualificationsList"></table>
	            <div id="qualificationsListPager"></div>
            </div>
        </div>
        <div class="tab-pane fade" id="pills-prize" role="tabpanel" aria-labelledby="pills-prize-tab">
	        <div class="grid-container" style="margin-top: 25px; padding: 15px;">
	            <table id="prizeList"></table>
	            <div id="prizeListPager"></div>
            </div>
        </div>
    </div>  
    
</div>

<div class="d-flex justify-content-between" style = "margin-top : 30px; margin-left : 15px; margin-right: 15px; font-size : 12px;">
	<button type="button" class="btn btn-secondary" id="" onclick="location.href='javascript:history.back()'"><i class="fas fa-backward"></i> ????????????</button> 
	<button type="button" class="btn btn-primary mx-4" id="update-btn" onclick="userUpdate()">??????</button>      
	<button type="button" class="btn btn-primary mx-4" id="detail-add-btn">??????</button>      
</div>


    <!-- ?????? ?????? -->
    <div class="modal fade" id="addDetials" tabindex="-1" aria-labelledby="addModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">

                <div class="modal-header">
                    <h5 class="modal-title" id="addModalLabel">??????</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                    <div class="modal-body">
                        <!-- ???????????? -->
                        <form name="workForm" method="post">
                            <input type="hidden"  name="info_id" value="${detailset.id}">
                            <table border="0" class="addTable work">
                                <colgroup>
                                    <col width="15%"/>
                                    <col width="75%"/>
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <td>?????????</td>
                                        <td><input type="text" id="work_Company_Name" name="company_name" class="form-control work" placeholder="?????????"></td>
                                    </tr>
                                    <tr>
                                        <td>?????????</td>
                                        <td><input type="text" id="work_Department" name="department" class="form-control work" placeholder="??????"></td>
                                    </tr>
                                    <tr>
                                        <td>?????????</td>
                                        <td><input type="text" id="work_Start_date" name="start_date" onfocus="(this.type='date')" onblur="(this.type='text')" class="form-control work" placeholder="?????????"></td>
                                    </tr>
                                    <tr>
                                        <td>?????????</td>
                                        <td><input type="text" id="work_End_date" name="end_date" onfocus="(this.type='date')" onblur="(this.type='text')" class="form-control work" placeholder="?????????"></td>
                                    </tr>
                                    <tr>
                                        <td>??????</td>
                                        <td><select name="spot_nm" id="work_Spot" class ="form-select work">
                                                <option value="">?????? ??????</option>
                                                <c:forEach var="spot" items="${spot}">
                                                	<option value="${spot.spot_nm}"><c:out value="${spot.name}"/></option>
                                            	</c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>??????</td>
                                        <td>
                                            <select name="occupation" id="work_occupation" class ="form-select work" onchange='WorkoccupationSelected(this)'>
                                                <option value="">?????? ??????</option>
                                                <c:forEach var="occupation" items="${occupation}">
                                                	<option value="${occupation.occupation_nm}"><c:out value="${occupation.name}"/></option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>??????</td>
                                        <td>
                                            <select name="task" id="work_Task" class ="form-select work" disabled>
                                                <option class="workoccupation0" value="">?????? ??????</option>
                                                <c:forEach var="task" items="${task}">
                                                	<option class="workoccupation${task.occupation} workaddtask" value="${task.task_nm}"><c:out value="${task.name}"/></option>
                                            	</c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                        <!-- ???????????? -->
                        <form name="careerForm" method="post">
                            <input type="hidden"  name="info_id" value="${detailset.id}">
                            <table border="0" class="addTable career">
                                <colgroup>
                                    <col width="20%"/>
                                    <col width="80%"/>
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <td>?????????</td>
                                        <td>
                                            <input type="text" id="career_Project_name" name="project_name" class="form-control career" placeholder="?????????">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>?????? ??????</td>
                                        <td><input type="text" id="primary_duty" name="primary_duty" class="form-control career" placeholder="?????? ??????"></td>
                                    </tr>
                                    <tr>
                                        <td>?????????</td>
                                        <td>
                                            <input type="text" id="career_Start_date" name="start_date" onfocus="(this.type='date')" onblur="(this.type='text')" class="form-control career" placeholder="?????????">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>?????????</td>
                                        <td>
                                            <input type="text" id="career_End_date" name="end_date" onfocus="(this.type='date')" onblur="(this.type='text')" class="form-control career" placeholder="?????????">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>?????????</td>
                                        <td>
                                            <select name="client_nm" id="career_Client_name" class ="form-select career">
                                                <option value="">????????? ??????</option>
                                                <c:forEach var="client" items="${client}">
                                                	<option value="${client.client_nm}"><c:out value="${client.name}"/></option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>??????</td>
                                        <td>
                                            <select name="occupation" id="career_occupation" class ="form-select career" onchange='CareeroccupationSelected(this)'>
                                                <option value="">?????? ??????</option>
                                                <c:forEach var="occupation" items="${occupation}">
                                                	<option value="${occupation.occupation_nm}"><c:out value="${occupation.name}"/></option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>??????</td>
                                        <td>
                                            <select name="task" id="career_Task" class ="form-select career" disabled>
                                                <option class="careeroccupation0" value="">?????? ??????</option>
                                                <c:forEach var="task" items="${task}">
                                                	<option class="careeroccupation${task.occupation} careeraddtask" value="${task.task_nm}"><c:out value="${task.name}"/></option>
                                            	</c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                        <!-- ???????????? -->
                        <form name="educationForm" method="post">
                            <input type="hidden"  name="info_id" value="${detailset.id}">
                            <table border="0" class="addTable education">
                                <colgroup>
                                    <col width="20%"/>
                                    <col width="80%"/>
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <td>?????????</td>
                                        <td>
                                            <input type="text" id="education_name" name="name" class="form-control education" placeholder="?????????">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>??????(??????)</td>
                                        <td>
                                            <input type="text" id="education_department" name="department" class="form-control education" placeholder="??????(??????)">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>??????</td>
                                        <td>
                                            <input type="text" id="education_degree" name="degree" class="form-control education" placeholder="??????">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>????????????</td>
                                        <td>
                                            <input type="text" id="education_start_date" name="start_date" onfocus="(this.type='date')" onblur="(this.type='text')" class="form-control education" placeholder="????????????">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>????????????</td>
                                        <td>
                                            <input type="text" id="education_end_date" name="end_date" onfocus="(this.type='date')" onblur="(this.type='text')" class="form-control education" placeholder="????????????">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                        <!-- ???????????? -->
                        <form name="edumatterForm" method="post">
                            <input type="hidden"  name="info_id" value="${detailset.id}">
                            <table border="0" class="addTable edumatter">
                                <colgroup>
                                    <col width="20%"/>
                                    <col width="80%"/>
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <td>?????????</td>
                                        <td>
                                            <input type="text" id="edumatter_course_name" name="course_name" class="form-control edumatter" placeholder="?????????">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>??????</td>
                                        <td>
                                            <select name="institute_nm" id="edumatter_institaion" class ="form-select edumatter">
                                                <option value="">?????? ??????</option>
                                                <c:forEach var="institute" items="${institute}">
                                                	<option value="${institute.institute_nm}"><c:out value="${institute.name}"/></option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>????????????</td>
                                        <td>
                                            <input type="text" id="edumatter_completion_number" name="completion_number" class="form-control edumatter" placeholder="????????????">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>?????????</td>
                                        <td>
                                            <input type="text" id="edumatter_start_date" name="start_date"  onfocus="(this.type='date')" onblur="(this.type='text')" class="form-control edumatter" placeholder="?????????">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>?????????</td>
                                        <td>
                                            <input type="text" id="edumatter_end_date" name="end_date"  onfocus="(this.type='date')" onblur="(this.type='text')" class="form-control edumatter" placeholder="?????????">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                        <!-- ????????? -->
                        <form name="qualificationsForm" method="post">
                            <input type="hidden"  name="info_id" value="${detailset.id}">
                            <table border="0" class="addTable qualifications">
                                <colgroup>
                                    <col width="20%"/>
                                    <col width="80%"/>
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <td>????????????</td>
                                        <td>
                                            <select name="qualifi_nm" id="qualifi_nm" class ="form-select qualifications">
                                                <option value="">????????? ??????</option>
                                                <c:forEach var="qualifi" items="${qualifi}">
                                                	<option value="${qualifi.qualifi_nm}"><c:out value="${qualifi.qualifi_name}"/></option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>????????????</td>
                                        <td>
                                            <input type="text" id="qualifi_reg_num" name="reg_num" class="form-control qualifications" placeholder="????????????">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>?????????</td>
                                        <td>
                                            <input type="text"  id="qualfi_reg_date" name="reg_date" onfocus="(this.type='date')" onblur="(this.type='text')" class="form-control qualifications" placeholder="?????????">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                        <!-- ?????? -->
                        <form name="prizeForm" method="post">
                            <input type="hidden"  name="info_id" value="${detailset.id}">
                            <table border="0" class="addTable prize">
                                <colgroup>
                                    <col width="20%"/>
                                    <col width="80%"/>
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <td>?????????</td>
                                        <td>
                                            <input type="text" id="prize_name" name="name" class="form-control prize" placeholder="?????????">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>????????????</td>
                                        <td>
                                            <input type="text" id="prize_agency" name="agency" class="form-control prize" placeholder="????????????">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>??????</td>
                                        <td>
                                            <input type="text" id="prize_evidence" name="evidence" class="form-control prize" placeholder="??????">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>??? ??? ???</td>
                                        <td>
                                            <input type="text" id="prize_reg_date" name="reg_date" onfocus="(this.type='date')" onblur="(this.type='text')"class="form-control prize" placeholder="??? ??? ???">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                    </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="detail-save-btn">??????</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">??????</button>
                </div>
            </div>
        </div>
    </div>
    
    <!-- ?????? ?????? -->
    <div class="modal fade" id="updateDetials" tabindex="-1" aria-labelledby="updateModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">

                <div class="modal-header">
                    <h5 class="modal-title" id="updateModalLabel">??????</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                
                    <div class="modal-body">
                        <input type="hidden" id="info_id" name="info_id" value="${detailset.id}">
                        <!-- ???????????? -->
                        <form name="workupdateForm" method="post">
                            <input type="hidden"  name="info_id" value="${detailset.id}">
                            <input type="hidden"    id="update_work_id"             name="id">
                            <table border="0" class="addTable work">
                                <colgroup>
                                    <col width="15%"/>
                                    <col width="75%"/>
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <td>?????????</td>
                                        <td>
                                            <input type="text"      id="update_work_Company_Name"   name="company_name" class="form-control work" placeholder="????????????">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>?????????</td>
                                        <td>
                                            <input type="text"      id="update_work_Department"     name="department"   class="form-control work" placeholder="??????">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>?????????</td>
                                        <td>
                                            <input type="text"      id="update_work_Start_date"     name="start_date"   class="form-control work" placeholder="?????????" onfocus="(this.type='date')" onblur="(this.type='text')" >
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>?????????</td>
                                        <td>
                                            <input type="text"      id="update_work_End_date"       name="end_date"     class="form-control work" placeholder="?????????" onfocus="(this.type='date')" onblur="(this.type='text')" >
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>??????</td>
                                        <td>
                                        <select name="spot_nm" id="update_work_Spot" class ="form-select work">
                                                <option value="">?????? ??????</option>
                                                <c:forEach var="spot" items="${spot}">
                                                	<option value="${spot.spot_nm}"><c:out value="${spot.name}"/></option>
                                            	</c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>??????</td>
                                        <td>
                                        	
                                            <select name="occupation" id="update_work_Occupation" class ="form-select work">
                                                <option value="">?????? ??????</option>
                                                <c:forEach var="occupation" items="${occupation}">
                                                	<option value="${occupation.occupation_nm}"><c:out value="${occupation.name}"/></option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>??????</td>
                                        <td>
                                            <select name="task" id="update_work_Task" class ="form-select work">
                                                <option value="">?????? ??????</option>
                                                <c:forEach var="task" items="${task}">
                                                	<option class="careeroccupation${task.occupation} careeraddtask" value="${task.task_nm}"><c:out value="${task.name}"/></option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                        <!-- ???????????? -->
                        <form name="careerupdateForm" method="post">
                            <input type="hidden"  name="info_id" value="${detailset.id}">
                            <input type="hidden"    id="update_career_id"           name="id" >
                            <table border="0" class="addTable career">
                                <colgroup>
                                    <col width="20%"/>
                                    <col width="80%"/>
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <td>?????????</td>
                                        <td>
                                            <input type="text"      id="update_career_Project_name" name="project_name" class="form-control career" placeholder="?????????">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>?????????</td>
                                        <td>
                                            <input type="text"      id="update_career_Start_date"   name="start_date"   class="form-control career" placeholder="?????????" onfocus="(this.type='date')" onblur="(this.type='text')">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>?????????</td>
                                        <td>
                                            <input type="text"      id="update_career_End_date"     name="end_date"     class="form-control career" placeholder="?????????" onfocus="(this.type='date')" onblur="(this.type='text')">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>?????????</td>
                                        <td>
                                            <select name="client_nm" id="update_career_Client_name" class ="form-select career">
                                                <option value="">????????? ??????</option>
                                                <c:forEach var="client" items="${client}">
                                                	<option value="${client.client_nm}"><c:out value="${client.name}"/></option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>??????</td>
                                        <td>
                                            <select name="occupation" id="update_career_Occupation" class ="form-select career">
                                                <option value="">?????? ??????</option>
                                                <c:forEach var="occupation" items="${occupation}">
                                                	<option value="${occupation.occupation_nm}"><c:out value="${occupation.name}"/></option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>??????</td>
                                        <td>
                                            <select name="task" id="update_career_Task" class ="form-select career">
                                                <option value="">?????? ??????</option>
                                                <c:forEach var="task" items="${task}">
                                                	<option class="careeroccupation${task.occupation} careeraddtask" value="${task.task_nm}"><c:out value="${task.name}"/></option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                        <!-- ???????????? -->
                        <form name="educationupdateForm" method="post">
                            <input type="hidden"  name="info_id" value="${detailset.id}">
                            <input type="hidden" id="update_edu_id"               name="id">
                            <table border="0" class="addTable education">
                                <colgroup>
                                    <col width="20%"/>
                                    <col width="80%"/>
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <td>?????????</td>
                                        <td>
                                            <input type="text"   id="update_education_name"       name="name"       class="form-control education" placeholder="?????????">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>??????(??????)</td>
                                        <td>
                                            <input type="text"   id="update_education_department" name="department" class="form-control education" placeholder="??????(??????)">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>??????</td>
                                        <td>
                                            <input type="text"   id="update_education_degree"     name="degree"     class="form-control education" placeholder="??????">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>????????????</td>
                                        <td>
                                            <input type="text"   id="update_education_start_date" name="start_date" class="form-control education" placeholder="????????????"   onfocus="(this.type='date')" onblur="(this.type='text')">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>????????????</td>
                                        <td>
                                            <input type="text"   id="update_education_end_date"   name="end_date"   class="form-control education" placeholder="????????????"   onfocus="(this.type='date')" onblur="(this.type='text')" >
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                        <!-- ???????????? -->
                        <form name="edumatterupdateForm" method="post">
                            <input type="hidden"            name="info_id" value="${detailset.id}">
                            <input type="hidden"            id="update_matter_id"                   name="id">
                            <table border="0" class="addTable edumatter">
                                <colgroup>
                                    <col width="20%"/>
                                    <col width="80%"/>
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <td>?????????</td>
                                        <td>
                                            <input type="text"              id="update_edumatter_course_name"       name="course_name"          class="form-control edumatter" placeholder="?????????">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>??????</td>
                                        <td>
                                            <select name="institute_nm"     id="update_edumatter_institaion_nm"     class ="form-select edumatter">
                                                <option value="">?????? ??????</option>
                                                <c:forEach var="institute" items="${institute}">
                                                	<option value="${institute.institute_nm}"><c:out value="${institute.name}"/></option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>????????????</td>
                                        <td>
                                            <input type="text" id="update_edumatter_completion_number" name="completion_number"    class="form-control edumatter" placeholder="????????????">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>?????????</td>
                                        <td>
                                            <input type="text" id="update_edumatter_start_date" name="start_date"   onfocus="(this.type='date')" onblur="(this.type='text')" class="form-control edumatter" placeholder="?????????">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>?????????</td>
                                        <td>
                                            <input type="text" id="update_edumatter_end_date"   name="end_date"     onfocus="(this.type='date')" onblur="(this.type='text')" class="form-control edumatter" placeholder="?????????">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                        <!-- ????????? -->
                        <form name="qualificationsupdateForm" method="post">
                            <input type="hidden"  name="info_id" value="${detailset.id}">
                            <input type="hidden"    id="update_qualifi_ID"      name="id">
                            <table border="0" class="addTable qualifications">
                                <colgroup>
                                    <col width="20%"/>
                                    <col width="80%"/>
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <td>????????????</td>
                                        <td>
                                            <select name="qualifi_nm" id="update_qualifi_nm" class ="form-select qualifications">
                                                <option value="">????????? ??????</option>
                                                <c:forEach var="qualifi" items="${qualifi}">
                                                	<option value="${qualifi.qualifi_nm}"><c:out value="${qualifi.qualifi_name}"/></option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>????????????</td>
                                        <td>
                                            <input type="text"      id="update_qualifi_reg_num" name="reg_num"  class="form-control qualifications" placeholder="????????????">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>?????????</td>
                                        <td>
                                            <input type="text"      id="update_qualfi_reg_date" name="reg_date" class="form-control qualifications" placeholder="?????????"    onfocus="(this.type='date')" onblur="(this.type='text')" >
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                        <!-- ?????? -->
                        <form name="prizeupdateForm" method="post">
                            <input type="hidden"  name="info_id" value="${detailset.id}">
                            <input type="hidden"    id="update_prize_id"        name="id">
                            <table border="0" class="addTable prize">
                                <colgroup>
                                    <col width="20%"/>
                                    <col width="80%"/>
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <td>?????????</td>
                                        <td>
                                            <input type="text"      id="update_prize_name"      name="name"         class="form-control prize"  placeholder="?????????">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>????????????</td>
                                        <td>
                                            <input type="text"      id="update_prize_agency"    name="agency"       class="form-control prize"  placeholder="????????????">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>??????</td>
                                        <td>
                                            <input type="text"      id="update_prize_evidence"  name="evidence"     class="form-control prize"  placeholder="??????">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>??? ??? ???</td>
                                        <td>
                                            <input type="text"      id="update_prize_reg_date"  name="reg_date"     class="form-control prize"  placeholder="??? ??? ???"  onfocus="(this.type='date')" onblur="(this.type='text')">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                    </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="detail-update-btn" onclick="careerUpdate()">??????</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">??????</button>
                </div>
            </div>
        </div>
    </div>
    <div style="display:none;">
    	<div id="pdfDiv">
	    <jsp:include page="resume_pdf.jsp"></jsp:include>
	    </div>
    </div>
</body>
</html>
