<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form method="post"  id="schdulAddForm">
    <div >
        <label for="title" >Title</label>
        <input type="text" id="schdulSj" name="schdulSj" placeholder="Title" required/>
    </div>
    <div >
        <label for="select-label" >Label</label>
        <select id="schdulSeCode" name="schdulSeCode">
            <option data-label="danger" value="S1" selected >Private</option>
            <option data-label="warning" value="S2">Department</option>
            <option data-label="success" value="S3" >SoftLab</option>
        </select>
    </div>
    <div >
        <label for="start-date" >Start Date</label>
        <input type="text"  name="bgnDe" id="bgnDe" placeholder="Start Date" />
    </div>
    <div >
        <label for="end-date">End Date</label>
        <input type="text" name="endDe" id="endDe" placeholder="End Date" />
    </div>
    <div >
        <label for="event-description-editor" >Memo</label>
        <textarea name="schdulCn" id="schdulCn" placeholder="600자까지 입력 가능합니다."></textarea>
    </div>
    <div >
        <button type="submit"  id="addBtn">Add</button>
        <button type="button" class="btn btn-outline-secondary btn-cancel" data-dismiss="modal">Cancel</button>
        <button type="submit" class="btn btn-primary update-event-btn d-none mr-1">Update</button>
        <button class="btn btn-outline-danger btn-delete-event d-none">Delete</button>
    </div>
</form>

<script src="/resources/vendors/js/jquery/jquery.min.js"></script>
<script>
// Add new event
	var schdulSj = document.getElementById("schdulSj");
	var schdulSeCode = document.getElementById("schdulSeCode");
	var bgnDe = document.getElementById("bgnDe");
	var endDe = document.getElementById("endDe");
	var schdulCn = document.getElementById("schdulCn");

$("#schdulAddForm").on('submit', function (event) {
	event.preventDefault();
	
	const schdulSjValue= schdulSj.value;
	const schdulSeCodeValue =schdulSeCode.value;
	const bgnDeValue = bgnDe.value;
	const endDeValue = endDe.value;
	const schdulCnValue =schdulCn.value;
	
	const newSchdul ={
		schdulSj : schdulSjValue,
		schdulSeCode: schdulSeCodeValue,
		bgnDe : bgnDeValue,
		endDe : endDeValue,
		schdulCn: schdulCnValue
	}
	console.log(newSchdul);
	
	$.ajax({
		url:"/schdul/calendarTestAjax",
		type:"POST",
		data: JSON.stringify(newSchdul),
		contentType : "application/json; charset=utf-8",
		dataType:"json",
		success : function(data) {
		        console.log("kkk",data);
		}, // success 
	    error : function(xhr, status) {
		       alert(xhr + " : " + status);
		}
	});
});


</script>
</body>
</html>