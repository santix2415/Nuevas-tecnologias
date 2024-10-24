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
        <title>Asignar Director</title>
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
        <nav class="navbar navbar-expand-sm  navbar-dark fixed-top">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                <button id="boton2" class="btn btn-outline-secondary rounded-pill" type="button" onclick="location.href='../principal_coor.jsp'">Regresar</button>
                </li>
            </ul>
        </nav>
        <br>
        <c:if test="${param.id_director == null && param.id_idea == null}" >
                <form action="#" method="post">
                    <tr><td></td>
                        <td><input type="hidden" name="id" value="${fila.id}"/></td>
                    </tr>
                <h1 class="titulo">Anadir director Idea de Proyecto de Grado</h1><br>
                    <fieldset>
                        
                        <legend><span class="number">1</span> ASIGNACION DEL ANTEPROYECTO</legend>

                        <div class="form-group">
                            <label for="codigo">Codigo Anteproyecto</label>
                            <sql:query var="rsCodigo" dataSource="${parcialjstl}">
                                SELECT * FROM idea_anteproyecto WHERE proyecto_estado = 1;
                            </sql:query>
                            <select class="form-control" name="id_idea" id="id_idea">
                            <option value="0">Seleccione una opción</option>
                            <c:forEach var="item" items="${rsCodigo.rows}">
                                <option value="${item.id}">
                                    <c:out value="${item.ante_codigo} " />
                                </option>
                            </c:forEach>
                            </select>
                        </div>


                        <div class="form-group">
                            <label for="docente">Docentes</label>
                            <sql:query var="rsDocente" dataSource="${parcialjstl}">
                                SELECT * FROM docentes WHERE rol = 'director';
                            </sql:query>
                            <select class="form-control" name="id_director" id="id_director">
                            <option value="0">Seleccione una opción</option>
                            <c:forEach var="item" items="${rsDocente.rows}">
                                <option value="${item.id}">
                                    <c:out value="${item.doc_nombre}  ${item.doc_apellidos} " />
                                </option>
                            </c:forEach>
                            </select>
                        </div>
                    </fieldset>
                    <br><br>
                    <button type="submit" class="btn btn-primary btn-block " value="Guardar">Guardar</button>
                    <button type="button" class="btn btn-warning btn-block " onclick="location.href='mostrarAsignacion.jsp'" >Mostrar Docentes Asignados</button>
                </form>
                <br><br><br>
        </c:if>
        <c:if test="${param.id_director !=null && param.id_idea !=null}" >
            <sql:query var="rsAsignado" dataSource="${parcialjstl}">
                SELECT * FROM idea_docente WHERE id_idea = '${param.id_idea}';
            </sql:query>
            <c:if test="${rsAsignado.rowCount == 0}" >
                <sql:update var="result" dataSource="${parcialjstl}">
                    INSERT  INTO
                    idea_docente (id_docente, id_idea)
                    VALUES ('${param.id_director }',
                    '${param.id_idea}'
                    );
                </sql:update>
                <c:if test="${result == 1}" >
                    <script>
                        alert("Docente Asignado Correctamente !!");
                        window.location.href = "mostrarAsignacion.jsp";
                    </script>
                </c:if>
                <c:if test="${result == 0}" >
                    <script>
                        alert("No se realizo");
                        window.location.href = "mostrarAsignacion.jsp";
                    </script>
                </c:if>
            </c:if>
            <c:if test="${rsAsignado.rowCount > 0}" >
                <script>
                    alert("El anteproyecto ya tiene un director asignado.");
                    window.location.href = "mostrarAsignacion.jsp";
                </script>
            </c:if>
        </c:if>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
    </body>
</html>