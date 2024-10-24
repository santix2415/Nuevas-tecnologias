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
        <title>Registrar Idea Proyecto</title>

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
        <c:if test="${param.ante_autor == null}" >
                <form action="#" method="post">
                    <tr><td></td>
                        <td><input type="hidden" name="id" value="${fila.id}"/></td>
                    </tr>
                <h1 class="titulo">Registrar Tarea</h1><br>
                    <fieldset>
                        
                        <legend><span class="number">1</span> INFORMACION DE LA TAREAS</legend>
                        <div class="form-group">
                        <label for="codigo">Codigo:</label>
                        <input type="text" class="form-control" required id="ante_codigo" name="ante_codigo" placeholder="Ingrese el codigo" value="${fila.ante_codigo}" >
                        </div>

                         <div class="form-group">
                        <label for="nombre">Nombre:</label>
                        <input type="text" class="form-control" required id="ante_autor" name="ante_autor" placeholder="" value="${fila.ante_autor}" minlength="3" maxlength="30" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+">
                        </div>

                        

                        <label>Materia:</label>
                            <div class="form-check">
                            <label class="form-check-label">
                            <input type="text" class="form-control" required id="ante_facultad" name="ante_facultad" placeholder="Ingrese la materia" value="${fila.doc_nombre}" minlength="3" maxlength="30" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+">

                            </label>
                        </div>

                        <div class="form-group">
                            <label for="titulo" class="col-sm-2 col-form-label">Título:</label>
                            <input type="text" class="form-control" id="ante_titulo" name="ante_titulo" placeholder="Ingrese el titulo" value="${fila.ante_titulo}" minlength="3" maxlength="255"  required>
                        </div>

                        <div class="form-group">
                            <label for="objetivo" class="col-sm-2 col-form-label">Objetivo:</label>
                            <textarea class="form-control" id="objetivo" name="objetivo" rows="4" value="${fila.ante_objetivo}" placeholder="Ingrese su objetivo" required></textarea>
                        </div>
                        <div class="form-group">
                            <label for="descripcion" class="col-sm-2 col-form-label">Descripción:</label>
                            <textarea class="form-control" id="ante_descripcion" name="ante_descripcion" rows="7" value="${fila.ante_descripcion}" placeholder="Ingrese la descripcion"  required></textarea>
                        </div>

                         <div class="form-group">
                        <label for="estado" >Estado:</label>
                            <select class="form-select" id="proyecto_estado" name="proyecto_estado" value="${fila.proyecto_estado}" required>
                            <option selected disabled value="">Seleccione una opción</option>
                            <option value="1">Aprobado</option>
                            <option value="2">Desaprobado</option>
                            </select>
                        </div>

                    </fieldset>
                    <br><br>
                    <button type="submit" class="btn btn-primary btn-block " value="Guardar">Guardar</button>
                </form>

                <br><br><br>
           
        </c:if>
        <c:if test="${param.ante_autor != null}" >
    <sql:update var="result" dataSource="${parcialjstl}">
        INSERT IGNORE INTO
        idea_anteproyecto (ante_codigo, ante_autor, ante_region, ante_facultad, ante_titulo, ante_objetivo, ante_descripcion, proyecto_estado)
        VALUES ('${param.ante_codigo}',
        '${param.ante_autor}',
        '${param.ante_region}',
        '${param.ante_facultad}',
        '${param.ante_titulo}',
        '${param.objetivo}',
        '${param.ante_descripcion}',
        '${param.proyecto_estado}'
        );
    </sql:update>
    <c:if test="${result == 1}" >
        <script>
            alert("Datos del Proyecto registrados Correctamente !!");
            window.location.href = "mostrarIdeaProyecto.jsp";
        </script>
    </c:if>

    <c:if test="${result == 0}" >
        <script>
            alert("El numero de codigo se encuentra registrado");
            window.location.href = "mostrarIdeaProyecto.jsp";
        </script>
    </c:if>
</c:if>

    

   


        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
    </body>
</html>