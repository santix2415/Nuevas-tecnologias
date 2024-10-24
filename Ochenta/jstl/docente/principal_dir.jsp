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
            background-color: #f9f7f7;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            text-align: center; /* Centrando todo el contenido */
        }

        .container-fluid {
            padding-top: 80px;
            display: flex;
            justify-content: center; /* Centrando los módulos */
            flex-wrap: wrap;
        }

        .navbar {
            background-color: #98c1d9;
            padding: 15px 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .navbar-brand {
            font-size: 1.5rem;
            color: #fff !important;
        }

        .navbar-dark .navbar-nav .nav-link {
            color: #fff;
            font-weight: bold;
        }

        .navbar-dark .navbar-nav .nav-link:hover {
            color: #ffafcc;
        }

        .header {
            margin-bottom: 40px;
            text-align: center;
            color: #343a40;
        }

        .header h1 {
            font-size: 2.5rem;
            font-weight: bold;
            margin-bottom: 10px;
            color: #5e6472;
        }

        .header p {
            font-size: 1.2rem;
            color: #6c757d;
        }

        .module {
            display: inline-block;
            margin: 20px;
            padding: 20px;
            text-align: center;
            border-radius: 15px;
            overflow: hidden;
            background-color: #ffddd2;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            width: 230px;
            border: 2px solid #b8b8b8; /* Borde oscuro */
        }

        .module:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }

        .module img {
            width: 120px;
            height: 120px;
            margin-bottom: 15px;
            border-radius: 50%;
            border: 2px solid #d4a5a5;
        }

        .module h2 {
            font-size: 1.3rem;
            margin-top: 10px;
            font-weight: bold;
        }

        .module a {
            text-decoration: none;
            color: inherit;
        }

        .module a:hover {
            text-decoration: none;
        }

        /* Colores pastel diferentes para las tarjetas */
        .module.estudiante {
            background-color: #ffafcc; /* Rosa pastel */
        }

        .module.calendario {
            background-color: #98c1d9; /* Azul pastel */
        }

        /* Centrando los elementos dentro de las tarjetas */
        .module {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        /* Botón de salir con colores pastel */
        .btn-danger {
            background-color: #f67280;
            border: none;
            border-radius: 50px;
            padding: 10px 20px;
        }

        .btn-danger:hover {
            background-color: #c06c84;
        }
    </style>

</head>

<body>
    <nav class="navbar navbar-expand-sm navbar-dark fixed-top">
        <h1>Docente Principal</h1>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link btn btn-danger" href="../../index.html">Salir</a>
            </li>
        </ul>
    </nav>

    <div class="container-fluid">
        <div class="module estudiante">
            <a href="../docente/docenteDirector.jsp/mostrarCalificacion.jsp">
                <img src="../../img/lupa.png" alt="Calificación de Anteproyectos">
                <h2>CALIFICACIONES</h2>
            </a>
        </div>

        

       
    </div>
</body>

</html>
