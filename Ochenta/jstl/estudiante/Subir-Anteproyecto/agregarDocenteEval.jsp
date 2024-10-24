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
        <title>Evaluador</title>
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
                <button id="boton2" class="btn btn-outline-secondary rounded-pill" type="button" onclick="location.href='../principal_est.jsp'">Regresar</button>
                </li>
            </ul>
        </nav>
        <br>

        

        <c:if test="${param.id_evaluador== null}" >
                <form action="#" method="post">
                    <tr><td></td>
                        <td><input type="hidden" name="id" value="${fila.id}"/></td>
                    </tr>
                <h1 class="titulo">Subir Anteproyecto Estudiante</h1><br>
                    <fieldset>
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

                    

                            <div class="form-group">
                                <label for="docente">Docente Evaluador:</label>
                                <sql:query var="rsDocente" dataSource="${parcialjstl}">
                                    SELECT * FROM docentes WHERE rol = 'evaluador';
                                </sql:query>
                                <select class="form-control" name="id_evaluador" id="id_evaluador">
                                <option value="0">Seleccione una opción</option>
                                <c:forEach var="fila" items="${rsDocente.rows}">
                                    <option value="${fila.id}" ${fila.id == param.id_evaluador ? 'selected' : ''}>
                                        <c:out value="${fila.id} - ${fila.doc_nombre}  ${fila.doc_apellidos} " />
                                    </option>
                                </c:forEach>
                            </select>

                            </div>
                        </fieldset>

                    <br><br>
                    <button type="submit" class="btn btn-primary btn-block " value="Guardar">Guardar</button>
                </form>

                <br><br><br>
           
        </c:if>
        <c:if test="${param.id_evaluador !=null}" >
            <sql:update var="result" dataSource="${parcialjstl}">
            INSERT INTO estudiante (est_cedula,id_evaluador)
            VALUES ('${param.est_cedula}','${param.id_evaluador}');
       
        </sql:update>
            <c:if test="${result == 1}" >
                <script>
                    alert("Documentos Ingresados Sastifactoriamente !!");
                    window.location.href = "mostrarEstudiante.jsp";
                </script>
            </c:if>

            <c:if test="${result == 0}" >
                <script>
                    alert("El documento no se inserto");
                    window.location.href = "mostrarEstudiante.jsp";
                </script>
            </c:if>
        </c:if>
    

   


        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
    </body>
</html>