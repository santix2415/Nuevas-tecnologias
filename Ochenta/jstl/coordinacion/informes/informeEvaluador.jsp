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
            <title>Informe director</title>
             <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }

        .navbar {
            background-color: #343a40;
        }

        .titulo {
            text-align: center;
            margin-top: 20px;
            margin-bottom: 20px;
        }

        fieldset {
            margin-bottom: 20px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #fff;
        }

        legend {
            width: auto;
            padding: 5px 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f8f9fa;
        }

        .number {
            font-size: 16px;
            font-weight: bold;
            margin-right: 10px;
        }
    </style>
        </head>

        <body class="body"> <br>
            <h1 class="titulo"> SISTEMA UNIVERSITARIO</h1>
            <h2 class="subtitulo">Informe Docente Evaluador</h2>        


            <sql:query var="result" scope="request" dataSource="${parcialjstl}">
                 SELECT e.id, e.est_cedula as cedula, e.est_nombre as nombre, e.est_apellidos as apellido,
                    e.est_email as email, e.est_telefono as telefono, e.est_jornada as jornada,
                    e.est_programa as programa, e.est_semestre as semestre, e.est_archivo as archivo,
                    e.est_fecha as fecha, e.est_contra as contra, ap.estado as estado, d.doc_nombre as nombre, d.doc_apellidos as apellido,
                    d.doc_email as email, d.doc_telefono as telefono, d.doc_direccion as direccion
                FROM estudiante e
                INNER JOIN docentes d ON e.id_evaluador = d.id
                INNER JOIN aprobar_proyecto ap ON e.id_estado = ap.id;


            </sql:query>
        <fieldset class="contenedor"> 
                  <table border="1" id="tabla" class="table table-striped table-hover">
                    <thead class="thead-dark">
                        <tr><th>Cedula </th>
                            <th>Nombre Estudiante</th>
                            <th>Archivo</th>
                            <th>Fecha de Entrega</th>
                            <th>Docente Evaluador</th>
                            <th>Telefono Docente</th>
                            <th>Email Docente</th>
                            <th>Direccion Residencia Docente</th>
                            <th>Calificacion</th>
                    </thead>

                    <tbody style="background-color:white">
                        <c:forEach var="fila" items="${result.rows}">
                            <tr>

                                <td><c:out value="${fila.est_cedula}" /></td>
                                <td class=""><c:out value="${fila.est_nombre} ${fila.est_apellidos}" /></td>
                                <td><c:out value="${fila.est_archivo}" /></td>
                                <td><c:out value="${fila.est_fecha}" /></td>
                                <td><c:out value="${fila.id_docente} ${fila.doc_nombre} ${fila.doc_apellidos}" /></td>
                                <td><c:out value="${fila.doc_telefono}" /></td>
                                <td><c:out value="${fila.doc_email}" /></td>
                                <td><c:out value="${fila.doc_direccion}" /></td>
                                <td><c:out value="${fila.estado}" /></td>

                            </tr>
                        </c:forEach>
                    </tbody>
            </table> <br>
           
            <nav class="navbar navbar-expand-lg" style="display: flex; justify-content: center; align-items: center;">
                    
                    <button id="boton2" class="btn btn-secondary rounded-pill" type="button" onclick="location.href='../principal_coor.jsp'">Regresar</button>
            </nav>
             
        </fieldset>
        <br>

            

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
</body>
</html>
