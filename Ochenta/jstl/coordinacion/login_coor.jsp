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
    <title>Login Coordinación</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #f8bbd0, #f0e68c, #b2dfdb, #ffccbc);
            background-size: cover;
            height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-container {
            max-width: 400px;
            width: 100%;
            padding: 30px;
            background-color: #fff;
            border-radius: 15px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
        }

        h3 {
            font-weight: bold;
            color: #f48fb1;
        }

        .input-field {
            position: relative;
            margin-bottom: 20px;
        }

        .input-field input {
            border: 1px solid #ddd;
            border-radius: 30px;
            padding: 12px 15px 12px 40px;
            width: 100%;
            font-size: 16px;
            background-color: #fff8e1;
        }

        .input-field span {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #4db6ac;
        }

        .btn-primary {
            background-color: #ffb74d;
            border-color: #ffb74d;
            border-radius: 30px;
            padding: 12px;
            font-size: 18px;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #ff8a65;
            border-color: #ff8a65;
        }

        .alert-msg {
            background-color: #ffe0b2;
            border-color: #ffcc80;
            color: #e65100;
            border-radius: 10px;
            padding: 10px;
            text-align: center;
            margin-bottom: 15px;
        }

        .navbar {
            background-color: #b2dfdb;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }

        .nav-link {
            color: #fff;
            font-weight: bold;
        }
    </style>
</head>


<body>
<div class="demo-container">
        <div class="container">
            <br><br>
            <nav class="navbar navbar-expand-sm  navbar-dark fixed-top">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                <button id="boton2" class="btn btn-outline-primary rounded-pill" type="button" onclick="location.href='../../index.html'">Regresar al menu</button>
                </li>
            </ul>
        </nav>
    <div class="login-container">
        <div class="text-center image-size-small position-relative">
            <div class="icon-camera">
                <a href="" class="text-primary"><i class="lni lni-camera"></i></a>
            </div>
        </div>
        <h3 class="mb-2 text-center pt-3">Ingrese el usuario y contraseña para las tareas</h3>
        <form method="post">
            <div class="form-group">
                <label class="font-500">Usuario</label>
                <div class="input-field">
                    <span class="far fa-user p-2"></span>
                    <input name="coor_cedula" class="form-control form-control-lg" type="text" placeholder="Digita el codigo" required>
                </div>
            </div>
            <div class="form-group">
                <label class="font-500">Contraseña</label>
                <div class="input-field">
                    <span class="fas fa-lock px-2"></span>
                    <input name="coor_contra" class="form-control form-control-lg" type="password" placeholder="Digita tu clave" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$" title="La contraseña debe tener al menos 8 caracteres y contener al menos una letra minúscula, una letra mayúscula y un número." required>
                </div>
            </div>
            <button class="btn btn-primary btn-lg w-100 shadow-lg">INICIA SESIÓN</button>
        </form>
        <div class="bordert"></div>
    </div>

    <c:if test="${param.coor_cedula != null}">
        <sql:query sql="SELECT * FROM coordinacion WHERE coor_cedula=? AND coor_contra=?" var="rsCoordinacion" dataSource="${parcialjstl}">
            <sql:param value="${param.coor_cedula}" />
            <sql:param value="${param.coor_contra}" />
        </sql:query>
        <c:if test="${not empty rsCoordinacion.rows}">
            <c:redirect url="principal_coor.jsp" />
        </c:if>
        <c:if test="${empty rsCoordinacion.rows}">
            <script>
                alert("Credenciales no válidas. Por favor, verifica la información ingresada.");
            </script>
        </c:if>
    </c:if>
</body>

</html>
