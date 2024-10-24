<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ include file="../../../WEB-INF/jspf/conexion.jspf" %>
<%@page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Eliminar  Idea Proyecto</title>

        <meta charset="utf-8">
        
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    </head>
<body>
    <c:if test="${param.id != null}">
    <sql:update var="result1" dataSource="${parcialjstl}">
        DELETE FROM idea_docente WHERE id_idea = ${param.id};
    </sql:update>
    
    <c:if test="${result1 >= 0}">
        <sql:update var="result2" dataSource="${parcialjstl}">
            DELETE FROM idea_anteproyecto WHERE id = ${param.id};
        </sql:update>

        <c:if test="${result2 == 1}">
            <script>
            alert("Registro Eliminado correctamente!");
            window.location.href = "mostrarIdeaProyecto.jsp";
            </script>
        </c:if>
    </c:if>
</c:if>

</body>
</html>