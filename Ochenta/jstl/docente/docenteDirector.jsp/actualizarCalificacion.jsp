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
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        <title>Actualizar Calificacion</title>

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
    <body class="body">
        <br><br>
        <div class="container">
        <nav class="navbar navbar-expand-sm  navbar-dark fixed-top">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                <button id="boton2" class="btn btn-outline-secondary rounded-pill" type="button" onclick="location.href='../principal_dir.jsp'">Regresar</button>
                </li>
            </ul>
        </nav>

            <c:if test="${param.modifica == null}">
                <sql:query var="universidad" dataSource="${parcialjstl}">
                    SELECT * FROM estudiante where id=?
                    <sql:param value="${param.id}">
                    </sql:param>
                </sql:query>
                    <form method=post>
                        <c:forEach var="itema" items="${universidad.rows}">
                            <input type="hidden" name="id" id="id" class="form-control" value="${itema.id}">

                            <h1 class="titulo">Calificar Proyecto</h1>
                    <fieldset>
                        
                        <label for="estado">ESTADO:</label>
                            <select id="estado" name="estado" class="form-control" required>
                            <option value="" disabled>--Seleccione--</option>
                            <option value="1" ${itema.est_semestre == aprobado ? 'selected' : ''}>Aprobado</option>
                            <option value="2" ${itema.est_semestre == desaprobado ? 'selected' : ''}>Desaprobado</option>
                            </select>


                    </fieldset>
                            <button type="submit" class="btn btn-success btn-block" value="Actualizar">Guardar Cambios</button>
                            <input type="hidden" name="modifica" value="SI">
                        </c:forEach>
                    </form>
            </c:if>
        
        <c:if test="${param.modifica != null}" >
        <sql:update var="result" dataSource="${parcialjstl}">
            update estudiante
            set id_estado ='${param.estado}'
            WHERE id = ${param.id};
        </sql:update>

            <c:if test="${result == 1 }">
                <script>
                    alert("Registro actualizado correctamente!");
                    window.location.href = "mostrarCalificacion.jsp";
                </script>
            </c:if>
            <c:if test="${result == 0}">
                <script>
                    alert("No se actualizaron los datos");
                    window.location.href = "mostrarCalificacion.jsp";
                </script>
            </c:if>
        </c:if>
        </div>
    </body>
</html>