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
    <title>Login Docente</title>
    
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
        <header>
        <nav class="navbar navbar-expand-sm fixed-top ">
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    
                </li>
                </ul>
                <ul class="navbar-nav">
                    <li class="nav-item">
                    <a class="nav-link btn btn-outline-primary rounded-pill" href="../../index.html" >Regresar</a>
                    </li>
                </ul>
                </div>
        </nav>
    </header>
            <div class="p-5 bg-white rounded shadow-lg" style="max-width: 400px;">
    <h3 class="mb-4 text-center">Bienvenido Administrador</h3>

    <form class="login100-form validate-form">

        <div class="form-group">
            <label class="font-500">Usuario</label>
            <div class="input-field rounded-pill">
                <span class="far fa-user p-2"></span>
                <input name="admin_cedula" class="form-control form-control-lg rounded-pill" type="text" placeholder="Digite su cedula" required>
            </div>
        </div>

        <div class="form-group">
            <label class="font-500">Contraseña</label>
            <div class="input-field rounded-pill">
                <span class="fas fa-lock px-2"></span>
                <input name="admin_contra" class="form-control form-control-lg rounded-pill" type="password" placeholder="Digite su contraseña" required pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$" title="La contraseña debe tener al menos 8 caracteres y contener al menos una letra minúscula, una letra mayúscula y un número.">
            </div>
        </div>

        <button class="btn btn-primary btn-lg btn-block shadow-lg">INICIAR SESIÓN</button>
    </form>
</div>
                        
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <c:if test="${param.admin_cedula != null}">
		<sql:query sql="SELECT * FROM administrador WHERE admin_cedula=? AND admin_contra=?" var="rsAdministracion" dataSource="${parcialjstl}">
			<sql:param value="${param.admin_cedula}"/>
			<sql:param value="${param.admin_contra}"/>
		</sql:query>

        <c:if test="${not empty rsAdministracion.rows}">
            <c:redirect url="principal_admin.jsp"/>
        </c:if>

        <c:if test="${empty rsAdministracion.rows}">
            <script>
                alert("Credenciales no válidas. Por favor, verifica la información ingresada.");
            </script>
        </c:if>      
	</c:if>

</body>
</html>