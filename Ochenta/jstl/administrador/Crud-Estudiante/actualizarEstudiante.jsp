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
        <title>Actualizar Estudiantes</title>

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
                    SELECT * FROM estudiante where id=?
                    <sql:param value="${param.id}">
                    </sql:param>
                </sql:query>
                    <form method=post>
                        <c:forEach var="itema" items="${universidad.rows}">
                            <input type="hidden" name="id" id="id" class="form-control" value="${itema.id}">

                            <h1 class="titulo">Actualizacion de Datos del estudiante</h1>
                    <fieldset>
                        <legend><span class="number">1</span> INFORMACION PERSONAL</legend>
                        <div class="form-group">
                        <label for="nombre">Nombre:</label>
                        <input type="text" class="form-control" required id="est_nombre" name="est_nombre" placeholder="Ingrese su nombre" value="${itema.est_nombre}" minlength="3" maxlength="30" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+">
                        </div>

                        <div class="form-group">
                        <label for="apellido">Apellido:</label>
                        <input type="text" class="form-control" required id="est_apellidos" name="est_apellidos" placeholder="Ingrese su apellido" value="${itema.est_apellidos}" minlength="3" maxlength="40" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+">
                        </div>

                        <div class="form-group">
                        <label for="correo">Email:</label>
                        <input type="email" class="form-control" required id="est_email" name="est_email" placeholder="Ingrese su correo electrónico" value="${itema.est_email}" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" maxlength="100" autocomplete="on">
                        </div>

                        <div class="form-group">
                        <label for="cedula">Número cédula:</label>
                        <input type="text" class="form-control" required id="est_cedula" name="est_cedula" placeholder="Ingrese su número de cédula" value="${itema.est_cedula}" pattern="[0-9]{10}" minlength="6" maxlength="10"
                        title="Ingrese los 10 dígitos de su cédula sin guiones ni espacios">
                        </div>

                        <div class="form-group">
                        <label for="contra">Contraseña:</label>
                        <input type="password" class="form-control" required id="est_contra" name="est_contra" 
                            placeholder="Ingrese su contraseña" value="${itema.est_contra}" 
                            pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$"
                            title="La contraseña debe tener al menos 8 caracteres y contener al menos una letra minúscula, una letra mayúscula y un número.">
                        </div>


                        <div class="form-group">
                        <label for="telefono">Número de contacto:</label>
                        <input type="tel" class="form-control" required id="est_telefono" name="est_telefono" placeholder="Ingrese su número de contacto" value="${itema.est_telefono}" pattern="[0-9]{10}" minlength="6" maxlength="10" title="Ingrese los 10 dígitos de su cédula sin guiones ni espacios">
                        </div>


                        <legend><span class="number">2</span>INFORMACION</legend>


                        <label>Jornada:</label>
                        <div class="form-check">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" id="est_jornada_diurna" name="est_jornada" value="Diurna" ${itema.est_jornada == 'Diurna' ? 'checked' : ''} required>Diurna &nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" class="form-check-input" id="est_jornada_nocturna" name="est_jornada" value="Tarde" ${itema.est_jornada == 'Tarde' ? 'checked' : ''} required>Tarde
                        </label>
                        </div>


                            <label for="est_programa">Programa Academico: </label>
                            <select  required id="est_programa" class="form-control" name="est_programa"  required> 
                                    
                                    
                                        <optgroup label="Tecnologías">
                                        <option value="Pre-jardín" ${fila.est_programa == 'pre-jardín' ? 'selected' : ''}>pre-jardín</option>
                                        <option value="Jardín" ${fila.est_programa == 'Jardín' ? 'selected' : ''}>Jardín</option>
                                        <option value="Transición" ${fila.est_programa == 'Transición' ? 'selected' : ''}>Transición</option>
                                        </optgroup>
                                    
                            </select>
                            <br>

                            
                            </select>

                    </fieldset>
                            <button type="submit" class="btn btn-success btn-block" value="Actualizar">Guardar</button>
                            <input type="hidden" name="modifica" value="SI">
                        </c:forEach>
                    </form>
            </c:if>
        

        <c:if test="${param.modifica != null}" >
        <sql:update var="result" dataSource="${parcialjstl}">
            update estudiante
            set est_cedula ='${param.est_cedula}',
            est_nombre = '${param.est_nombre}',
            est_apellidos = '${param.est_apellidos}',
            est_email = '${param.est_email}',
            est_telefono = '${param.est_telefono}',
            est_jornada = '${param.est_jornada}',
            est_programa = '${param.est_programa}',
            est_contra = '${param.est_contra}'
            WHERE id = ${param.id};
        </sql:update>

            <c:if test="${result == 1 }">
                <script>
                    alert("Registro actualizado correctamente!");
                    window.location.href = "mostrarEstudiante.jsp";
                </script>
            </c:if>
            <c:if test="${result == 0}">
                <script>
                    alert("No se actualizaron los datos");
                    window.location.href = "mostrarEstudiante.jsp";
                </script>
            </c:if>
        </c:if>
        </div>
    </body>
</html>