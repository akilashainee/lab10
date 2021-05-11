<%@ page import="com.Item" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
  //Save---------------------------------
    if (request.getParameter("itemCode") != null)
    {
     Item itemObj = new Item();
     String stsMsg = "";
    //Insert--------------------------
    if (request.getParameter("hidItemIDSave") == "")
     {
     stsMsg = itemObj.insertItem(request.getParameter("itemCode"),
     request.getParameter("itemName"),
     request.getParameter("itemPrice"),
     request.getParameter("itemDesc"));
     }
    else//Update----------------------
    {
    stsMsg = itemObj.updateItem(request.getParameter("hidItemIDSave"),
    request.getParameter("itemCode"),
    request.getParameter("itemName"),
    request.getParameter("itemPrice"),
    request.getParameter("itemDesc"));
    }
    session.setAttribute("statusMsg", stsMsg);
   } 
  
    //Delete-----------------------------
    if (request.getParameter("hidItemIDDelete") != null)
    {
     Item itemObj = new Item();
     String stsMsg =
     itemObj.deleteItem(request.getParameter("hidItemIDDelete"));
     session.setAttribute("statusMsg", stsMsg);
    }
	%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	
<title>Items Management</title>
<link rel="stylesheet" href="views/bootstrap.min.css">
<script src="components/jquery-3.2.1.min.js"></script>
<script src="components/items.js"></script>
</head>
<body>
<h1>Items Management</h1>
<br>
<form id="formItem" name="formItem" method="post" action="items.jsp">
 Item code:

<input id="itemCode" name="itemCode" type="text"
 class="form-control form-control-sm">
<br> <br>Item name:
<input id="itemName" name="itemName" type="text"
 class="form-control form-control-sm">
<br><br> Item price:
<input id="itemPrice" name="itemPrice" type="text"
 class="form-control form-control-sm">
<br><br> Item description:
<input id="itemDesc" name="itemDesc" type="text"
 class="form-control form-control-sm">
<br><br>
<input id="btnSave" name="btnSave" type="button" value="Save"
 class="btn btn-primary"><br>
<input type="hidden" id="hidItemIDSave" name="hidItemIDSave" value="">
</form>
<div class="alert alert-success">
<%
 out.print(session.getAttribute("statusMsg"));
%>
</div>
<br>
<%
 Item itemObj = new Item();
 out.print(itemObj.readItems());
%>



</body>
</html>