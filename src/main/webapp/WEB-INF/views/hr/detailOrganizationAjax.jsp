<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head></head>
<body>
   <%
      request.setCharacterEncoding("utf-8");
      String empNo = request.getParameter("empNo");
   %>
   <div class="contentEmpty">
      <div id="rightMenu" class="col-sm-14 col-md-9">
         <div id="righttTop">
            <h4>
               <label>상세정보</label>
            </h4>
         </div>

         <div class="register-card-body">

            <form role="form" class="form-horizontal" id="frm">
               <input type="hidden" name="empNo" value="${empDetail.empNo}" />
            </form>

            <div class="input-group" style="float: left;">
               <div class="col-sm-2" style="text-align: center; width: 100%;">
                  <div class="mailbox-attachment-icon has-img" id="pictureView"
                     style="border: 1px solid green; height: 150px; width: 120px; margin: 0 auto;">
                     <%-- <a
                  href="/resources/empController/profileDownload?emp_id=${empDetail.empNo}">
                  <img id="pictureViewImg" style="width: 100%; height: 100%;"
                  src="/resources/empController/profile?emp_id=${empDetail.empNo}" />
               </a> --%>
                     <img id="pictureViewImg" style="width: 100%; height: 100%;" />
                  </div>
               </div>

               <div class="form-group row" style="margin-left: 40px;">
                  <label class="col-sm-4"
                     style="font-size: 0.9em; margin-top: 20px;"> 사원번호 </label>
                  <div class="col-sm-6 input-group input-group-sm"
                     style="margin-top: 20px;">
                     <span class="input-group-append-sm">${empDetail.empNo}</span>
                  </div>

                  <label class="col-sm-4" style="font-size: 0.9em;"> 이름 </label>
                  <div class="col-sm-6 input-group input-group-sm">
                     <span class="input-group-append-sm">${empDetail.empNm}</span>
                  </div>

                  <label class="col-sm-4" style="font-size: 0.9em;"> 부서이름 </label>
                  <div class="col-sm-6 input-group input-group-sm">
                     <span class="input-group-append-sm">${empDetail.deptCode}</span>
                  </div>

                  <label class="col-sm-4" style="font-size: 0.9em;"> 직급 </label>
                  <div class="col-sm-6 input-group input-group-sm">
                     <span class="input-group-append-sm">${empDetail.clsfCode}</span>
                  </div>
                  <br>
                  <br>
                  <br>
                  <br>
               </div>

            </div>

            <div class="form-group row">
               <label class="col-sm-2" style="font-size: 0.9em;">생년월일</label>

               <div class="col-sm-4 input-group input-group-sm"
                  style="float: left;">
                  <span class="input-group-append-sm" style="text-align: left;">
                     <fmt:formatDate value="${empDetail.brthdy}" pattern="yyyy.MM.dd" />
                  </span>
               </div>

               <label class="col-sm-2" style="font-size: 0.9em;"> 이메일 </label>
               <div class="col-sm-4 input-group input-group-sm">
                  <span class="input-group-append-sm"><c:choose>
                        <c:when test="${empDetail.email != null}">
                           <span class="input-group-append-sm">${empDetail.email}</span>
                        </c:when>
                        <c:otherwise>
                           <span class="input-group-append-sm"><br></span>
                        </c:otherwise>
                     </c:choose></span>
               </div>

               <label class="col-sm-2" style="font-size: 0.9em;"> 휴대폰번호 </label>
               <div class="col-sm-4 input-group input-group-sm"
                  style="float: left;">
                  <span class="input-group-append-sm">${empDetail.phonenum}</span>
               </div>

               <label class="col-sm-2" style="font-size: 0.9em;"> 내선번호 </label>
               <div class="col-sm-4 input-group input-group-sm">
                  <span class="input-group-append-sm">${empDetail.lxtnNo}</span>
               </div>

               <label class="col-sm-2" style="font-size: 0.9em;"> 우편번호 </label>
               <div class="col-sm-4 input-group input-group-sm"
                  style="float: left;">
                  <span class="input-group-append-sm">${empDetail.zip}</span>
               </div>

               <label class="col-sm-2" style="font-size: 0.9em;"> </label>
               <div class="col-sm-4 input-group input-group-sm">
                  <span class="input-group-append-sm"> </span>
               </div>

               <label class="col-sm-2" style="font-size: 0.9em;"> 주소 </label>
               <div class="col-sm-4 input-group input-group-sm">
                  <span class="input-group-append-sm">${empDetail.adres1}</span>

               </div>

               <label class="col-sm-2" style="font-size: 0.9em;"> 상세주소 </label>
               <div class="col-sm-4 input-group input-group-sm">
                  <span class="input-group-append-sm">${empDetail.adres2}</span>

               </div>


               <label class="col-sm-2" style="font-size: 0.9em;"> 입사일자 </label>
               <div class="col-sm-4 input-group input-group-sm"
                  style="float: left;">
                  <span class="input-group-append-sm"> <fmt:formatDate
                        value="${empDetail.encpnDe}" pattern="yyyy-MM-dd" /></span>
               </div>

               <label class="col-sm-2" style="font-size: 0.9em;"> 퇴사일자 </label>
               <div class="col-sm-4 input-group input-group-sm">
                  <span class="input-group-append-sm"> <c:choose>
                        <c:when test="${empDetail.retireDe == null}">
                           <span class="input-group-append-sm"></span>
                        </c:when>
                        <c:otherwise>
                           <span class="input-group-append-sm">${empDetail.retireDe}</span>
                           <%-- <fmt:formatDate value="${detailUser.retire_dt}" pattern="yyyy-MM-dd"/></span> --%>
                        </c:otherwise>
                     </c:choose> <br>
                  </span>
               </div>
            </div>
         </div>

      </div>
   </div>

   <script>
      $(window).on('load', function() {
         if (feather) {
            feather.replace({
               width : 14,
               height : 14
            });
         }
      })
   </script>
   
</body>
</html>