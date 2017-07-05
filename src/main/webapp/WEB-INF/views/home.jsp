<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<c:import url="header.jsp" />

	<div>
		${sucesso}
       	<%@ include file = "produtos/lista.jsp" %>
    </div>

<c:import url="footer.jsp" />