<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ include file="../../../WEB-INF/jspf/conexion.jspf" %>
<%@ page pageEncoding="UTF-8" %>

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
            background-color: #f4f6f9;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container-fluid {
            padding-top: 80px;
        }

        .navbar {
            background-color: #007bff;
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
            color: #ffcccb;
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
            border-radius: 10px;
            overflow: hidden;
            background-color: #fff;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            width: 230px;
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
        }

        .module h2 {
            font-size: 1.3rem;
            margin-top: 10px;
            color: #007bff;
            font-weight: bold;
        }

        .module a {
            text-decoration: none;
            color: inherit;
        }

        .module a:hover {
            text-decoration: none;
        }
    </style>
</head>

<body>

    <nav class="navbar navbar-expand-sm navbar-dark fixed-top">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link btn btn-danger" href="../principal_coor.jsp">Salir</a>
            </li>
        </ul>
    </nav>

    <div class="container-fluid">
        <div class="module estudiante">
            <a href="../informes/informeEstudiante.jsp">
                <img class="img" src="../../../img/estudiante.png" alt="Estudiante">
                <h2>INFORME ESTUDIANTE</h2>
            </a>
        </div>

        <div class="module docente">
            <a href="../informes/informeDirector.jsp">
                <img class="img" src="../../../img/coord.png" alt="Director">
                <h2>INFORME DIRECTOR</h2>
            </a>
        </div>

        <div class="module docente">
            <a href="../informes/informeEvaluador.jsp">
                <img class="img" src="../../../img/documento.png" alt="Evaluador">
                <h2>INFORME EVALUADOR</h2>
            </a>
        </div>
    </div>

</body>

</html>
