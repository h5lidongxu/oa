<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	request.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
<script src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
<script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<style type="text/css">
#earchInput {
	height: 30px;
}
</style>
</head>
<body>
	<!-- 员工修改模态框 -->
	<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">员工修改</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label for="empName" class="col-sm-2 control-label">员工姓名</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="empUpdateName"></p>
							</div>
						</div>
						<div class="form-group">
							<label for="empEmail" class="col-sm-2 control-label">员工邮箱</label>
							<div class="col-sm-10">
								<input type="email" name="empEmail" class="form-control" id="empEmail" placeholder="23123@qq.com">
							</div>
						</div>
						<div class="form-group">
							<label for="empEmail" class="col-sm-2 control-label">员工性别</label>
							<div class="col-sm-10">
								<label class="radio-inline">
									<input type="radio" name="empGender" id="gender1_update_input" value="M" checked="checked">男
								</label>
								<label class="radio-inline">
									<input type="radio" name="empGender" id="gender2_update_input" value="F">女
								</label>
							</div>
						</div>
						<div class="form-group">
							<label for="empEmail" class="col-sm-2 control-label">员工部门</label>
							<div class="col-sm-4">
								<select class="form-control" name="dId">
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" id="empUpdateBtn">更新</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 新增员工模态框 -->
	<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">员工新增</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label for="empName" class="col-sm-2 control-label">员工姓名</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="empName" placeholder="zhangsan">
							</div>
						</div>
						<div class="form-group">
							<label for="empEmail" class="col-sm-2 control-label">员工邮箱</label>
							<div class="col-sm-10">
								<input type="email" class="form-control" id="empEmail" placeholder="23123@qq.com">
							</div>
						</div>
						<div class="form-group">
							<label for="empEmail" class="col-sm-2 control-label">员工性别</label>
							<div class="col-sm-10">
								<label class="radio-inline">
									<input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">男
								</label>
								<label class="radio-inline">
									<input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">女
								</label>
							</div>
						</div>
						<div class="form-group">
							<label for="empEmail" class="col-sm-2 control-label">员工部门</label>
							<div class="col-sm-4">
								<select class="form-control">
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary">保存</button>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-8">
				<h1>SSM-CRUD</h1>
			</div>
		</div>
		<div class="row" style="margin-top: 10px; margin-bottom: 10px;">
			<form role="form" class="form-inline">
				<div class="form-group">
					<label for="name">名称</label>
					<input type="text" class="form-control" id="earchInput" placeholder="输入查询的用户">
					<a href="#" id="searchBtn" class="btn btn-primary btn-sm">
						<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						<span id="empSearch">开始搜索</span>
					</a>
				</div>
				<div class="form-group pull-right">
					<a href="#" class="btn btn-primary btn-sm" id="empAddBtn">
						<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
						<span>添加</span>
					</a>
					<a href="#" id="delAllBtn" class="btn btn-danger btn-sm">
						<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
						<span>删除</span>
					</a>
				</div>
			</form>
		</div>
		<div class="row">
			<table class="table">
				<thead>
					<tr>
						<th>员工编号</th>
						<th>员工姓名</th>
						<th>员工性别</th>
						<th>员工邮箱</th>
						<th>部门名称</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody id="mTbody"></tbody>
			</table>
		</div>
		<div class="row">
			<nav aria-label="Page navigation" class="pull-right">
				<ul class="pagination" id="mUl">
				</ul>
			</nav>
		</div>
	</div>
	<script type="text/javascript">
	var currentPage;// 当前页码
	/* 批量删除 */
	/* $("#delAllBtn").click(function(){
		
	}) */
	/* 点击删除按钮删除一条员工记录  */
	$(document).on("click",".delBtn",function(){
		var empName = $(this).parents("tr").find("td:eq(1)").text();
		var empId = $(this).attr("emp-id");
		if(confirm("确认删除"+empName+"员工信息吗？")){
			$.ajax({
				url:"${APP_PATH}/emp/"+empId,
				type:"DELETE",
				success:function(result){
					pageTo(currentPage);
				}
			})
		}
	})
	
	/* 点击更新更新员工信息  */
	$("#empUpdateBtn").click(function(){
		var update = $("#empUpdateModal form").serialize();
		// 验证邮箱信息省略
		$.ajax({
			url:"${APP_PATH}/emp/"+$(this).attr("emp-id"),
			type:"PUT",
			data:update,
			success:function(result){
				//alert(result.msg)
				// 关闭模态框
				$("#empUpdateModal").modal("hide");
				// 返回本页面
				pageTo(currentPage);
			}
		})
	})
	/* 查询员工信息 */
	function getEmp(id) {
		$.ajax({
			url:"${APP_PATH}/emp/"+id,
			type:"GET",
			success:function(result){
				//console.log(result)
				var empInfo = result.extend.emp;
				$("#empUpdateName").text(empInfo.empName);
				$("#empEmail").val(empInfo.empEmail);
				$("#empUpdateModal input[name=gender]").val([empInfo.empGender]);
				$("#empUpdateModal select").val([empInfo.dId]);
			}
		})
	}
		/* 查询部门信息并显示在下拉列表中 */
		function getDepts(ele){
			$.ajax({
				url:"${APP_PATH}/depts",
				success:function(result){
					$(ele).empty();
					var deptInfo = result.extend.depts;
					$.each(deptInfo,function(index,item){
						var op = $("<option></option>").append(this.deptName).attr("value",this.deptId);
						$(ele).append(op)
					})
				}
			})
		}
		/* 点击弹出员工修改模态框 */
		$(document).on("click",".editBtn",function(){
			// 查出员工信息
			getEmp($(this).attr("emp-id"))
			// 查出部门信息
			getDepts("#empUpdateModal select");
			// 将员工id传递给员工修改按钮
			$("#empUpdateBtn").attr("emp-id",$(this).attr("emp-id"))
			// 弹出修改模态框
			$("#empUpdateModal").modal({});
		})
		/* 弹出新增员工*/
		$("#empAddBtn").click(function() {
			getDepts("#empAddModal select");
			$('#empAddModal').modal({})
		})
		// 构建分页信息
		function build_page_info(result) {
			$("#mUl").empty();
			var pages = result.extend.pageInfo.navigatepageNums;
			var preLi = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href", "#"))
			preLi.click(function() {
				pageTo(result.extend.pageInfo.pageNum - 1)
			})
			var nextLi = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href", "#"))
			nextLi.click(function() {
				pageTo(result.extend.pageInfo.pageNum + 1)
			})
			$("#mUl").append(preLi);
			$.each(pages, function(index, item) {
				var numLi = $("<li></li>").append($("<a></a>").append(item).attr("href", "#"))
				if (item == result.extend.pageInfo.pageNum) {
					numLi.addClass("active");
					currentPage = result.extend.pageInfo.pageNum;
				}
				numLi.click(function() {
					pageTo(item)
				})
				$("#mUl").append(numLi);
			})
			$("#mUl").append(nextLi);
		}
		//构建表格数据
		function build_table_data(result) {
			$("#mTbody").empty();
			var empInfos = result.extend.pageInfo.list;
			console.log(result)
			$.each(empInfos, function(index, emp) {
				var empTr = $("<tr></tr>");
				var empIdTd = $("<td></td>").append(emp.empId);
				var empNameTd = $("<td></td>").append(emp.empName);
				var empGenderTd = $("<td></td>").append(emp.empGender);
				var empEmailTd = $("<td></td>").append(emp.empEmail);
				var empDIdTd = $("<td></td>").append(emp.dId);
				// 创建操作按钮
				var editBtn = $("<button></button>").text("编辑").addClass("btn btn-success btn-sm editBtn")
				// 为编辑按钮添加自定义属性
				editBtn.attr("emp-id",emp.empId)
				var delBtn = $("<button></button>").text("删除").addClass("btn btn-danger btn-sm delBtn")
				delBtn.attr("emp-id",emp.empId)
				var btnTd = $("<td></td>")
				btnTd.append(editBtn).append("&nbsp;").append(delBtn);
				empTr.append(empIdTd).append(empNameTd).append(empGenderTd).append(empEmailTd).append(empDIdTd).append(btnTd)
				$("#mTbody").append(empTr)
			})
		}
		$(function() {
			pageTo(1)
		});

		function pageTo(pn) {
			$.ajax({
				url : "${APP_PATH}/emps?pn=" + pn,
				success : function(result) {
					build_table_data(result);
					build_page_info(result);
				}
			})
		}
		/* 搜索动态ajax */
		$("#earchInput").keyup(function(){
			$.ajax({
				url:"${APP_PATH}/empSearch?empName="+$("#earchInput").val(),
				success:function(result){
					console.log(result)
				}
			})
		})
	</script>
</body>
</html>