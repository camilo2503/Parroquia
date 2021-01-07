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
<h3>Registro de Salidas Bancarias </h3>
<div class="col-md-23" >  
			  <form id="idFormElimina" action="eliminaCrudLibro">
			  		<input type="hidden" id="id_elimina" name="id">
			  </form>	
				
		       <form accept-charset="UTF-8"  action="consultaCrudSalidaBanco" class="simple_form" id="defaultForm2"  method="post">
					<div class="row" style="height: 70px">
						<div class="col-md-2" >
								<input class="form-control" id="id_nonbre_filtro"  name="filtro" placeholder="Ingrese el codigo" type="text" maxlength="30"/>
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
						
									<table id="tableEditorial" class="table table-striped table-bordered" >
										<thead>
											<tr>
												<th>ID</th>
												<th>Monto Ingresado</th>
												<th>Numero de Operacion</th>
												<th>Fecha de ingreso</th>
												<th>Comentarios </th>
												<th>Numero de cuenta</th>
												<th>Actualiza </th>
												<th>Elimina </th>
											</tr>
										</thead>
											<tbody>
												    
												<c:forEach items="${sessionScope.salidabanco}" var="x">
													<tr>
														<td>${x.idsalidadinerobanco}</td>
														<td>${x.monto}</td>
														<td>${x.numerooperacion}</td>
														<td>${x.fechaingreso}</td>
														<td>${x.comentarios}</td>
														<td>${x.tipoBanco.idbanco}</td>
														
														<td>
															<button type='button' data-toggle='modal' onclick="editar('${x.idsalidadinerobanco}','${x.monto}','${x.numerooperacion}','${x.fechaingreso}','${x.comentarios}','${x.tipoBanco.idbanco}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>
																<img src='images/edit.gif' id='id_update' width='auto'	height='auto' />
															</button>
														</td>
														<td>
															<button type='button' data-toggle='modal' onclick="eliminar('${x.idsalidadinerobanco}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>
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
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de Salida bancarios</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_registra" accept-charset="UTF-8" action="registraActualizaCrudSalidaBanco" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos Bancarios</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                            
		                              <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_estado">Monto</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_estado" name="monto" placeholder="Ingrese el numero" type="text" maxlength="10"/>
		                                        </div>
		                                    </div>
		                                <div class="panel-body">
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_titulo">Numero de Operacion</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_titulo" name="numerooperacion" placeholder="Ingrese la titulo" type="text" />
		                                        </div>
		                                    </div>    
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_titulo">Fecha de Ingreso </label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_titulo" name="fechaingreso" placeholder="Ingrese la titulo" type="date" />
		                                        </div>
		                                    </div> 
		                                    
		                                       <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_titulo">Comentarios </label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_titulo" name="comentarios" placeholder="Ingrese la titulo" type="text" />
		                                        </div>
		                                    </div> 
		                                      
		                                      <div class="form-group">
													<label class="col-lg-3 control-label" for="id_tipo_banco">Cuenta Bancaria</label>
													<div class="col-lg-5">
														<select id="id_tipo_banco" name="tipoBanco" class='form-control'> 
															<option value=" ">[Seleccione]</option>
														</select>
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
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza Registro bancario</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_actualiza" accept-charset="UTF-8"  action="registraActualizaCrudSalidaBanco" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos Bancarios</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ID">ID</label>
		                                        <div class="col-lg-5">
		                                           <input class="form-control" id="id_ID" readonly="readonly" name="idsalidadinerobanco" type="text" maxlength="8"/>
		                                        </div>
		                                     </div>
		                                     
		                                       <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_monto">Monto</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_monto" name="monto" placeholder="Ingrese el precio" type="text" />
		                                        </div>
		                                    </div>    
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_numero">Numero de Operacion</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_numero" name="numerooperacion" placeholder="Ingrese la descripcion" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                      <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_fecha">Fecha Ingreso</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_fecha" name="fechaingreso" placeholder="Ingrese la descripcion" type="date" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_comentarios">Comentarios</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_comentarios" name="comentarios" placeholder="Ingrese la descripcion" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                  
		                                   
		                            <div class="form-group">
													<label class="col-lg-3 control-label" for="id_act_tipo_usuario">Cuenta Bancaria</label>
													<div class="col-lg-5">
														<select id="id_act_tipo_usuario" name="tipoBanco" class='form-control'> 
															<option value=" ">[Seleccione]</option>
														</select>
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
							<h4><span class="glyphicon glyphicon-ok-sign"></span> Eliminar Alquiler</h4>
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

$.getJSON("listaTipoBancoSalida",{},function(data){
	$.each(data,function(i, obj){
		$("#id_tipo_banco").append("<option value='" + obj.idbanco+ "'>"+obj.numerocuenta+"</option>");
		$("#id_act_tipo_usuario").append("<option value='" + obj.idbanco+ "'>"+obj.numerocuenta+"</option>");
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

function editar(idsalidadinerobanco,monto,numerooperacion,fechaingreso,comentarios,idbanco){	
	$('input[id=id_ID]').val(idsalidadinerobanco);
	$('input[id=id_act_monto').val(monto);
	$('input[id=id_act_numero]').val(numerooperacion);
	$('input[id=id_act_fecha').val(fechaingreso);
	$('input[id=id_act_comentarios').val(comentarios);
	$('select[id=id_act_tipo_usuario]').val(idTipoUsuario);
	$('#idModalActualiza').modal("show");
}

$(document).ready(function() {
    $('#tableEditorial').DataTable();
} );
</script>

<script type="text/javascript">
$('#id_form_registra').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
    	
        titulo: {
			selector: '#id_reg_titulo',
			validators:{
				notEmpty:{
					message:'El apellido parterno es obligatorio'
				},
			
			stringLength:{
				max:50,
				min:2,
				message:'no supera el maximo'	
			}
		}
       },
       estado:{
			selector:"#id_reg_estado",
			validators:{
				notEmpty:{
					message:'El estado es obligatorio'
				},
			
			stringLength:{
				max:50,
				min:2,
				message:'no supera el maximo'	
			}
		}
       },
       tipo:{
			selector:"#id_reg_tipo",
			validators:{
				notEmpty:{
					message:'El apellido marterno es obligatorio'
				},
			
			stringLength:{
				max:50,
				min:2,
				message:'no supera el maximo'	
			}
		}
      },
      tipoLibro: {
  		selector : '#id_reg_tipoLibro',
          validators: {
          	notEmpty: {
                  message: 'El sistema de evaluacion es un campo obligatorio'
              }
          }
      },
  	
  }   
});
</script>

<script type="text/javascript">
$('#id_form_actualiza').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
    	
        titulo: {
			selector: '#id_act_titulo',
			validators:{
				notEmpty:{
					message:'El apellido parterno es obligatorio'
				},
			
			stringLength:{
				max:50,
				min:2,
				message:'no supera el maximo'	
			}
		}
       },
       estado:{
			selector:"#id_act_estado",
			validators:{
				notEmpty:{
					message:'El apellido marterno es obligatorio'
				},
			
			stringLength:{
				max:50,
				min:2,
				message:'no supera el maximo'	
			}
		}
       },
       tipo:{
			selector:"#id_act_tipo",
			validators:{
				notEmpty:{
					message:'El apellido marterno es obligatorio'
				},
			
			stringLength:{
				max:50,
				min:2,
				message:'no supera el maximo'	
			}
		}
      },
      tipoLibro: {
  		selector : '#id_act_tipoLibro',
          validators: {
          	notEmpty: {
                  message: 'El sistema de evaluacion es un campo obligatorio'
              }
          }
      },
  	
  }   
});
</script>	


</body>
</html>




