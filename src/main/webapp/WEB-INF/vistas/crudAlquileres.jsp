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

<title>Intranet Parrroquia | ARPYNET </title>
</head>
<body>
       
<jsp:include page="intranetCabecera.jsp" />
<div class="container">&nbsp;<br>&nbsp;<br>&nbsp;<br>
</div>
  
<div class="container">
 <h3>Registro de Alquiler de local</h3>
		 <div class="col-md-23" >  
			  <form id="idFormElimina" action="eliminaCrudLibro">
			  		<input type="hidden" id="id_elimina" name="id">
			  </form>	
				
		       <form accept-charset="UTF-8"  action="consultaCrudAlquileres" class="simple_form" id="defaultForm2"  method="post">
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
												<th>Tipo de certificado</th>
												<th>Precio</th>
												<th>Fecha de Alquiler</th>
												<th>Solicitante</th>
												<th>DNI</th>
												<th>Telefono</th>
												<th>Actualiza </th>
												<th>Elimina </th>
											</tr>
										</thead>
											<tbody>
												    
												<c:forEach items="${sessionScope.alquileres}" var="x">
													<tr>
														<td>${x.idalquilersalones}</td>
														<td>${x.tipoAlquiler.descripcion}</td>
														<td>${x.precio}</td>
														<td>${x.fechaalquiler}</td>
														<td>${x.solicitante}</td>
														<td>${x.dni}</td>
														<td>${x.telefono}</td>
														<td>
															<button type='button' data-toggle='modal' onclick="editar('${x.idalquilersalones}','${x.tipoAlquiler.idtiposalon}','${x.precio}','${x.precio}','${x.fechaalquiler}','${x.solicitante}','${x.dni}','${x.telefono}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>
																<img src='images/edit.gif' width='auto' height='auto' />
															</button>
														</td>
														<td>
															<button type='button' data-toggle='modal' onclick="eliminar('${x.idalquilersalones}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>
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
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de Alquiler de salones</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_registra" accept-charset="UTF-8" action="registraActualizaalquileres" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos del Salon </a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                
		                                  <div class="form-group">
													<label class="col-lg-3 control-label" for="id_tipo_usuario">Tipo de Alquiler</label>
													<div class="col-lg-5">
														<select id="id_tipo_usuario" name="tipoAlquiler" class='form-control'> 
															<option value=" ">[Seleccione]</option>
														</select>
													</div>
												</div>   
		                                   
		                                   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_titulo">Precio</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_titulo" name="precio" placeholder="Ingrese la titulo" type="text" />
		                                        </div>
		                                    </div>    
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_fecha">Fecha Alquiler</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_estado" name="fechaalquiler" placeholder="Ingrese el numero" type="date" maxlength="10"/>
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_estado">Solicitante</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_estado" name="solicitante" placeholder="Ingrese el numero" type="text" maxlength="10"/>
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_estado">DNI</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_estado" name="dni" placeholder="Ingrese el numero" type="text" maxlength="10"/>
		                                        </div>
		                                    </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_estado">Telefono</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_estado" name="telefono" placeholder="Ingrese el numero" type="text" maxlength="10"/>
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
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza Alquiler</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_actualiza" accept-charset="UTF-8"  action="registraActualizaalquileres" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos del Alquiler</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ID">ID</label>
		                                        <div class="col-lg-5">
		                                           <input class="form-control" id="id_ID" readonly="readonly" name="idalquilersalones" type="text" maxlength="8"/>
		                                        </div>
		                                     </div>
		                                     
		                                     <div class="form-group">
													<label class="col-lg-3 control-label" for="id_act_tipo_usuario">Tipo de Alquiler</label>
													<div class="col-lg-5">
														<select id="id_act_tipo_usuario" name="tipoAlquiler" class='form-control'> 
															<option value=" ">[Seleccione]</option>
														</select>
													</div>
												</div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_codigo">Precio</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_codigo" name="precio" placeholder="Ingrese el codigo" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_titulo">Fecha Alquiler</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_titulo" name="fechaalquiler" placeholder="Ingrese la titulo" type="date" />
		                                        </div>
		                                    </div>    
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_titulo">Solicitante</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_titulo" name="solicitante" placeholder="Ingrese la titulo" type="text" />
		                                        </div>
		                                    </div> 
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_titulo">DNI</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_titulo" name="dni" placeholder="Ingrese la titulo" type="text" />
		                                        </div>
		                                    </div>  
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_titulo">Telefono</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_titulo" name="telefono" placeholder="Ingrese la titulo" type="text" />
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

$.getJSON("listaTipoAlquiler",{},function(data){
	$.each(data,function(i, obj){
		$("#id_tipo_usuario").append("<option value='" + obj.idtiposalon+ "'>"+obj.descripcion+"</option>");
		$("#id_act_tipo_usuario").append("<option value='" + obj.idtiposalon+ "'>"+obj.descripcion+"</option>");
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

function editar(idalquilersalones,descripcion,precio){	
	$('input[id=id_ID]').val(idalquilersalones);
	$('input[id=id_act_codigo]').val(descripcion);
	$('input[id=id_act_titulo').val(precio);
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


