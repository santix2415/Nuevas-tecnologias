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
        <title>Actualizar Docentes</title>

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
                    SELECT * FROM docentes where id=?
                    <sql:param value="${param.id}">
                    </sql:param>
                </sql:query>
                    <form method=post>
                        <c:forEach var="itema" items="${universidad.rows}">
                            <input type="hidden" name="id" id="id" class="form-control" value="${itema.id}">

                            <h1 class="titulo">Actualizacion de Datos de los Docentes</h1>
                    <fieldset>
                        <legend><span class="number">1</span> INFORMACION PERSONAL</legend>
                        <div class="form-group">
                        <label for="nombre">Nombre:</label>
                        <input type="text" class="form-control" required id="doc_nombre" name="doc_nombre" placeholder="Ingrese su nombre" value="${itema.doc_nombre}" minlength="3" maxlength="30" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+">
                        </div>

                        <div class="form-group">
                        <label for="apellido">Apellido:</label>
                        <input type="text" class="form-control" required id="doc_apellidos" name="doc_apellidos" placeholder="Ingrese su apellido" value="${itema.doc_apellidos}" minlength="3" maxlength="30" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+">
                        </div>

                        <div class="form-group">
                        <label for="correo">Email:</label>
                        <input type="email" class="form-control" required id="doc_email" name="doc_email" placeholder="Ingrese su correo electrónico" value="${itema.doc_email}" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" maxlength="50" autocomplete="on">
                        </div>

                        <div class="form-group">
                        <label for="cedula">Número cédula:</label>
                        <input type="text" class="form-control" required id="doc_cedula" name="doc_cedula" placeholder="Ingrese su número de cédula" value="${itema.doc_cedula}" pattern="[0-9]{10}" minlength="6" maxlength="10"
                        title="Ingrese los 10 dígitos de su cédula sin guiones ni espacios">
                        </div>

                        <div class="form-group">
                        <label for="contra">Contraseña:</label>
                        <input type="password" class="form-control" required id="doc_contra" name="doc_contra" 
                            placeholder="Ingrese su contraseña" value="${itema.doc_contra}" 
                            pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$"
                            title="La contraseña debe tener al menos 8 caracteres y contener al menos una letra minúscula, una letra mayúscula y un número.">
                        </div>


                        <div class="form-group">
                        <label for="telefono">Número de contacto:</label>
                        <input type="tel" class="form-control" required id="doc_telefono" name="doc_telefono" placeholder="Ingrese su número de contacto" value="${itema.doc_telefono}" pattern="[0-9]{10}" minlength="6" maxlength="10" title="Ingrese los 10 dígitos de su cédula sin guiones ni espacios">
                        </div>

                        <div class="form-group">
                        <label for="doc_direccion">Dirección:</label>
                        <input type="text" class="form-control" id="doc_direccion" minlength="5" maxlength="100" name="doc_direccion" value="${itema.doc_direccion}" placeholder="Ingrese su número de direccion de residencia" required>
                        </div>

                        


                        <legend><span class="number">2</span> INFORMACION</legend>
                        
                        
                        <div class="form-group">
                        <label for="doc_nivel">Nivel de Educación:</label>
                        <select class="form-control" id="doc_nivel" name="doc_nivel" required>
                            <option value="Pregrado" ${itema.doc_nivel == "Pregrado" ? 'selected' : ''}>Pregrado</option>
                            <option value="Especializacion" ${itema.doc_nivel == "Especializacion" ? 'selected' : ''}>Especialización</option>
                            <option value="Maestria" ${itema.doc_nivel == "Maestria" ? 'selected' : ''}>Maestría</option>
                            <option value="Doctorado" ${itema.doc_nivel == "Doctorado" ? 'selected' : ''}>Doctorado</option>
                        </select>
                        </div>

                        <label>Jornada:</label>
                        <div class="form-check">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" id="doc_jornada_diurna" name="doc_jornada" value="Diurna" ${itema.doc_jornada == 'Diurna' ? 'checked' : ''} required>Diurna &nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" class="form-check-input" id="doc_jornada_nocturna" name="doc_jornada" value="Tarde" ${itema.doc_jornada == 'Tarde' ? 'checked' : ''} required>Tarde
                        </label>
                        </div>
                            <br>

                        <br>
                        <label>Materia:</label>
                        <div class="form-check">
                        <label class="form-check-label">
                                <input type="text" class="form-control" required id="doc_facultad" name="doc_facultad" placeholder="Ingrese la materia" value="${fila.doc_nombre}" minlength="3" maxlength="30" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+">
                        </label>
                        </div>
                        <br>


                            <br>


                    </fieldset>
                            <button type="submit" class="btn btn-success btn-block" value="Actualizar">Guardar</button>
                            <input type="hidden" name="modifica" value="SI">
                        </c:forEach>
                    </form>
                    
            </c:if>
        

        <c:if test="${param.modifica != null}" >
        <sql:update var="result" dataSource="${parcialjstl}">
            update docentes
            set doc_cedula ='${param.doc_cedula}',
            doc_nombre = '${param.doc_nombre}',
            doc_apellidos = '${param.doc_apellidos}',
            doc_email = '${param.doc_email}',
            doc_telefono = '${param.doc_telefono}',
            doc_direccion = '${param.doc_direccion}',
            doc_nivel = '${param.doc_nivel}',
            doc_jornada = '${param.doc_jornada}',
            doc_facultad = '${param.doc_facultad}',
            doc_contra = '${param.doc_contra}'
            WHERE id = ${param.id};
        </sql:update>

            <c:if test="${result == 1 }">
                <script>
                    alert("Registro actualizado correctamente!");
                    window.location.href = "mostrarDocentes.jsp";
                </script>
            </c:if>
            <c:if test="${result == 0}">
                <script>
                    alert("No se actualizaron los datos del Docente");
                    window.location.href = "mostrarDocentes.jsp";
                </script>
            </c:if>
        </c:if>
        </div>
        <br><br>
    </body>
</html>