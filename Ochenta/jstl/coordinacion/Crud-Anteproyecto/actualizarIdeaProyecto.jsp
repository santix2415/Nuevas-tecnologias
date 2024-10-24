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
        <title>Editar Idea Antepreyecto</title>
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
                <button id="boton2" class="btn btn-outline-secondary rounded-pill" type="button" onclick="location.href='../principal_coor.jsp'">Regresar</button>
                </li>
            </ul>
        </nav>

            <c:if test="${param.modifica == null}">
                <sql:query var="universidad" dataSource="${parcialjstl}">
                    SELECT * FROM idea_anteproyecto where id=?
                    <sql:param value="${param.id}">
                    </sql:param>
                </sql:query>
                    <form method=post>
                        <c:forEach var="itema" items="${universidad.rows}">
                            <input type="hidden" name="id" id="id" class="form-control" value="${itema.id}">

                            <h1 class="titulo">Actualizacion de Datos de la Idea Del Proyecto</h1>
                    <fieldset>
                        <legend><span class="number">1</span> INFORMACION DE LA IDEA DE ANTEPROYECTO</legend>
                        <div class="form-group">
                        <label for="codigo">Codigo:</label>
                        <input type="text" class="form-control" required id="ante_codigo" name="ante_codigo" placeholder="Ingrese el codigo" value="${itema.ante_codigo}" >
                        </div>

                         <div class="form-group">
                        <label for="nombre">Nombre del Autor:</label>
                        <input type="text" class="form-control" required id="ante_autor" name="ante_autor" placeholder="Ingrese el nombre del autor" value="${itema.ante_autor}" minlength="3" maxlength="100" >
                        </div>

                        

                        <label>Materia:</label>
                            <div class="form-check">
                            <label class="form-check-label">
                            <input type="text" class="form-control" required id="ante_facultad" name="ante_facultad" placeholder="Ingrese la materia" value="${fila.doc_nombre}" minlength="3" maxlength="30" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+">

                            </label>
                        </div>

                        <div class="form-group">
                            <label for="titulo" class="col-sm-2 col-form-label">Título:</label>
                            <input type="text" class="form-control" id="ante_titulo" name="ante_titulo" placeholder="Ingrese el titulo" value="${itema.ante_titulo}" minlength="3" maxlength="255"  required>
                        </div>

                        <div class="form-group">
                            <label for="objetivo" class="col-sm-2 col-form-label">Objetivo:</label>
                            <textarea class="form-control" id="ante_objetivo" name="ante_objetivo" rows="4"   required>${itema.ante_objetivo}</textarea>
                        </div>
                        <div class="form-group">
                            <label for="descripcion" class="col-sm-2 col-form-label">Descripción:</label>
                            <textarea class="form-control" id="ante_descripcion" name="ante_descripcion" rows="7"    required> ${itema.ante_descripcion}</textarea>
                        </div>

                         <div class="form-group">
                        <label for="estado" >Estado:</label>
                            <select class="form-control" id="proyecto_estado" name="proyecto_estado"  required>
                            <option selected disabled value="">Seleccione una opción</option>
                            <option value="1" ${itema.proyecto_estado == 1 ? 'selected' : ''}>Aprobado</option>
                            <option value="2" ${itema.proyecto_estado == 2 ? 'selected' : ''}>Desaprobado</option>
                            </select>
                        </div>


                    </fieldset>
                            <button type="submit" class="btn btn-success btn-block" value="Actualizar">Guardar Cambios</button>
                            <input type="hidden" name="modifica" value="SI">
                        </c:forEach>
                    </form>
            </c:if>
        

        <c:if test="${param.modifica != null}" >
        <sql:update var="result" dataSource="${parcialjstl}">
            update idea_anteproyecto
            set ante_codigo ='${param.ante_codigo}',
            ante_autor = '${param.ante_autor}',
            ante_region = '${param.ante_region}',
            ante_facultad = '${param.ante_facultad}',
            ante_titulo = '${param.ante_titulo}',
            ante_objetivo = '${param.ante_objetivo}',
            ante_descripcion = '${param.ante_descripcion}',
            proyecto_estado = '${param.proyecto_estado}'
            WHERE id = ${param.id};
        </sql:update>

            <c:if test="${result == 1 }">
                <script>
                    alert("Registro actualizado correctamente!");
                    window.location.href = "mostrarIdeaProyecto.jsp";
                </script>
            </c:if>
            <c:if test="${result == 0}">
                <script>
                    alert("No se actualizaron los datos");
                    window.location.href = "mostrarIdeaProyecto.jsp";
                </script>
            </c:if>
        </c:if>
        </div>
    </body>
</html>