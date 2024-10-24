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
            <title>Consulta Anteproyectos</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f2f6f9;
            margin: 0;
            padding: 0;
            color: #333;
        }

        .navbar {
            background-color: #a8dadc;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .titulo {
            text-align: center;
            margin-top: 60px;
            font-size: 2.5rem;
            font-weight: bold;
            color: #457b9d;
        }

        .subtitulo {
            text-align: center;
            margin-top: 10px;
            margin-bottom: 30px;
            font-size: 1.5rem;
            color: #1d3557;
        }

        .form-control {
            max-width: 400px;
            margin: 0 auto;
            border-radius: 50px;
            border: 1px solid #a8dadc;
            padding: 10px;
        }

        .btn {
            border-radius: 50px;
            font-size: 1.2rem;
            padding: 10px 30px;
            background-color: #a8dadc;
            color: #fff;
            border: none;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #457b9d;
            color: #fff;
        }

        .card {
            margin: 20px auto;
            padding: 20px;
            border-radius: 15px;
            background-color: #fff;
            box-shadow: 0px 6px 10px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            text-align: center;
            border: 1px solid #ddd;
        }

        .card:nth-child(odd) {
            background-color: #f9f9f9;
        }

        .table-responsive {
            margin: 20px auto;
            max-width: 90%;
        }

        thead {
            background-color: #a8dadc;
            color: #fff;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }

        footer {
            margin-top: 40px;
            padding: 20px;
            text-align: center;
            background-color: #457b9d;
            color: #ffffff;
        }

    </style>
        </head>

        <body class="body"> 
        <nav class="navbar navbar-expand-sm  navbar-dark fixed-top">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                <button id="boton2" class="btn btn-outline-secondary rounded-pill" type="button" onclick="location.href='../principal_coor.jsp'">Regresar</button>
                </li>
            </ul>
        </nav>
        
        <br>
            <h1 class="titulo"> SISTEMA JARDIN</h1>
            <h2 class="subtitulo">Consultar Tareas del Estudiante</h2>        
        <br><br>
        <form>
            <input list="lista_est" class="form-control" placeholder="Buscar"  name="numeroest" id="numeroest" required/>
                <datalist id="lista_est">
                    <sql:query var="est_resultado" dataSource="${parcialjstl}">
                        SELECT * FROM estudiante
                    </sql:query>
                    <c:forEach var="est_valores" items="${est_resultado.rows}">
                        <option value="${est_valores.est_cedula}">
                            ${est_valores.est_nombre}
                        </option>
                    </c:forEach>
                </datalist>
                <br>

                <div style="text-align: center;">
                <input type="submit" class="btn btn-success" name="consultar" value="Consultar">
                </div>



                <c:if test="${not empty param.consultar}">
                    <sql:setDataSource var="conexion" driver="com.mysql.jdbc.Driver"
                        url="jdbc:mysql://localhost:3306/parcialjstl" user="root" password=""/>

                    <sql:query var="movimiento" dataSource="${conexion}">
                        SELECT estudiante.*, docentes.*, idea_anteproyecto.*
                        FROM estudiante
                        INNER JOIN docentes ON estudiante.id_director = docentes.id
                        INNER JOIN idea_docente ON docentes.id = idea_docente.id_docente
                        INNER JOIN idea_anteproyecto ON idea_docente.id_idea = idea_anteproyecto.id
                        WHERE est_cedula = ${param.numeroest}
                    </sql:query>
                </c:if>

                <c:if test="${not empty param.consultar}">
                    <table border="1" id="tabla" class="table table-striped table-hover">
                    <c:forEach var="resultado" items="${movimiento.rows}">
                    <thead class="thead-dark">
                        <tr>
                            <th>Cedula </th>
                            <td>${resultado.est_cedula}</td>
                        </tr>
                        <tr>
                            <th>Nombre:</th>
                            <td>${resultado.est_nombre}</td>
                        </tr>
                        <tr>
                            <th>Apellidos:</th>
                            <td>${resultado.est_apellidos}</td>
                        </tr>
                        <tr>
                            <th>Correo Electronico:</th>
                            <td>${resultado.est_email}</td>
                        </tr>
                        <tr>
                            <th>Archivo Subido</th>
                            <td>${resultado.est_archivo}</td>
                        </tr>
                        <tr>
                            <th>Fecha de Entrega</th>
                            <td>${resultado.est_fecha}</td>
                        </tr>
                        <tr>
                            <th>Titulo Proyecto</th>
                            <td>${resultado.ante_titulo}</td>
                        </tr>
                        <tr>
                            <th>Objetivo Proyecto</th>
                            <td>${resultado.ante_objetivo}</td>
                        </tr>
                        <tr>
                            <th>Docente Directivo del Proyecto</th>
                            <td>${resultado.doc_nombre}${resultado.doc_apellidos}</td>
                        </tr>
                        <tr>
                            <th>Cedula Docente Directivo </th>
                            <td>${resultado.doc_cedula}</td>
                        </tr>
                        <tr>
                            <th>Email Docente Directivo </th>
                            <td>${resultado.doc_email}</td>
                        </tr>
                        <tr>
                            <th>Telefono Docente Directivo </th>
                            <td>${resultado.doc_telefono}</td>
                        </tr>
                        <tr>
                            <th>Direccion Docente Directivo </th>
                            <td>${resultado.doc_direccion}</td>
                        </tr>
                    </thead>
                    </c:forEach>
                </c:if>

        </form>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
</body>
</html>
