<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Rakesh Technologies Pvt Ltd.- Home Page</title>
<link href="images/technology.png" rel="icon">
</head>
</head>
<body>
<h1 align="center">Welcome to Rakesh Software Solutions. Hyderabad,Telangana</h1>
<h1 align="center"> Rakesh Software Solutions- Very Good Training center for DevOps with AWS in Telangana India and also for Job Assitance Job Support also...Teaching Real Time scnerios</h1>
<hr>
<br>
	<h1><h3> Server Side IP Address </h3><br>

<% 
String ip = "";
InetAddress inetAddress = InetAddress.getLocalHost();
ip = inetAddress.getHostAddress();
out.println("Server Host Name :: "+inetAddress.getHostName()); 
%>
<br>
<%out.println("Server IP Address :: "+ip);%>
</h1>
<br>
<h1><h3> Client Side IP Address </h3><br>
<%out.print( "Client IP Address :: " + request.getRemoteAddr() ); %><br>
<%out.print( "Client Name Host :: "+ request.getRemoteHost() );%><br></h1>
<hr>
<div style="text-align: center;">
	<span>
		<img src="images/technology.png" alt="" width="100">
	</span>
	<span style="font-weight: bold;">
		Rakesh Technologies Institute, 
		Hyderabad, Above ICICI Bank, Beside Meghana Foods,
		Telangana,
		+91-8978939293
		rakhi.devops1@gmail.com
		<br>
		<a href="mailto:rakhi.devops1@gmail.com">Mail to Rakesh Technologies</a>
	</span>
</div>
<hr>
	<p> Service : <a href="services/employee/getEmployeeDetails">Get Employee Details </p>
<hr>
<hr>
<p align=center>Rakesh Technologies - Consultant, Training, Development Center.</p>
<p align=center><small>Copyrights 2022 by <a href="http://Rakeshtechnologies.com/">Rakesh Technologies,Telangana</a> </small></p>

</body>
</html>
