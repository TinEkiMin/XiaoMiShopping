<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<script type="text/javascript">
	// $(function(){});
	// 页面加载完毕事件
	$(document).ready(function(){
		$.ajax({
			url:"GoodTypeServlet?method=goodTypeList",
			type:"GET",
			success:function(data){
				/*
				[
					{"id": 1,"name":"计算机"},
					{"id": 1,"name":"计算机"},
					{"id": 1,"name":"计算机"},
					{"id": 1,"name":"计算机"}
				]
				 */
				// 遍历json数组
				for(var i in data){
					var a = $("<a href='GoodServlet?method=getGoodsListByTypeId&typeId="+data[i].id+"'>"+data[i].name+"</a>");
					$("#goodsType").append(a);
				}
			},
			dataType:"json",
			error:function(){
				alert("失败");
			}
		})
	})
</script>
		
 <div id="top">
    	<div id="topdiv">
            <span>
                <a href="index.jsp" id="a_top" target="_blank">小米商城</a>
                <li>|</li>
                <a href="" id="a_top">小米商城移动版</a>
                <li>|</li>
                <a href="" id="a_top">问题反馈</a>
            </span>
            <span style="float:right">
           		<c:if test="${empty user}">
	                <a href="login.jsp" id="a_top">登录</a>
	                <li>|</li>
	                <a href="register.jsp" id="a_top">注册</a>
           		</c:if>
       			<c:if test="${not empty user}">
       				<a href="userAddress?flag=show" id="a_top">${user.username}</a>
       				<li>|</li>
       				<a href="userservlet?method=logOut" id="a_top" onclick="return confirm('确定要退出吗?')">注销</a>
       				<li>|</li>
       				<a href="orderservlet?method=getOrderList" id="a_top">我的订单</a>
       				<li>|</li>
       				<a href="userservlet?method=getAddress" id="a_top">地址管理</a>
       			</c:if>
                <li>|</li>
                <a href="" id="a_top">消息通知</a>
                <a href="${pageContext.request.contextPath}/cartservlet?method=getCart" id="shorpcar">购物车</a>
            </span>
        </div>
 </div>
<div id="second">
	    <a href="" id="seimg" style=" margin-top:23px;"><img id="logo" src="image/logo_top.png" width="55" height="54"/></a>
        <a href="" id="seimg" style=" margin-top:17px;"><img id="gif" src="image/yyymix.gif" width="180" height="66" /></a>
        <p id="goodsType">
			<!-- 根据ajax 回调函数 填写数据 到此id中 -->
        </p>
       <form class="form-inline pull-right" style="margin-top: 40px;margin-right: 10px;">
		
		  <div class="form-group">
		    <input type="text" class="form-control" style="width: 400px"  placeholder="搜索一下好东西...">
		  </div>
		  <button type="submit" class="btn btn-warning"><span class="glyphicon glyphicon-search"></span>&nbsp;&nbsp;搜索</button>
	  </form>
</div>
