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


<title>Intranet Parroquia |ARPYNET</title>
</head>
<body>
       
<jsp:include page="intranetCabecera.jsp" />
<div class="container">&nbsp;<br>&nbsp;<br>&nbsp;<br>
</div>
  
<div class="container">
 <h3>Mantenimiento Bautiso</h3>
		 <div class="col-md-23" >  
			  <form id="idFormElimina" action="eliminaCrudAutor">
			  		<input type="hidden" id="id_elimina" name="id">
			  </form>	
				
		       <form accept-charset="UTF-8"  action="consultaCrudBautiso" class="simple_form" id="defaultForm2"  method="post">
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
												<th>Nombre Parroquia</th>
												<th>Numero Libro</th>
												<th>Numero Folio</th>
												<th>Numero Partida</th>
												<th>Apellidos</th>
												<th>Nombres</th>
												<th>Padre </th>
												<th>Madre </th>
												<th>Lugar nacimiento</th>
												<th>Fecha nacimiento</th>
												<th>fecha bautismo</th>
												<th>Madrina</th>
												<th>Padrino</th>
												<th>Anotaciones</th>
												
												<th>Actualiza </th>
												<th>Elimina </th>
											</tr>
										</thead>
											<tbody>
												    
												<c:forEach items="${sessionScope.bautisos}" var="x">
													<tr>
														<td>${x.idbautiso}</td>
														<td>${x.nombreparroquia}</td>
														<td>${x.numLibro}</td>
														<td>${x.numFolio}</td>
														<td>${x.numPartida}</td>
														<td>${x.apellidos}</td>
														<td>${x.nombre}</td>
														<td>${x.padre}</td>
														<td>${x.madre}</td>
														<td>${x.lugarnacimiento}</td>
														<td>${x.fechanacimiento}</td>
														<td>${x.fechabautismo}</td>
														<td>${x.madrina}</td>
														<td>${x.padrino}</td>
														<td>${x.anotaciones}</td>
														
														<td>
															<button type='button' data-toggle='modal' onclick="editar('${x.idbautiso}','${x.nombreparroquia}','${x.numLibro}','${x.numFolio}','${x.numPartida}','${x.apellidos}','${x.nombre}','${x.padre}','${x.madre}','${x.lugarnacimiento}','${x.fechanacimiento}','${x.fechabautismo}','${x.madrina}','${x.padrino}','${x.anotaciones}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>
																<img src='images/edit.gif' width='auto' height='auto' />
															</button>
														</td>
														<td>
															<button type='button' data-toggle='modal' onclick="eliminar('${x.idbautiso}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>
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
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de Bautiso</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_registra" accept-charset="UTF-8" action="registraActualizaCrudBautiso" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos del Niño a Bautizar</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_nombres">Nombre de Parroquia</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_nombres" name="nombreparroquia" placeholder="Ingrese los nombres" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_apaterno">Numero de Libro</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_apaterno" name="numLibro" placeholder="Ingrese el apellido paterno" type="text" />
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_apaterno">Numero Folio</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_apaterno" name="numFolio" placeholder="Ingrese el apellido paterno" type="text" />
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_apaterno">Numero partida</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_apaterno" name="numPartida" placeholder="Ingrese el apellido paterno" type="text" />
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_apaterno">Apellidos</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_apaterno" name="apellidos" placeholder="Ingrese el apellido paterno" type="text" />
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_apaterno">Nombres</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_apaterno" name="nombre" placeholder="Ingrese el apellido paterno" type="text" />
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_apaterno">Padre</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_apaterno" name="padre" placeholder="Ingrese el apellido paterno" type="text" />
		                                        </div>
		                                    </div>
		                                   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_apaterno">Madre</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_apaterno" name="madre" placeholder="Ingrese el apellido paterno" type="text" />
		                                        </div>
		                                    </div>    
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_amaterno">Lugar de nacimiento</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_amaterno" name="lugarnacimiento" placeholder="Ingrese el apellido materno" type="text" maxlength="10"/>
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_apaterno">Fecha Nacimiento</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_apaterno" name="fechanacimiento" placeholder="Ingrese el apellido paterno" type="date" />
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_apaterno">Fecha de bautismo</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_apaterno" name="fechabautismo" placeholder="Ingrese el apellido paterno" type="date" />
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_apaterno">Madrina</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_apaterno" name="madrina" placeholder="Ingrese el apellido paterno" type="text" />
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_apaterno">Padrino</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_apaterno" name="padrino" placeholder="Ingrese el apellido paterno" type="text" />
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_apaterno">Anotaciones</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_apaterno" name="anotaciones" placeholder="Ingrese el apellido paterno" type="text" />
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
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza Bautiso</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_actualiza" accept-charset="UTF-8"  action="registraActualizaCrudBautiso" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos del niño a bautisar</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ID">ID</label>
		                                        <div class="col-lg-5">
		                                           <input class="form-control" id="id_ID" readonly="readonly" name="idbautiso" type="text" maxlength="8"/>
		                                        </div>
		                                     </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_nombres">Nombre de parroquia</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_nombres" name="nombreparroquia" placeholder="Ingrese los nombres" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_nombres">Numero Libro</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_num_lib" name="numLibro" placeholder="Ingrese los nombres" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_nombres">Numero Folio</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_num_fol" name="numFolio" placeholder="Ingrese los nombres" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_nombres">Numero Partida</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_num_par" name="numPartida" placeholder="Ingrese los nombres" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_nombres">Apellidos</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_apellido" name="apellidos" placeholder="Ingrese los nombres" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_nombres">Nombre</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_nombres" name="nombre" placeholder="Ingrese los nombres" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_nombres">Padre</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_padre" name="padre" placeholder="Ingrese los nombres" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_apaterno">Madre</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_madre" name="madre" placeholder="Ingrese el apellido paterno" type="text" />
		                                        </div>
		                                    </div>    
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_amaterno">Lugar nacimiento</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_lugar_naci" name="lugarnacimiento" placeholder="Ingrese el apellido materno" type="text" maxlength="10"/>
		                                        </div>
		                                    </div>
		                           	 		<div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_nombres">Fecha nacimiento</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_fecha_nac" name="fechanacimiento" placeholder="Ingrese los nombres" type="date" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_nombres">Fecha bautismo</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_fec_bautis" name="fechabautismo" placeholder="Ingrese los nombres" type="date" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_nombres">madrina</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_madrina" name="madrina" placeholder="Ingrese los nombres" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_nombres">Padrino</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_padrino" name="padrino" placeholder="Ingrese los nombres" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_nombres">Anotaciones</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_anotaciones" name="anotaciones" placeholder="Ingrese los nombres" type="text" maxlength="20"/>
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
							<h4><span class="glyphicon glyphicon-ok-sign"></span> Eliminar Bautiso</h4>
						</div>
				
						  <div class="modal-footer">
						    <button type="button" id="idBtnElimina" name="modalDe" class="btn btn-primary">ELIMINAR</button>
						    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
						  </div>
					</div>
				</div>
				</div>

</div>


<div class="container" >
 <div class="col-md-12" align="center"> 

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

function editar(id,nombreparroquia,numLibro,numFolio,numPartida,apellidos,nombre,padre,madre,lugarnacimiento,fechanacimiento,fechabautismo,madrina,padrino,anotaciones){	
	$('#id_ID').val(id);
	$('#id_act_nombres').val(nombreparroquia)
	$('#id_num_lib').val(numLibro)
	$('#id_num_fol').val(numFolio)
	$('#id_num_par').val(numPartida)
	$('#id_apellido').val(apellidos)
	$('#id_nombres').val(nombre)
	$('#id_padre').val(padre);
	$('#id_madre').val(madre);
	$('#id_lugar_naci').val(lugarnacimiento);
	$('#id_fecha_nac').val(fechanacimiento)
	$('#id_fec_bautis').val(fechabautismo)
	$('#id_madrina').val(madrina)
	$('#id_padrino').val(padrino)
	$('#id_anotaciones').val(anotaciones)
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




