<%-- 
    Document   : preparacion_de_lotes
    Created on : 12/08/2016, 01:14:10 PM
    Author     : Aprendiz: Deiby Brayan Diaz R. ADSI 954687
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.ArrayList"%>
<script src="Js/jquery.js" type="text/javascript"></script>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        HttpSession objSession = request.getSession();
        String lote = (String) objSession.getAttribute("lote");
        String nombre = (String) objSession.getAttribute("nombre");
        objSession.setAttribute("sesion", "cerrar");

        if (nombre == null) {
            if (lote == null) {
                response.sendRedirect("Inicio_sesion.jsp");
            }
        }
    %>


    <head>
        <link href="css/consultas-table.css" rel="stylesheet" type="text/css"/>
        <link href="css/css1(Quema fisica).css" rel="stylesheet" type="text/css"/>
        <link href="imagenes/favicon.ico" rel="icon"/>
        <script src="Js/FuncionesQuemaFisica.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1.0, mninimun-scale=0">

        <title>Corta Granel</title>
    </head>
    <img src="ImagenesR/Sesion-1.png" style="width: 100%; height: 400px; position: absolute;z-index: -10;">
    <body class="fondoC">
        <header>
            <section>
                <nav>
                    <ul>
                        <li><a href="#">Coagronorte</a>
                        <li><a href="#">Productos</a>
                        <li><a href="#">Servicios</a>
                        <li><a href="#">Blog</a>
                        <li><a href="#">Contacto </a>
                        <li><a href="#"><%=nombre%></a>
                        <li><a href="Session">Cerrar Sesion</a> 
                    </ul>
                </nav>
            </section>
        </header>

        <div style="background: RGBA(245,178,53,0.2); border: solid;border-width: 1px; width: 90%; height:auto;
              border-radius: 50px; margin-top: 120px; margin-left: 60px; padding: 20px;">                         
            <div style="text-align: center; margin-top: 20px; padding: 20px;">
                <h3 style="font-size: 22px; font-family: Times New Roman; margin-left:450px;"><b>Lote: </b><input type="text" name="num_lote" size="6" style="width:50px; text-align: center; height: 30px; font-size: 20px; font-family: Times New Roman; background: none; border:none" value="<%=lote%>" readonly="<%=lote%>"></h3>
                <h1 style="font-size: 32px; font-family: Times New Roman;">CORTA POR GRANEL</h1>
            </div>
                <div style="text-align: center; padding: 10px;">
                <h1 style="font-size: 28px; font-family: Times New Roman;">COSTO DE MÁQUINA LLANTA</h1>
            </div>
            <div class="container">
                <div class="table" style="margin-left: -65px;" >
                    <div >
                        <form action="EliminarConsultas" name="EliminarConsultas" method="post" id="EliminarConsultas">
                            <input type="hidden" id="op" name="op" value=""/>
                            <input type="text" name="num_lote" hidden="" value="<%=lote%>">
                        <table class="table  table-hover table-bordered table-condensed" style="font-size: 18px; font-family: Times New Roman;">
                            <tr class="active">
                                <th></th>
                                <th>Fecha</th>
                                <th>Cantidad</th>
                                <th>Valor Unidad</th>
                                <th>Valor Total</th>
                            </tr>
                        <c:forEach items="${ListaCortaGranel}" var="Lista">
                            <tr>
                                <td><input type="radio" name="id" id="id_${Lista.id_crg}" value="${Lista.id_crg}"/></td>
                                <td>${Lista.fecha_crg}</td>
                                <td>${Lista.cantidad_mq_llanta_crg}</td>
                                <td>${Lista.valor_mq_llanta_crg}</td>
                                <td>${Lista.valor_total_mq_llanta_crg}</td>
                                <td><input style="background-color: rgb(254, 177, 0); color: white; width: 80%; border-radius: 5px; border-color: rgb(255, 197, 0);" type="button" value="Eliminar" onclick="eliminar()"></td>
                            </tr>
                        </c:forEach>
                        </table> 
                        </form>
                    </div>
                </div>
            </div>
            <div style="text-align: center; padding: 20px;">
                <h1 style="font-size: 28px; font-family: Times New Roman;">COSTO DE MÁQUINA ORUGA</h1>
            </div>
            <div class="container">
                <div class="table"  style="margin-left: -65px;" >
                    <table class="table  table-hover table-bordered table-condensed" style="font-size: 18px; font-family: Times New Roman;">
                        <tr class="active">
                          <th>Cantidad</th>
                          <th>Valor Unidad</th>
                          <th>Valor Total</th>
                        </tr>
                    <c:forEach items="${ListaCortaGranel}" var="Lista">
                        <tr>
                            <td>${Lista.cantidad_mq_oruga_crg}</td>
                            <td>${Lista.valor_mq_oruga_crg}</td>
                            <td>${Lista.valor_total_mq_oruga_crg}</td> 
                        </tr>
                    </c:forEach>
                    </table>
                </div>
            </div>
            <div style="text-align: center; padding: 20px;">
                <h1 style="font-size: 28px; font-family: Times New Roman;">COSTOS DE FLETE</h1>
            </div>
            <div class="container">
                <div class="table"  style="margin-left: -65px;" >
                    <table class="table  table-hover table-bordered table-condensed" style="font-size: 18px; font-family: Times New Roman;">
                        <tr class="active">
                            <th>Cantidad</th>
                            <th>Valor Unidad</th>
                            <th>Valor Total</th>
                        </tr>
    
                        <c:forEach items="${ListaCortaGranel}" var="Lista">
                            <tr>
                                <td>${Lista.cantidad_flete_crg}</td> 
                                <td>${Lista.valor_flete_crg}</td>
                                <td>${Lista.valor_total_flete_crg}</td>
                            </tr>   
                        </c:forEach>
                    </table>
                </div>
            </div>
                <div style="text-align: center; padding: 20px;">
                <h1 style="font-size: 28px; font-family: Times New Roman;">COSTOS ADICIONALES</h1>
            </div>
            <div class="container">
                <div class="table"  style="margin-left: -65px;" >
                    <table class="table  table-hover table-bordered table-condensed" style="font-size: 18px; font-family: Times New Roman;">
                      <tr class="active">
                        <th>Valor Alimentación</th>
                        <th>Valor Celaduría Máquina</th>
                        <th>Valor Administración</th>
                        <th>Valor Total</th>
                      </tr>
            <c:forEach items="${ListaCortaGranel}" var="Lista">
                
                <tr>
                    <td>${Lista.valor_celaduria_maquina_crg}</td>
                    <td>${Lista.valor_alimentacion_crg}</td>
                    <td>${Lista.valor_administracion_crg}</td>
                    <td>${Lista.valor_total_crg}</td>
                </tr>
            </c:forEach>
                    </table>
                </div>
            </div>
            <div align="center">
                <form style="margin-left: -300px;" action="DetallesTotal" method="post">
                    <input type="text" name="num_lote" hidden="" value="<%=lote%>"><font>
                    <input style="font-size: 14px; font-family: Times New Roman;" class="agregar-insumoC" type="submit" value="VOLVER">
                </form>
                <form name="formulario_reporte_cortaGranel" target="_blank" style="margin-top: -120px; margin-left: 300px; width: 100%;" action="ReporteCortaGranel" method="POST">
                    <input type="text" name="num_lote" hidden="" value="<%=lote%>">
                    <font>
                    <input style="font-size: 14px; font-family: Times New Roman;" class="agregar-insumoC" type="button" onclick="redireccionar()" target="_blank" value="GENERAR PDF">
                    
                </form>
            </div>
        </div>

    </body>
<script type="text/javascript">
    function redireccionar(){
        document.formulario_reporte_cortaGranel.submit();
    }
    
        function eliminar(){
            if($('input[name="id"]').is(':checked')){
                if(confirm("¿Esta seguro de eliminar el registro?")){
                    $("#op").val("eliminarCortaGranel");
                    $("#EliminarConsultas").submit();
                }
            }else{
                alert("Debe seleccionar un registro del listado");
            }
        }
    </script>
</html>
