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
        <title>Actualizar Coordinacion</title>
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
                <button id="boton2" class="btn btn-outline-secondary rounded-pill" type="button" onclick="location.href='../principal_admin.jsp'">Regresar</button>
                </li>
            </ul>
        </nav>

            <c:if test="${param.modifica == null}">
                <sql:query var="universidad" dataSource="${parcialjstl}">
                    SELECT * FROM coordinacion where id=?
                    <sql:param value="${param.id}">
                    </sql:param>
                </sql:query>
                    <form method=post>
                        <c:forEach var="itema" items="${universidad.rows}">
                            <input type="hidden" name="id" id="id" class="form-control" value="${itema.id}">

                            <h1 class="titulo">Actualizacion de Datos del la Coordinacion</h1>
                    <fieldset>
                        <legend><span class="number">1</span> INFORMACION PERSONAL</legend>
                        <div class="form-group">
                        <label for="nombre">Nombre:</label>
                        <input type="text" class="form-control" required id="coor_nombre" name="coor_nombre" placeholder="Ingrese su nombre" value="${itema.coor_nombre}" minlength="3" maxlength="30" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+">
                        </div>

                        <div class="form-group">
                        <label for="apellido">Apellido:</label>
                        <input type="text" class="form-control" required id="coor_apellidos" name="coor_apellidos" placeholder="Ingrese su apellido" value="${itema.coor_apellidos}" minlength="3" maxlength="40" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+">
                        </div>

                        <div class="form-group">
                        <label for="correo">Email:</label>
                        <input type="email" class="form-control" required id="coor_email" name="coor_email" placeholder="Ingrese su correo electrónico" value="${itema.coor_email}" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" maxlength="100" autocomplete="on">
                        </div>

                        <div class="form-group">
                        <label for="cedula">Número cédula:</label>
                        <input type="text" class="form-control" required id="coor_cedula" name="coor_cedula" placeholder="Ingrese su número de cédula" value="${itema.coor_cedula}" pattern="[0-9]{10}" minlength="6" maxlength="10"
                        title="Ingrese los 10 dígitos de su cédula sin guiones ni espacios">
                        </div>

                        <div class="form-group">
                        <label for="contra">Contraseña:</label>
                        <input type="password" class="form-control" required id="coor_contra" name="coor_contra" 
                            placeholder="Ingrese su contraseña" value="${itema.coor_contra}" 
                            pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$"
                            title="La contraseña debe tener al menos 8 caracteres y contener al menos una letra minúscula, una letra mayúscula y un número.">
                        </div>


                        <div class="form-group">
                        <label for="telefono">Número de contacto:</label>
                        <input type="tel" class="form-control" required id="coor_telefono" name="coor_telefono" placeholder="Ingrese su número de contacto" value="${itema.coor_telefono}" pattern="[0-9]{10}" minlength="6" maxlength="10" title="Ingrese los 10 dígitos de su cédula sin guiones ni espacios">
                        </div>


                        <legend><span class="number">2</span>INFORMACION UNIVERSITARIA</legend>

                        <br>
                        <label>Facultad:</label>
                        <div class="form-check">
                        <label class="form-check-label">
                                <input type="text" class="form-control" required id="coor_facultad" name="coor_facultad" placeholder="Ingrese la materia" value="${fila.coor_nombre}" minlength="3" maxlength="30" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+">
                        </label>
                        </div>
                        <br>

                            
                            <br>


                    </fieldset>
                            <button type="submit" class="btn btn-success btn-block" value="Actualizar">Guardar Cambios</button>
                            <input type="hidden" name="modifica" value="SI">
                        </c:forEach>
                    </form>
            </c:if>
        

        <c:if test="${param.modifica != null}" >
        <sql:update var="result" dataSource="${parcialjstl}">
            update coordinacion
            set coor_cedula ='${param.coor_cedula}',
            coor_nombre = '${param.coor_nombre}',
            coor_apellidos = '${param.coor_apellidos}',
            coor_email = '${param.coor_email}',
            coor_telefono = '${param.coor_telefono}',
            coor_facultad = '${param.coor_facultad}',
            coor_programa = '${param.coor_programa}',
            coor_contra = '${param.coor_contra}'
            WHERE id = ${param.id};
        </sql:update>

            <c:if test="${result == 1 }">
                <script>
                    alert("Registro actualizado correctamente!");
                    window.location.href = "mostrarCoordinacion.jsp";
                </script>
            </c:if>
            <c:if test="${result == 0}">
                <script>
                    alert("No se actualizaron los datos");
                    window.location.href = "mostrarCoordinacion.jsp";
                </script>
            </c:if>
        </c:if>
        </div>
    </body>
</html>