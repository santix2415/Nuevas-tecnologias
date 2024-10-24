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
    <title>Login Docentes</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

       <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(to right, #a8e6cf, #dcedc1, #ffd3b6, #ffaaa5);
            background-size: cover;
            background-position: center;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-container {
            max-width: 400px;
            width: 100%;
            padding: 20px;
            background-color: #fff;
            border-radius: 15px;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.15);
            transition: all 0.3s ease;
        }

        .login-container:hover {
            box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.2);
        }

        h3 {
            color: #6b705c;
        }

        .input-field {
            border-radius: 10px;
            padding: 10px;
            display: flex;
            align-items: center;
            border: 1px solid #ddd;
            margin-bottom: 20px;
            background-color: #fafafa;
            transition: background-color 0.3s;
        }

        .input-field:hover {
            background-color: #f0efeb;
        }

        input[type='text'],
        input[type='password'] {
            border: none;
            outline: none;
            box-shadow: none;
            width: 100%;
            padding-left: 10px;
            font-size: 1rem;
            color: #495057;
        }

        select {
            padding: 10px;
            border-radius: 10px;
            border: 1px solid #ddd;
            width: 100%;
            margin-bottom: 20px;
            color: #495057;
        }

        .btn-primary {
            background-color: #ff8b94;
            border: none;
            font-size: 1.2rem;
            border-radius: 15px;
            padding: 12px;
            width: 100%;
            transition: background-color 0.3s;
        }

        .btn-primary:hover {
            background-color: #ffaaa5;
        }

        .navbar {
            background-color: #f7ede2;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }

        .navbar button {
            color: #495057;
            background-color: #bde0fe;
            border: 1px solid #495057;
            transition: background-color 0.3s;
        }

        .navbar button:hover {
            background-color: #a2d2ff;
        }
    </style>

</head>

<body>
    <div class="demo-container">
        <div class="container">
            <nav class="navbar navbar-expand-sm  navbar-dark fixed-top">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                <button id="boton2" class="btn btn-outline-primary rounded-pill" type="button" onclick="location.href='../../index.html'">Regresar al menu</button>
                </li>
            </ul>
        </nav>
            <div class="row">
                <div class="col-lg-15 col-12 mx-auto">
                    <div class="text-center image-size-small position-relative">
                       
                        <div class="icon-camera">
                            <a href="" class="text-primary"><i class="lni lni-camera"></i></a>
                        </div>
                    </div>
                    <div class="p-5 bg-white rounded shadow-lg">
                        <h3 class="mb-2 text-center pt-3">Bienvenido Docente</h3>

                        <form>

                            <div class="form-group">
                                <label class="font-500">Usuario</label>
                                <div class="input-field"> <span class="far fa-user p-2"></span>
                                    <input name="doc_cedula" class="form-control form-control-lg " type="text" required>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="font-500">Contrasena</label>
                                <div class="input-field"><span class="fas fa-lock px-2"></span>
                                    <input name="doc_contra" class="form-control form-control-lg" type="password" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$"
                            title="La contraseña debe tener al menos 8 caracteres y contener al menos una letra minúscula, una letra mayúscula y un número." required>
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="font-500">Rol</label>
                                    <select name="rol" class="form-control" required>
                                        <option value="" disable>--Selecciona--</option>
                                        <option value="director">Principal</option>
                                        <option value="evaluador">Remplazo</option>
                                    </select>
                            </div>

                            <button type="submit" class="btn btn-primary btn-lg w-100 shadow-lg">INICIA SESIÓN</button>
                        </form>
                        
                        
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



<c:if test="${param.doc_cedula != null}">
    <sql:query sql="SELECT * FROM docentes WHERE doc_cedula=? AND doc_contra=? AND rol=?" var="rsDocente" dataSource="${parcialjstl}">
        <sql:param value="${param.doc_cedula}"/>
        <sql:param value="${param.doc_contra}"/>
        <sql:param value="${param.rol}"/>
    </sql:query>

    <c:choose>
        <c:when test="${param.rol == 'director'}">
            <c:if test="${not empty rsDocente.rows and rsDocente.rows[0].rol == 'director'}">
                <c:redirect url="principal_dir.jsp"/>
            </c:if>
            <c:if test="${empty rsDocente.rows or rsDocente.rows[0].rol == 'evaluador'}">
                <script>
                    alert("Usuario o Contraseña Incorrecta");
                </script>
            </c:if>
        </c:when>
        <c:when test="${param.rol == 'evaluador'}">
            <c:if test="${not empty rsDocente.rows and rsDocente.rows[0].rol == 'evaluador'}">
                <c:redirect url="principal_eval.jsp"/>
            </c:if>
            <c:if test="${empty rsDocente.rows or rsDocente.rows[0].rol == 'director'}">
                <script>
                    alert("Usuario o Contraseña Incorrecta");
                </script>
            </c:if>
        </c:when>
        <c:otherwise>
            <script>
                alert("Usuario o Contraseña Incorrecta");
            </script>
        </c:otherwise>
    </c:choose>
</c:if>


</body>
</html>