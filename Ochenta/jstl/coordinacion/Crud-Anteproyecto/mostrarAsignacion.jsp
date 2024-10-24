<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ include file="../../../WEB-INF/jspf/conexion.jspf" %>

<%@page pageEncoding="UTF-8"%>

<!DOCTYPE html>
    <html lang="en">
        <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta http-equiv="Conte" content="ie=edge">
            

            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
            <script>$(document).ready(function(){$('[data-toggle="tooltip"]').tooltip();});</script>
            <title>Mostrar Asignacion</title>
        </head>
    
        <body class="body"> <br>
            <h1 class="titulo"> SISTEMA UNIVERSITARIO</h1>
            <h2 class="subtitulo">Ideas de Proyectos</h2>        


            <sql:query var="result" scope="request" dataSource="${parcialjstl}">
                SELECT idea_anteproyecto.ante_codigo, docentes.doc_nombre, docentes.doc_apellidos, idea_anteproyecto.ante_titulo
                FROM idea_docente
                INNER JOIN idea_anteproyecto ON idea_docente.id_idea = idea_anteproyecto.id
                INNER JOIN docentes ON idea_docente.id_docente = docentes.id
            </sql:query>

        <fieldset class="contenedor"> 
                <table border="1" id="tabla" class="table table-striped table-hover" width="1600px">
                    <thead class="thead-dark">
                        <tr><th>Codigo Anteproyecto</th>
                            <th>Titulo de la Idea</th>
                            <th>Docente Asignado</th>

                    </thead>

                    <tbody style="background-color:white">
                        <c:forEach var="fila" items="${result.rows}">
                            <tr>

                                <td><c:out value="${fila.ante_codigo}" /></td>
                                <td><c:out value="${fila.ante_titulo}" /></td>
                                <td class=""><c:out value="${fila.doc_nombre} ${fila.doc_apellidos}" /></td>
                            </tr>
                        </c:forEach>
                    </tbody>
            </table> <br>
            <nav class="navbar navbar-expand-lg" style="display: flex; justify-content: center; align-items: center;">
                    <button id="boton2" class="btn btn-secondary rounded-pill" type="button" onclick="location.href='../Crud-Anteproyecto/mostrarIdeaProyecto.jsp'">Regresar</button>
            </nav>

        </fieldset>
        <br>

            

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
</body>
</html>
