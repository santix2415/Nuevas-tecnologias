<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ include file="../../WEB-INF/jspf/conexion.jspf" %>
<%@page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel Administrador</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
   
    <style>
       body {
    background-color: #f7f9fc; /* Azul claro pastel */
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    margin: 0;
    padding: 0;
}

.container-fluid {
    padding-top: 80px;
}

.navbar {
    background-color: #ffd1dc; /* Rosa pastel */
    padding: 15px 30px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.navbar-brand {
    font-size: 1.5rem;
    color: #ffffff !important;
}

.navbar-dark .navbar-nav .nav-link {
    color: #ffffff;
    font-weight: bold;
}

.navbar-dark .navbar-nav .nav-link:hover {
    color: #ffe3e3; /* Rosa más claro */
}

.header {
    margin-bottom: 40px;
    text-align: center;
    color: #4a4a4a; /* Gris oscuro */
}

.header h1 {
    font-size: 2.5rem;
    font-weight: bold;
    margin-bottom: 10px;
}

.header p {
    font-size: 1.2rem;
    color: #6c757d; /* Gris suave */
}

.module {
    display: inline-block;
    margin: 15px;
    padding: 20px;
    text-align: center;
    border-radius: 15px;
    overflow: hidden;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    width: 220px;
}

.module:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
}

.module img {
    width: 80px;
    height: 80px;
    margin-bottom: 10px;
    border-radius: 50%;
}

.module h2 {
    font-size: 1.4rem;
    margin-top: 10px;
    font-weight: bold;
    color: #4a4a4a;
}

.module a {
    text-decoration: none;
    color: inherit;
}

.module a:hover {
    text-decoration: underline;
}

/* Colores pasteles diferentes para cada módulo */
.estudiante {
    background-color: #d1f0ff; /* Azul claro */
}

.docente {
    background-color: #ffebd1; /* Naranja claro pastel */
}

.coordinacion {
    background-color: #e6f9e6; /* Verde pastel claro */
}

/* Ajustes de márgenes y espaciado */
.row {
    justify-content: center;
}

.col-md-4 {
    margin-bottom: 10px;
}

.module {
    margin: 10px 5px; /* Márgenes ajustados */
    width: 200px;
}

/* Botones */
.btn {
    border-radius: 25px;
    padding: 10px 20px;
    transition: background-color 0.3s ease, transform 0.3s ease;
}

.btn-danger {
    background-color: #f7786b;
    border: none;
    color: #ffffff;
}

.btn-danger:hover {
    background-color: #f56c5c;
    transform: translateY(-2px);
}

    </style>
</head>


<body>

    <div class="container-fluid">
        <nav class="navbar navbar-expand-sm navbar-dark fixed-top">
            <a class="navbar-brand" href="#"></a>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link btn btn-danger" href="../../index.html">Cerrar Sesión</a>
                </li>
            </ul>
        </nav>

        <div class="header">
            <h1>Bienvenido, Administrador</h1>
            <p>Seleccione una opción para gestionar los módulos del sistema escolar.</p>
        </div>

        <div class="row justify-content-center">
            <div class="col-md-2">
                <div class="module estudiante">
                    <a href="../administrador/Crud-Estudiante/mostrarEstudiante.jsp">
                        <img class="img" src="../../img/estudiante.png" alt="Administrador">
                        <h2>Gestionar Estudiantes</h2>
                    </a>
                </div>
            </div>
            <div class="col-md-2">
                <div class="module docente">
                    <a href="../administrador/Crud-Docentes/mostrarDocentes.jsp">
                        <img class="img" src="../../img/docentes.png" alt="Docente">
                        <h2>Gestionar Docentes</h2>
                    </a>
                </div>
            </div>
            <div class="col-md-2">
                <div class="module coordinacion">
                    <a href="../administrador/Crud-Coordinacion/mostrarCoordinacion.jsp">
                        <img class="img" src="../../img/coord.png" alt="Coordinación">
                        <h2>Gestionar Tareas</h2>
                    </a>
                </div>
            </div>
            
            
            
            
        </div>
    </div>

</body>

</html>
