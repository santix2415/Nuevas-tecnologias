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
            <title>Mostrar Docentes</title>

                <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }

        .titulo {
            color: #6c757d;
            text-align: center;
            font-size: 2.5rem;
            margin-bottom: 1rem;
        }

        .subtitulo {
            color: #495057;
            text-align: center;
            font-size: 1.8rem;
            margin-bottom: 2rem;
        }

        fieldset.contenedor {
            background-color: #fff3e1; /* Suave pastel peach */
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            margin: 20px auto;
            max-width: 80%;
        }

        table {
            margin-top: 20px;
        }

        th {
            background-color: #aedff7; /* Azul pastel */
            color: #ffffff;
        }

        tbody {
            background-color: #f0e1fb; /* Lavanda pastel */
        }

        td {
            color: #6c757d;
        }

        .btn {
            border-radius: 50px;
        }

        .btn-success {
            background-color: #90ee90; /* Verde pastel */
            border-color: #90ee90;
        }

        .btn-warning {
            background-color: #ffcccb; /* Rojo pastel */
            border-color: #ffcccb;
        }

        .btn-danger {
            background-color: #ffb6c1; /* Rosa pastel */
            border-color: #ffb6c1;
        }

        .btn-secondary {
            background-color: #d1e7dd; /* Verde menta pastel */
            border-color: #d1e7dd;
        }

        #boton1, #boton2 {
            margin: 10px;
        }

        nav.navbar {
            margin-top: 20px;
        }
    </style>


        </head>

        <body class="body"> <br>
            <h1 class="titulo"> SISTEMA JARDIN</h1>
            <h2 class="subtitulo">Datos de los Docentes</h2>        


            <sql:query var="result" scope="request" dataSource="${parcialjstl}">
                Select docentes.id, docentes.doc_cedula as cedula, docentes.doc_nombre as nombre, 
                docentes.doc_apellidos as apellido, docentes.doc_email as email, docentes.doc_telefono as telefono,  docentes.doc_direccion as direccion, docentes.doc_nivel as Educacion,
                docentes.doc_jornada  as jornada, docentes.doc_facultad as facultad,  docentes.rol,
                docentes.doc_contra as contra
                from docentes
            </sql:query>
        <fieldset class="contenedor"> 
                  <table border="1" id="tabla" class="table table-striped table-hover">
                    <thead class="thead-dark">
                        <tr><th>Cedula</th>
                            <th>Nombre</th>
                            <th>Apellido</th>
                            <th>Correo</th>
                            <th>Telefono</th>
                            <th>Dirección</th>
                            <th>Nivel de Educación</th>
                            <th>Jornada</th>
                            <th>Materia</th>
                            <th>Clave</th>
                            <th colspan="2">Acciones </th></tr>
                    </thead>

                    <tbody style="background-color:white">
                        <c:forEach var="fila" items="${result.rows}">
                            <tr>

                                <td><c:out value="${fila.doc_cedula}" /></td>
                                <td class=""><c:out value="${fila.doc_nombre}" /></td>
                                <td><c:out value="${fila.doc_apellidos}" /></td>
                                <td><c:out value="${fila.doc_email}" /></td>
                                <td><c:out value="${fila.doc_telefono}" /></td>
                                <td><c:out value="${fila.doc_direccion}" /></td>
                                <td><c:out value="${fila.doc_nivel}" /></td>
                                <td><c:out value="${fila.doc_jornada}" /></td>
                                <td><c:out value="${fila.doc_facultad}" /></td>
                                <td><c:out value="${fila.doc_contra}" /></td>
                                <td><br><a href="eliminarDocentes.jsp?id=${fila.id}">
                                <button id="botonn-eliminar" class="btn btn-danger" data-toggle="tooltip" data-original-title="Eliminar">
                                    <i class="fa fa-trash-alt"></i>
                                    <span class="sr-only">Eliminar</span>
                                </button>
                                </a></td>

                                <td><br><a href="actualizarDocentes.jsp?id=${fila.id}">
                                <button id="botonn-editar" class="btn btn-warning" data-toggle="tooltip" data-original-title="Editar">
                                    <i class="fa fa-pencil-alt"></i>
                                    <span class="sr-only">Editar</span>
                                </button>
                                </a></td>

                            </tr>
                        </c:forEach>
                    </tbody>
            </table> <br>
           
            <nav class="navbar navbar-expand-lg" style="display: flex; justify-content: center; align-items: center;">
                    <button id="boton1" class="btn btn-success rounded-pill" type="button" onclick="location.href='agregarDocentes.jsp?id=${fila.id}'">Nuevo Docente</button>
                    <button id="boton2" class="btn btn-secondary rounded-pill" type="button" onclick="location.href='../principal_admin.jsp'">Regresar</button>
            </nav>
             
        </fieldset>
        <br>

            

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
</body>
</html>
