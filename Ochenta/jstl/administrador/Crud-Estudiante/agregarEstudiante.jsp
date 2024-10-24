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
        <title>Registro Estudiantes</title>
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
        <c:if test="${param.est_nombre == null}" >
                <form action="#" method="post">
                    <tr><td></td>
                        <td><input type="hidden" name="id" value="${fila.id}"/></td>
                    </tr>
                <h1 class="titulo">Registro Estudiantes</h1><br>
                    <fieldset>
                        
                        <legend><span class="number">1</span> INFORMACION PERSONAL</legend>
                        <div class="form-group">
                        <label for="nombre">Nombre:</label>
                        <input type="text" class="form-control" required id="est_nombre" name="est_nombre" placeholder="Ingrese su nombre" value="${fila.est_nombre}" minlength="3" maxlength="30" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+">
                        </div>

                        <div class="form-group">
                        <label for="apellido">Apellido:</label>
                        <input type="text" class="form-control" required id="est_apellidos" name="est_apellidos" placeholder="Ingrese su apellido" value="${fila.est_apellido}" minlength="4" maxlength="40" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+">
                        </div>

                        <div class="form-group">
                        <label for="correo">Email:</label>
                        <input type="email" class="form-control" required id="est_email" name="est_email" placeholder="Ingrese su correo electrónico" value="${fila.est_correo}" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" maxlength="100" autocomplete="on">
                        </div>


                        <div class="form-group">
                        <label for="cedula">Número Tarjeta de identidad:</label>
                        <input type="text" class="form-control" required id="est_cedula" name="est_cedula" placeholder="Ingrese su número de cédula" value="${fila.est_cedula}" pattern="[0-9]{10}" minlength="6" maxlength="10"
                        title="Ingrese los 10 dígitos de su cédula sin guiones ni espacios">
                        </div>


                        <div class="form-group">
                        <label for="contra">Contraseña:</label>
                        <input type="password" class="form-control" required id="est_contra" name="est_contra" placeholder="Ingrese su contraseña" value="${fila.est_contr}"
                        pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$"
                            title="La contraseña debe tener al menos 8 caracteres y contener al menos una letra minúscula, una letra mayúscula y un número.">
                        </div>

                        <div class="form-group">
                            <label for="telefono">Teléfono o celular:</label>
                            <input type="tel" class="form-control" required id="est_telefono" name="est_telefono" minlength="10" maxlength="10" pattern="[0-9]{10}" placeholder="Ingrese su número de contacto" value="${fila.est_telefono}" pattern="[0-9]{10}" minlength="6" maxlength="10" title="Ingrese los 10 dígitos de su cédula sin guiones ni espacios">
                        </div>

                        <br>
                        <legend><span class="number">2</span> INFORMACION DEL ESTUDIANTE</legend>

                            <label>Jornada:</label>
                            <div class="form-check">
                            <label class="form-check-label">
                                <input type="radio" class="form-check-input" id="est_jornada"  name="est_jornada" value="Diurna">Diurna &nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="radio" class="form-check-input" id="est_jornada"  name="est_jornada" value="Nocturna">Tarde
                            </label>
                            </div>
                            <br>

                            <label for="est_programa">Programa Academico: </label>
                            <select  required id="est_programa" class="form-control" name="est_programa" value="${fila.est_programa}">
                                    


                                    
                                        <optgroup label="Grado">
                                            <option value="Pre-jardín" ${fila.est_programa == 'pre-jardín' ? 'selected' : ''}>pre-jardín</option>
                                        <option value="Jardín" ${fila.est_programa == 'Jardín' ? 'selected' : ''}>Jardín</option>
                                        <option value="Transición" ${fila.est_programa == 'Transición' ? 'selected' : ''}>Transición</option>
                                        </optgroup>
                                    
                            </select>
                            


                            <div class="form-group">
                            <label for="docente">Docentes Principal: </label>
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

                            <div class="form-group">
                            <label for="docente">Docentes Remplazo: </label>
                            <sql:query var="rsDocente" dataSource="${parcialjstl}">
                                SELECT * FROM docentes WHERE rol = 'evaluador';
                            </sql:query>
                            <select class="form-control" name="id_evaluador" id="id_evaluador">
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
                </form>

                <br><br><br>
           
        </c:if>
        <c:if test="${param.est_nombre !=null}" >
            <sql:update var="result" dataSource="${parcialjstl}">
                INSERT IGNORE INTO
                estudiante (est_cedula, est_nombre, est_apellidos, est_email, est_telefono, est_jornada, est_programa, est_semestre, est_contra, id_director,id_evaluador)
                VALUES ('${param.est_cedula}',
                '${param.est_nombre}',
                '${param.est_apellidos}',
                '${param.est_email}',
                '${param.est_telefono}',
                '${param.est_jornada}',
                '${param.est_programa}',
                '${param.est_semestre}',
                '${param.est_contra}',
                '${param.id_director}',
                '${param.id_evaluador}'
                );
            </sql:update>
            <c:if test="${result == 1}" >
                <script>
                    alert("Datos de Estudiante registrados Correctamente !!");
                    window.location.href = "mostrarEstudiante.jsp";
                </script>
            </c:if>

            <c:if test="${result == 0}" >
                <script>
                    alert("El numero de cedula o telefono ya se encuentra registrados");
                    window.location.href = "mostrarEstudiante.jsp";
                </script>
            </c:if>
        </c:if>
    

   


        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
    </body>
</html>