<jsp:include page="intranetValida.jsp" />
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>
<title>Intranet Parroquia | ARPYNET </title>
</head>
<body>

<jsp:include page="intranetCabecera.jsp" />
<div class="container" style="margin-top: 4%">
<h3>Mantenimiento Matrimonio</h3>
	 <div class="col-md-23" >  
			  <form id="idFormElimina" action="eliminaCrudAutor">
			  		<input type="hidden" id="id_elimina" name="id">
			  </form>	
				
		       <form accept-charset="UTF-8"  action="consultaCrudMatrimonio" class="simple_form" id="defaultForm2"  method="post">
					<div class="row" style="height: 70px">
						<div class="col-md-2" >
								<input class="form-control" id="id_nombre_filtro"  name="filtro" placeholder="Ingrese los nombres" type="text" maxlength="30"/>
						</div>
						<div class="col-md-2" >
							<button type="submit" class="btn btn-primary" style="width: 150px">FILTRA</button>
						</div>
						<div class="col-md-2">
							<button type="button" data-toggle='modal' onclick="registrar();"  class='btn btn-success' id="validateBtnw2" style="width: 150px">REGISTRA</button>
						</div>
						<div class="col-md-4">
							<c:if test="${sessionScope.MENSAJE != null }">
									<div class="alert alert-success" id="success-alert">
							 		   <button type="button" class="close" data-dismiss="alert">x</button>
										${sessionScope.MENSAJE}				
									</div>
							</c:if>
							<c:remove var="MENSAJE"/>
						</div>
					</div>
					
					<div class="row" > 
						<div class="col-md-12" >
								<div class="content" >
						
									<table id="tableAutor" class="table table-striped table-bordered" >
										<thead>
											<tr>
												<th>ID</th>
												<th>Numero Libro</th>
												<th>Numero Folio</th>
												<th>Numero Partida</th>
												<th>Nombre parroquia</th>
												<th>Nombre esposo</th>
												<th>Apellido esposo</th>
												<th>Fecha Nacimiento esposo</th>
												<th>Lugar Nacimiento esposo</th>
												<th>Fecha bautismo esposo</th>
												<th>Parroquia de bautismo esposo</th>
												<th>Nombre esposa</th>
												<th>Apellido esposa</th>
												<th>Fecha Nacimiento esposa</th>
												<th>Lugar Nacimiento esposa</th>
												<th>Fecha bautismo esposa</th>
												<th>Parroquia de bautismo esposa</th>
												<th>Fecha matrimonio</th>
												<th>Ministro asistente</th>
												<th>Padrino</th>
												<th>Madrina</th>
												<th>Testigos</th>
												<th>Anotaciones</th>
												
												<th>Actualiza </th>
												<th>Elimina </th>
											</tr>
										</thead>
											<tbody>
												    
												<c:forEach items="${sessionScope.matrimonio}" var="x">
													<tr>
														<td>${x.idmatrimonio}</td>
														<td>${x.numlibro}</td>
														<td>${x.numfolio}</td>
														<td>${x.numpartida}</td>
														<td>${x.nombreparroquia}</td>
														<td>${x.nomEsposo}</td>
														<td>${x.apeEsposo}</td>
														<td>${x.fechacimientoesposo}</td>
														<td>${x.lugarnacimientoesposo}</td>
														<td>${x.fechacimientoesposo}</td>
														<td>${x.parroquiabautismoesposo}</td>
														<td>${x.nomEsposa}</td>
														<td>${x.apeEsposa}</td>
														<td>${x.fechacimientoesposa}</td>
														<td>${x.lugarnacimientoesposa}</td>
														<td>${x.fechautismoesposa}</td>
														<td>${x.parroquiabautismoesposa}</td>
														<td>${x.fechamatrimonio}</td>
														<td>${x.ministroasistente}</td>
														<td>${x.padrino}</td>
														<td>${x.madrina}</td>
														<td>${x.testigos}</td>
														<td>${x.anotacionesmarg}</td>
													
										
														<td>
															<button type='button' data-toggle='modal' onclick="editar('${x.idmatrimonio}','${x.numlibro}','${x.numfolio}','${x.numpartida}','${x.nombreparroquia}','${x.nomEsposo}','${x.apeEsposo}','${x.fechacimientoesposo}','${x.lugarnacimientoesposo}','${x.fechabautismoesposo}','${x.parroquiabautismoesposo}','${x.nomEsposa}','${x.apeEsposa}','${x.fechacimientoesposa}','${x.lugarnacimientoesposa}','${x.fechautismoesposa}','${x.parroquiabautismoesposa}','${x.fechamatrimonio}','${x.ministroasistente}','${x.padrino}','${x.madrina}','${x.testigos}','${x.anotacionesmarg}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>
																<img src='images/edit.gif' width='auto' height='auto' />
															</button>
														</td>
														<td>
															<button type='button' data-toggle='modal' onclick="eliminar('${x.idmatrimonio}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>
																<img src='images/delete.gif' width='auto' height='auto' />
															</button>
														</td>
													</tr>
												</c:forEach>
										</tbody>
										</table>	
									
								</div>	
						</div>
					</div>
		 		</form>
		  </div>
	
	
	 <div class="modal fade" id="idModalRegistra" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de Matrimonio</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_registra" accept-charset="UTF-8" action="registraActualizaCrudMatrimonio" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos del Matrimonio</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                   
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_apaterno">Numero de Libro</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_apaterno" name="numlibro" placeholder="Ingrese el apellido paterno" type="text" />
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_apaterno">Numero Folio</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_apaterno" name="numfolio" placeholder="Ingrese el apellido paterno" type="text" />
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_apaterno">Numero partida</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_apaterno" name="numpartida" placeholder="Ingrese el apellido paterno" type="text" />
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_nombres">Nombre de Parroquia</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_nombres" name="nombreparroquia" placeholder="Ingrese los nombres" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_apaterno">Nombre Esposo</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_apaterno" name="nomEsposo" placeholder="Ingrese el apellido paterno" type="text" />
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_apaterno">Apellido Esposo</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_apaterno" name="apeEsposo" placeholder="Ingrese el apellido paterno" type="text" />
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_apaterno">Fecha nacimiento esposo</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_apaterno" name="fechacimientoesposo" placeholder="Ingrese el apellido paterno" type="date" />
		                                        </div>
		                                    </div>
		                                   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_apaterno">Lugar nacimiento esposo</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_apaterno" name="lugarnacimientoesposo" placeholder="Ingrese el apellido paterno" type="text" />
		                                        </div>
		                                    </div>    
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_amaterno">Fecha bautismo esposo</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_amaterno" name="fechabautismoesposo" placeholder="Ingrese el apellido materno" type="date" maxlength="10"/>
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_apaterno">Parroquia de bautismo Esposo</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_apaterno" name="parroquiabautismoesposo" placeholder="Ingrese el apellido paterno" type="text" />
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_apaterno">Nombre Esposa</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_apaterno" name="nomEsposa" placeholder="Ingrese el apellido paterno" type="text" />
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_apaterno">Apellido Esposa</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_apaterno" name="apeEsposa" placeholder="Ingrese el apellido paterno" type="text" />
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_apaterno">Fecha nacimiento esposa</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_apaterno" name="fechacimientoesposa" placeholder="Ingrese el apellido paterno" type="date" />
		                                        </div>
		                                    </div>
		                                   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_apaterno">Lugar nacimiento esposa</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_apaterno" name="lugarnacimientoesposa" placeholder="Ingrese el apellido paterno" type="text" />
		                                        </div>
		                                    </div>    
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_amaterno">Fecha bautismo esposa</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_amaterno" name="fechautismoesposa" placeholder="Ingrese el apellido materno" type="date" maxlength="10"/>
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_apaterno">Parroquia de bautismo Esposa</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_apaterno" name="parroquiabautismoesposa" placeholder="Ingrese el apellido paterno" type="text" />
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_apaterno">Fecha de matrimonio</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_apaterno" name="fechamatrimonio" placeholder="Ingrese el apellido paterno" type="date" />
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_apaterno">Ministro asistente</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_apaterno" name="ministroasistente" placeholder="Ingrese el apellido paterno" type="text" />
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_apaterno">Padrino</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_apaterno" name="padrino" placeholder="Ingrese el apellido paterno" type="text" />
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_apaterno">Madrina</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_apaterno" name="madrina" placeholder="Ingrese el apellido paterno" type="text" />
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_apaterno">Testigos</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_apaterno" name="testigos" placeholder="Ingrese el apellido paterno" type="text" />
		                                        </div>
		                                    </div>
		                                     
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_apaterno">Anotaciones</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_apaterno" name="anotacionesmarg" placeholder="Ingrese el apellido paterno" type="text" />
		                                        </div>
		                                    </div>
		 
		                                    <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
		                                        	<button type="submit" class="btn btn-primary" id="idBtnRegistra">REGISTRA</button>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        
		                    </div>
		                </form>   
				
				</div>
			</div>
		</div>
			
		</div>
		
		 <div class="modal fade" id="idModalActualiza" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza Matrimonio</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_actualiza" accept-charset="UTF-8"  action="registraActualizaCrudMatrimonio" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos del Matrimonio</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ID">ID</label>
		                                        <div class="col-lg-5">
		                                           <input class="form-control" id="id_ID" readonly="readonly" name="idmatrimonio" type="text" maxlength="8"/>
		                                        </div>
		                                     </div>
		                                        <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_num_lib">Numero de Libro</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_num_lib" name="numlibro" placeholder="Ingrese el apellido paterno" type="text" />
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_folio">Numero Folio</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_folio" name="numfolio" placeholder="Ingrese el apellido paterno" type="text" />
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_partida">Numero partida</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_partida" name="numpartida" placeholder="Ingrese el apellido paterno" type="text" />
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_parroquia">Nombre de Parroquia</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_parroquia" name="nombreparroquia" placeholder="Ingrese los nombres" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_esposo">Nombre Esposo</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_esposo" name="nomEsposo" placeholder="Ingrese el apellido paterno" type="text" />
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_apesposo">Apellido Esposo</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_apesposo" name="apeEsposo" placeholder="Ingrese el apellido paterno" type="text" />
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_naesposo">Fecha nacimiento esposo</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_naesposo" name="fechacimientoesposo" placeholder="Ingrese el apellido paterno" type="date" />
		                                        </div>
		                                    </div>
		                                   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_luesposo">Lugar nacimiento esposo</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_luesposo" name="lugarnacimientoesposo" placeholder="Ingrese el apellido paterno" type="text" />
		                                        </div>
		                                    </div>    
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_fecbesposo">Fecha bautismo esposo</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_fecbesposo" name="fechabautismoesposo" placeholder="Ingrese el apellido materno" type="date" />
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_paqesposo">Parroquia de bautismo Esposo</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_paqesposo" name="parroquiabautismoesposo" placeholder="Ingrese el apellido paterno" type="text" />
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_nomesposa">Nombre Esposa</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_nomesposa" name="nomEsposa" placeholder="Ingrese el apellido paterno" type="text" />
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_apeesposa">Apellido Esposa</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_apeesposa" name="apeEsposa" placeholder="Ingrese el apellido paterno" type="text" />
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_fecnesposa">Fecha nacimiento esposa</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_fecnesposa" name="fechacimientoesposa" placeholder="Ingrese el apellido paterno" type="date" />
		                                        </div>
		                                    </div>
		                                   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_lugnesposa">Lugar nacimiento esposa</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_lugnesposa" name="lugarnacimientoesposa" placeholder="Ingrese el apellido paterno" type="text" />
		                                        </div>
		                                    </div>    
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_bauesposa">Fecha bautismo esposa</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_bauesposa" name="fechautismoesposa" placeholder="Ingrese el apellido materno" type="date"/>
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_paqesposa">Parroquia de bautismo Esposa</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_paqesposa" name="parroquiabautismoesposa" placeholder="Ingrese el apellido paterno" type="text" />
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_fechmatrimonio">Fecha de matrimonio</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_fechmatrimonio" name="fechamatrimonio" placeholder="Ingrese el apellido paterno" type="date" />
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_ministro">Ministro asistente</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_ministro" name="ministroasistente" placeholder="Ingrese el apellido paterno" type="text" />
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_padrino">Padrino</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_padrino" name="padrino" placeholder="Ingrese el padrino" type="text" />
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_madrina">Madrina</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_madrina" name="madrina" placeholder="Ingrese la madrina" type="text" />
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_testigos">Testigos</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_testigos" name="testigos" placeholder="Ingrese los testigos" type="text" />
		                                        </div>
		                                    </div>
		                                     
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_anotaciones">Anotaciones</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_anotaciones" name="anotacionesmarg" placeholder="Ingrese anotaciones" type="text" />
		                                        </div>
		                                    </div>
		                                   
		                                    <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
		                                        	<button type="submit" class="btn btn-primary" id="idBtnActualiza">ACTUALIZA</button>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        
		                    </div>
		                </form>   
				
				</div>
			</div>
		</div>
			
		</div>
		
				 <div class="modal fade" id="idModalElimina" >
					<div class="modal-dialog" style="width: 60%">
				 	
				 	<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header" style="padding: 35px 50px">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4><span class="glyphicon glyphicon-ok-sign"></span> Eliminar Matrimonio</h4>
						</div>
				
						  <div class="modal-footer">
						    <button type="button" id="idBtnElimina" name="modalDe" class="btn btn-primary">ELIMINAR</button>
						    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
						  </div>
					</div>
				</div>
				</div>
	
</div>
<script type="text/javascript">
$("#success-alert").fadeTo(2000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>

<script type="text/javascript">
$.getJSON("cargaPais", {}, function(data){
	$.each(data, function(index,item){
		$("#id_reg_pais").append("<option value="+item.idPais +">"+ item.nombre +"</option>");
		$("#id_act_pais").append("<option value="+item.idPais +">"+ item.nombre +"</option>");
	});
});
</script>
<script type="text/javascript">
$("#idBtnElimina").click(function(){
	$("#idFormElimina").submit();
});

function eliminar(id){
	$('#idModalElimina').modal('show');
	$('#id_elimina').val(id);	
}

function registrar(){	
	$('#idModalRegistra').modal("show");
}

function editar(idmatrimonio,numlibro,numfolio,numpartida,nombreparroquia,nomEsposo,apeEsposo,fechacimientoesposo,lugarnacimientoesposo,fechabautismoesposo,parroquiabautismoesposo,nomEsposa,apeEsposa,fechacimientoesposa,lugarnacimientoesposa,fechautismoesposa,parroquiabautismoesposa,fechamatrimonio,ministroasistente,padrino,madrina,testigos,anotacionesmarg){	
	$('#id_ID').val(idmatrimonio);
	$('#id_act_num_lib').val(numlibro)
	$('#id_act_folio').val(numfolio)
	$('#id_act_partida').val(numpartida)
	$('#id_act_parroquia').val(nombreparroquia)
	$('#id_act_esposo').val(nomEsposo)
	$('#id_act_apesposo').val(apeEsposo)
	$('#id_act_naesposo').val(fechacimientoesposo);
	$('#id_act_luesposo').val(lugarnacimientoesposo);
	$('#id_act_fecbesposo').val(fechabautismoesposo);
	$('#id_act_paqesposo').val(parroquiabautismoesposo)
	$('#id_act_nomesposa').val(nomEsposa)
	$('#id_act_apeesposa').val(apeEsposa)
	$('#id_act_fecnesposa').val(fechacimientoesposa)
	$('#id_act_lugnesposa').val(lugarnacimientoesposa)
	$('#id_act_bauesposa').val(fechautismoesposa)
	$('#id_act_paqesposa').val(parroquiabautismoesposa)
	$('#id_act_fechmatrimonio').val(fechamatrimonio)
	$('#id_act_ministro').val(ministroasistente)
	$('#id_act_padrino').val(padrino)
	$('#id_act_madrina').val(madrina)
	$('#id_act_testigos').val(testigos)
	$('#id_act_anotaciones').val(anotacionesmarg)
	$('#idModalActualiza').modal("show");
}

$(document).ready(function() {
    $('#tableAutor').DataTable();
} );
</script>
<script type="text/javascript">
$(document).ready(function() {
	$('#id_form_registra').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	"codigo":{
				selector:"#id_reg_codigo",
				validators:{
					notEmpty:{
						message:'El codigo es obligatorio'
					}
				},
				stringLenth:{
					max:50,
					min:2,
					message:'no supera el maximo'	
				}
	       },
	       "dni":{
				selector:"#id_reg_dni",
				validators:{
					notEmpty:{
						message:'El dni es obligatorio'
					}
				}
	       },
	       "tipo":{
				selector:"#id_reg_correo",
				validators:{
					notEmpty:{
						message:'El tipo es obligatorio'
					}
				}
	       }
	       
	       "fechaNacimiento":{
				selector:"#id_reg_fecha",
				validators:{
					notEmpty:{
						message:'El fecha es obligatorio'
					},
					date:{
						format:'DD/MM/YYYY'
						}
				}
	       },
             
          
        }   
    });
});
</script>

<script type="text/javascript">
$(document).ready(function() {
	$('#id_form_actualiza').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	
          
        }   
    });
});
</script>	

</body>
</html>




