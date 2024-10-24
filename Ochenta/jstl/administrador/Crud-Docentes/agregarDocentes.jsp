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
        <title>Registro Docentes</title>

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
        <c:if test="${param.doc_nombre == null}" >
                <form action="#" method="post">
                    <tr><td></td>
                        <td><input type="hidden" name="id" value="${fila.id}"/></td>
                    </tr>
                <h1 class="titulo">Registro de Docentes</h1><br>
                    <fieldset>
                        
                        <legend><span class="number"></span> INFORMACION PERSONAL</legend>
                        <div class="form-group">
                        <label for="nombre">Nombre:</label>
                        <input type="text" class="form-control" required id="doc_nombre" name="doc_nombre" placeholder="Ingrese su nombre" value="${fila.doc_nombre}" minlength="3" maxlength="30" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+">
                        </div>

                        <div class="form-group">
                        <label for="apellido">Apellido:</label>
                        <input type="text" class="form-control" required id="doc_apellidos" name="doc_apellidos" placeholder="Ingrese su apellido" value="${fila.doc_apellido}" minlength="4" maxlength="40" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+">
                        </div>

                        <div class="form-group">
                        <label for="correo">Email:</label>
                        <input type="email" class="form-control" required id="doc_email" name="doc_email" placeholder="Ingrese su correo electrónico" value="${fila.doc_correo}" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" maxlength="50" autocomplete="on">
                        </div>


                        <div class="form-group">
                        <label for="cedula">Número cédula:</label>
                        <input type="text" class="form-control" required id="doc_cedula" name="doc_cedula" placeholder="Ingrese su número de cédula" value="${fila.doc_cedula}" pattern="[0-9]{10}" minlength="6" maxlength="10"
                        title="Ingrese los 10 dígitos de su cédula sin guiones ni espacios">
                        </div>


                        <div class="form-group">
                        <label for="contra">Contraseña:</label>
                        <input type="password" class="form-control" required id="doc_contra" name="doc_contra" placeholder="Ingrese su contraseña" value="${fila.doc_contra}"
                        pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$"
                            title="La contraseña debe tener al menos 8 caracteres y contener al menos una letra minúscula, una letra mayúscula y un número.">
                        </div>

                        <div class="form-group">
                            <label for="telefono">Teléfono o celular:</label>
                            <input type="tel" class="form-control" required id="doc_telefono" name="doc_telefono" minlength="10" maxlength="10" pattern="[0-9]{10}" placeholder="Ingrese su número de contacto" value="${fila.doc_telefono}" pattern="[0-9]{10}" minlength="6" maxlength="10" title="Ingrese los 10 dígitos de su cédula sin guiones ni espacios">
                        </div>

                         <div class="form-group">
                        <label for="doc_direccion">Dirección:</label>
                        <input type="text" class="form-control" id="doc_direccion" minlength="5" maxlength="100" name="doc_direccion" value="${fila.doc_direccion}" placeholder="Ingrese su número de direccion de residencia" required>
                        </div>

                        <label>Docente:</label>
                            <div class="form-check">
                            <label class="form-check-label">
                                <input type="radio" class="form-check-input" id="doc_jornada"  name="rol" value="Director">Principal &nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="radio" class="form-check-input" id="doc_jornada"  name="rol" value="Evaluador">Remplazo
                            </label>
                            </div>
                            <br>
                        

                        <br>
                        <legend><span class="number"></span>INFORMACION UNIVERSITARIA</legend>

                        <div class="form-group">
                        <label for="doc_nivel">Nivel de Educación:</label>
                        <select class="form-control" id="doc_nivel" name="doc_nivel" required>
                            <option value="Pregrado">Pregrado</option>
                            <option value="Especializacion">Especialización</option>
                            <option value="Maestria">Maestría</option>
                            <option value="Doctorado">Doctorado</option>
                        </select>
                        </div>

                        <label>Jornada:</label>
                            <div class="form-check">
                            <label class="form-check-label">
                                <input type="radio" class="form-check-input" id="doc_jornada"  name="doc_jornada" value="Diurna">Diurna &nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="radio" class="form-check-input" id="doc_jornada"  name="doc_jornada" value="Nocturna">Tarde
                            </label>
                            </div>
                            <br>

                            <br>

                            <div>
                            <label>Materia:</label>
                            <div class="form-check">
                            <label class="form-check-label">
                                <input type="text" class="form-control" required id="doc_facultad" name="doc_facultad" placeholder="Ingrese la materia" value="${fila.doc_nombre}" minlength="3" maxlength="30" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+">

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
        <c:if test="${param.doc_nombre != null}" >
            <sql:update var="result" dataSource="${parcialjstl}">
                INSERT IGNORE INTO
                docentes (doc_cedula, doc_nombre, doc_apellidos, doc_email, doc_telefono, doc_direccion,  doc_nivel, doc_jornada, doc_facultad, rol,  doc_contra)
                VALUES ('${param.doc_cedula}',
                '${param.doc_nombre}',
                '${param.doc_apellidos}',
                '${param.doc_email}',
                '${param.doc_telefono}',
                '${param.doc_direccion}',
                '${param.doc_nivel}',
                '${param.doc_jornada}',
                '${param.doc_facultad}',
                '${param.rol}',
                '${param.doc_contra}'
                );
            </sql:update>
            <c:if test="${result == 1}" >
                <script>
                    alert("Datos del Docente registrados Correctamente !!");
                    window.location.href = "mostrarDocentes.jsp";
                </script>
            </c:if>

            <c:if test="${result == 0}" >
                <script>
                    alert("El numero de cedula o telefono ya se encuentra registrados");
                    window.location.href = "mostrarDocentes.jsp";
                </script>
            </c:if>
        </c:if>
    

   


        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
    </body>
</html>