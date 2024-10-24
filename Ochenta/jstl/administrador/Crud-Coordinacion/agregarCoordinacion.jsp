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
        <title>Registro Coordinacion</title>

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
                <button id="boton2" class="btn btn-outline-secondary rounded-pill" type="button" onclick="location.href='../principal_admin.jsp'">Regresar</button>
                </li>
            </ul>
        </nav>
        <br>
        <c:if test="${param.coor_nombre == null}" >
                <form action="#" method="post">
                    <tr><td></td>
                        <td><input type="hidden" name="id" value="${fila.id}"/></td>
                    </tr>
                <h1 class="titulo">Registro Tarea</h1><br>
                    <fieldset>
                        
                        <legend><span class="number">1</span> INFORMACION PERSONAL</legend>
                        <div class="form-group">
                        <label for="nombre">Nombre:</label>
                        <input type="text" class="form-control" required id="coor_nombre" name="coor_nombre" placeholder="Ingrese su nombre" value="${fila.est_nombre}" minlength="3" maxlength="30" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+">
                        </div>

                        <div class="form-group">
                        <label for="apellido">Apellido:</label>
                        <input type="text" class="form-control" required id="coor_apellidos" name="coor_apellidos" placeholder="Ingrese su apellido" value="${fila.est_apellido}" minlength="4" maxlength="40" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+">
                        </div>

                        <div class="form-group">
                        <label for="correo">Email:</label>
                        <input type="email" class="form-control" required id="coor_email" name="coor_email" placeholder="Ingrese su correo electrónico" value="${fila.est_correo}" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" maxlength="100" autocomplete="on">
                        </div>


                        <div class="form-group">
                        <label for="cedula">Codigo:</label>
                        <input type="text" class="form-control" required id="coor_cedula" name="coor_cedula" placeholder="Ingrese su número de cédula" value="${fila.est_cedula}" pattern="[0-9]{10}" minlength="6" maxlength="10"
                        title="Ingrese los 10 dígitos de su cédula sin guiones ni espacios">
                        </div>


                        <div class="form-group">
                        <label for="contra">Contraseña:</label>
                        <input type="password" class="form-control" required id="coor_contra" name="coor_contra" placeholder="Ingrese su contraseña" value="${fila.est_contr}"
                        pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$"
                            title="La contraseña debe tener al menos 8 caracteres y contener al menos una letra minúscula, una letra mayúscula y un número.">
                        </div>

                        <div class="form-group">
                            <label for="telefono">Teléfono o celular:</label>
                            <input type="tel" class="form-control" required id="coor_telefono" name="coor_telefono" minlength="10" maxlength="10" pattern="[0-9]{10}" placeholder="Ingrese su número de contacto" value="${fila.est_telefono}" pattern="[0-9]{10}" minlength="6" maxlength="10" title="Ingrese los 10 dígitos de su cédula sin guiones ni espacios">
                        </div>

                        <br>
                        <legend><span class="number">2</span>INFORMACION</legend>
                            <div>
                            <label>Materia:</label>
                            <div class="form-check">
                            <label class="form-check-label">
                                <input type="text" class="form-control" required id="coor_facultad" name="coor_facultad" placeholder="Ingrese la materia" value="${fila.doc_nombre}" minlength="3" maxlength="30" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+">
                            </label>
                            </div>
                            <br>

                            
                            
                            <br>
                           
                    </fieldset>
                    <br><br>
                    <button type="submit" class="btn btn-primary btn-block " value="Guardar">Guardar</button>
                </form>

                <br><br><br>
           
        </c:if>
        <c:if test="${param.coor_nombre != null}" >
            <sql:update var="result" dataSource="${parcialjstl}">
                INSERT IGNORE INTO
                coordinacion (coor_cedula, coor_nombre, coor_apellidos, coor_email, coor_telefono,  coor_programa, coor_facultad,  coor_contra)
                VALUES ('${param.coor_cedula}',
                '${param.coor_nombre}',
                '${param.coor_apellidos}',
                '${param.coor_email}',
                '${param.coor_telefono}',
                '${param.coor_programa}',
                '${param.coor_facultad}',
                '${param.coor_contra}'
                );
            </sql:update>
            <c:if test="${result == 1}" >
                <script>
                    alert("Datos de la Coordinacion registrados Correctamente !!");
                    window.location.href = "mostrarCoordinacion.jsp";
                </script>
            </c:if>

            <c:if test="${result == 0}" >
                <script>
                    alert("El numero de cedula o telefono ya se encuentra registrados");
                    window.location.href = "mostrarCoordinacion.jsp";
                </script>
            </c:if>
        </c:if>
    

   


        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
    </body>
</html>