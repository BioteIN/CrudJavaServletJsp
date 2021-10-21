<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8" import="java.sql.*" errorPage="" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" href="css/bootstrap.min.css" rel="stylesheet" />
        <link type="text/css" href="css/style.css" rel="stylesheet" />
        <link type="text/css" href="css/jquery-ui/jquery-ui.min.css" rel="stylesheet" />
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/jquery-1.12.4.js"></script>
        <script type="text/javascript" src="js/jquery-ui.min.js"></script>
        <title>Introdução à Programacão Web Com Java - JSP Servlet </title>
    </head>
    <body>
        <div class="container">
            <form method="POST" action='UserController' name="frmAddUser">
                <input type="hidden" name="token" value="<%= session.getAttribute("token")%>" />
                <input type="hidden" readonly="readonly" name="userid" value="<c:out value="${user.userid}" />" />
                <div class="form-group">
                    <label class="form-label">Nome</label>
                    <input type="text" name="firstName" class="form-control" placeholder="Nome" value="<c:out value="${user.firstName}" />" />
                </div>
                <div class="form-group">
                    <label class="form-label">Apelido</label>
                    <input type="text" name="lastName" class="form-control" placeholder="Apelido" value="<c:out value="${user.lastName}" />" />
                </div>
<!--                <div class="form-group">
                    <label>Genre</label>
                    <input type="radio" name="genre" value="m" <c:if test="${user.genre == 'm'}">checked="checked"</c:if> />Male 
                    <input type="radio" name="genre" value="f" <c:if test="${user.genre == 'f'}">checked="checked"</c:if> />Female
                </div>-->
                <div class="form-group">
                    <label class="form-label">Data de Nascimento</label>
                    <input type="text" name="birthday" class="form-control" placeholder="Data de Nascimento" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${user.birthday}" />" autocomplete="off" />
                </div>
                <div class="form-group">
                    <label>Email</label>
                    <input type="text" name="email" class="form-control" placeholder="Email" value="<c:out value="${user.email}" />" />
                </div>
                <input type="button" onclick="location.href='index.jsp'" class="btn btn-outline-secondary" value="Voltar">
                <input type="submit" value="Submeter" class="btn btn-success" />
            </form>
<!--            <h2>List Users</h2>
            <p><a href="UserController?action=insert" class="btn btn-success" role="button">Add User</a></p>-->
            <c:choose>
                <c:when test = "${users.size() == 0}">
                    <div class="alert alert-info">No data recorded.</div>
                </c:when>    
                <c:otherwise>
                    <table class="table table-striped table-responsive table-bordered table-striped" cellpadding ="0" width="100%">
                        <thead class="thead-dark">
                            <tr>
                                <th>Id</th>
                                <th>Nome</th>
                                <th>Apelido</th>
<!--                                <th>Genre</th>-->
                                <th>Data de Nascimento</th>
                                <th>Email</th>
                                <th colspan=2>Acção</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${users}" var="user">
                                <tr>
                                    <td><c:out value="${user.userid}" /></td>
                                    <td><c:out value="${user.firstName}" /></td>
                                    <td><c:out value="${user.lastName}" /></td>
                                    <td><fmt:formatDate pattern="dd/MM/yyyy" value="${user.birthday}" /></td>
                                    <td><c:out value="${user.email}" /></td>
                                    <td><a href="UserController?action=edit&userId=<c:out value="${user.userid}"/>" class="">Editar</a></td>
                                    <td><a href="UserController?action=delete&userId=<c:out value="${user.userid}"/>" class="" onclick="return confirm('Pretende Eliminar?')">Eliminar</a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:otherwise>
            </c:choose>
        </div>
    </body>
</html>