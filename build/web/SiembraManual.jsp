<%-- 
    Document   : SiembraManual
    Created on : 11/08/2016, 01:34:06 PM
    Author     : Administrador
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <%
           HttpSession objSession = request.getSession();
           String lote = (String) objSession.getAttribute("lote");
           String nombre = (String) objSession.getAttribute("nombre");
           objSession.setAttribute("sesion","cerrar");
          
                if(nombre == null){
                    if(lote == null){
                        response.sendRedirect("Inicio_sesion.jsp");
                    }
                }
  %>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="imagenes/favicon.ico" rel="icon"/>
        <link href="css/estiloscss.css" rel="stylesheet" type="text/css"/>
        <link href="css/general_simpca.css" rel="stylesheet" type="text/css"/>
        <script src="Js/jquery.js" type="text/javascript"></script>
        <script src="Js/javascript.js" type="text/javascript"></script>
        <title>SiembraManual</title>
    </head>
    <body class="fondo">
    <div id="toplogo">
        <h1 id="logo">
            <a href="Inicio.jsp" title="Coagronorte-Cooperativa Agropecuaria Norte de Santander"></a>
        </h1>
    </div>
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
        <img src="ImagenesR/cosecha-1.png" style="width: 100%; height: 400px; position: absolute">
        <div id="contenedor" align="center">
            <form action="SiembraManual" id="SiembraManual" method="post">
                <div id="cuerpo">
                    <h3 style="margin-left: 450px; font-size: 22px; font-family: Times New Roman;">Lote: <input type="text" name="num_lote" size="6" style="font-size: 22px; font-family: Times New Roman; width:50px; height: 30px; background: none; border:none" value="<%=lote%>" readonly="<%=lote%>"></h3>
                    <h1 style="margin-top: 50px; font-size: 28px; font-family: Times New Roman;">SIEMBRA MANUAL</h1>
                    <table border="0" style="margin-left: 270px; margin-top: 40px; font-family: Times New Roman; font-size: 20px;">
                        <tr>
                            <td><b>Fecha:</b></td>
                            <td style="width: 90px;"><input style="font-size: 16px; font-family: Times New Roman;" class="textbox-f-tM" type="date" name="fecha"></td>
                        </tr>
                    </table>
                    <table border="0"  style="font-size: 20px; font-family: Times New Roman; text-align: left; width: 340px; height: 180px; margin-left: 30px; margin-top: 50px;">
                        <tr>
                            <td style="margin-right: -12%; width: 180px;">Variedad Semilla:</td>
                            <td><select style="font-size: 16px; font-family: Times New Roman;" class="textbox" name="semilla">
                                    <option name="semilla" value="seleccione">Seleccione</option>
                                    <option name="semilla" value="369">369</option>
                                    <option name="semilla" value="733">733</option>
                                    <option name="semilla" value="Caribe 8">Caribe 8</option>
                                    <option name="semilla" value="Colombia 21">Colombia 21</option>
                                    <option name="semilla" value="Clearafil">Clearfil</option>
                                    <option name="semilla" value="F 50">F 50</option>
                                    <option name="semilla" value="F 60">F 60</option>
                                    <option name="semilla" value="F 100">F 100</option>
                                    <option name="semilla" value="FedeArroz 2000">FedeArroz 2000</option>
                                    <option name="semilla" value="Garapato">Garapato</option>
                                    <option name="semilla" value="Pati Morado">Pati Morado</option>
                                    <option name="semilla" value="Orizica 1">Orizica 1</option>
                                    <option name="semilla" value="Orizica 2">Orizica 2</option>
                                    <option name="semilla" value="Orizica 3">Orizica 3</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                                <td>
                                <p>Costo Semilla</p>
                            </td>
                            <td style="width: 150px;">
                                <input type="text" class="textbox" name="costo_semilla" id="costo_semilla" size="10" onkeyup="calcularTotalSiembra(this); format(this)" onchange="format(this)">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p>Costo Transporte</p>
                            </td>
                            <td>
                                <input type="text" class="textbox" name="costo_transporte" id="costo_transporte" size="10" onkeyup="calcularTotalSiembra(this); format(this)" onchange="format(this)">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p>Costo Secado</p>
                            </td>
                            <td>
                                <input type="text" class="textbox" name="costo_secado" id="secado_semilla" size="10" onkeyup="calcularTotalSiembra(this); format(this)" onchange="format(this)">
                            </td>
                        </tr>
                </table>
                    
                    <div id="TablaS">
                        <table border="0"  style="font-size: 20px; font-family: Times New Roman; text-align: left; width: 340px; height: 130px; margin-left: 30px; margin-top: 50px;">
                        <tr>
                            <td style="width: 178px;">
                                <p></p>
                                <p>Cantidad de Bultos</p>
                            </td>
                            <td><input type="text" class="textbox" name="cantidad_bultos" id="cantidad_bulto" size="10"  onkeyup="calcularTotalSiembra(this);"></td>
                        </tr>
                        <tr>
                            <td>
                                <p></p>
                                <p>Precio por Bulto</p>
                            </td>
                            <td><input type="text" class="textbox" name="precio_bulto" id="precio_bulto" size="10" onkeyup="calcularTotalSiembra(this); format(this)" onchange="format(this)" /></td>
                        </tr>
                        <tr>
                            <td>
                                <p></p>
                                <p>Pago Total Obreros</p>
                            </td>
                            <td>
                                <input type="text" class="textbox" name="total_obreros" style="background-color: #CCC;" id="total_obreros" readonly="readonly" onkeyup="calcularTotalSiembra(this);" onkeyup="format(this); calcularTotalObreros()">
                            </td>
                        </tr>
                        </table>
                        
                        
                        <table border="0" style="font-size: 20px; font-family: Times New Roman; margin-left: 390px; margin-top: -37px;">
                            <tr>
                                <td style="width: 180px;">
                                <p>Valor Total</p>
                             </td>
                             <td>
                                 <input type="text" class="textbox" style="background-color: #CCC;" name="total_siembra" readonly="readonly" id="total_siembra" onkeyup="format(this)" onchange="calcularTotalSiembra(this); format(this)"/>
                             </td>
                        </tr>
                        </table>
                    </div>
                    <div id="Total">
                        <table border="0" id="tablabotones" width="400" heigh="20" align="center">
                        <tr>
                        
                            <td>
                                <a href="SiembraManual.jsp" width="203">
                                    <input  style="height: 20px; cursor: pointer;"type="button" name="slider"></a>
                                <a href="SiembraMecanizada.jsp" width="200">
                                    <input style="height: 20px;cursor: pointer;" type="button" name="slider"></a>
                            </td>
                        </tr>    
                    </table>
                        <div style="margin-left: 1%;">
                        <table border="0"  style="font-size: 18px; font-family: Times New Roman;" id="tablanombres" width="352" height="50" >
                          <tr> 
                            <div style="margin-left: -11%;">
                            <td width="200" align="center">Siembra Manual</td>
                            <td width="200" align="center">Siembra Mecanizada</td>
                            </div>
                          </tr>
                    </table>
                        </div>
                        <div class="cont-inputs" aling="center" style="margin-left: -190px; margin-top: -20px;">
                            <input style="font-family: Times New Roman;" type="button"  onclick="VentanaEmergente()" class="agregar-insumo" value="GUARDAR"/>
                            <input style="font-family: Times New Roman;" name="cerrar"  type="button" class="agregar-insumo" value="CERRAR" onclick="location.href = 'cosecha.jsp'"/>
                        </div>
                </div>     
            </form>
        </div>
    </div>
            <footer>
                <!--Pie de Pagina-->
                <div id="pie_paginaSM" align="center">
                </div>
            </footer> 
    </body>
</html>
