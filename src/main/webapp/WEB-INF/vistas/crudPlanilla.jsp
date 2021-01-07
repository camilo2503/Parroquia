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
<title>Intranet Parroquia | Arpynet </title>
</head>
<body>

<jsp:include page="intranetCabecera.jsp" />
<div class="container" style="margin-top: 4%">
<h3>Mantenimiento Planilla</h3>
	
	

<div class="container" >

 
			<div class="col-md-23">
				<form id="idFormElimina" action="eliminaCrudUsuario">
					<input type="hidden" id="id_elimina" name="id">
				</form>

				<form accept-charset="UTF-8" action="consultaCrudPlanilla" class="simple_form" id="defaultForm2" method="post">
					<div class="row">
						<div class="col-md-3">
							<div class="form-group">
								<input class="form-control" id="id_nonbre_filtro"  name="filtro" placeholder="Ingrese el nombre" type="text" maxlength="30"/>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-3">
							<button type="submit" class="btn btn-primary" id="validateBtnw1">FILTRA</button>
							<br>&nbsp;<br>
						</div>
						<div class="col-md-3">
							<button type="button" data-toggle='modal' onclick="registrar();"
								class='btn btn-success' id="validateBtnw2">REGISTRA</button>
							<br>&nbsp;<br>
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
					<div class="row">
						<div class="col-md-12">
							<div class="content">

								<table id="tableAlumno"
									class="table table-striped table-bordered">
									<thead>
										<tr>
											<th>ID</th>
											<th>Monto a Pagar</th>
											<th>Cargo</th>
											<th>Planilla</th>	
											<th>tipopago</th>
											<th>fechapago</th>
											<th>Nombre de Trabajador</th>
											<th>Actualiza</th>
											<th>Elimina</th>
										</tr>
									</thead>
									<tbody>

										<c:forEach items="${planilla}" var="x">
											<tr>
												<td>${x.idplanilla}</td>
												<td>${x.montopagar}</td>
												<td>${x.cargo}</td>
												<td>${x.planilladescripcion}</td>
												<td>${x.tipopago}</td>
												<td>${x.fechapago}</td>
												<td>${x.trabajador.nombre}</td>
												<td>
												<button type='button' data-toggle='modal' onclick="editar('${x.idplanilla}','${x.montopagar}','${x.cargo}','${x.planilladescripcion}','${x.tipopago}','${x.fechapago}','${x.trabajador.idtrabajador}');" class='btn btn-success'	style='background-color: hsla(233, 100%, 100%, 0);'>
														<img src='images/edit.gif' id='id_update' width='auto'	height='auto' />
													</button>
												</td>
												<td>
													<button type='button' data-toggle='modal'  onclick="eliminar('${x.idplanilla}');" class='btn btn-success'	style='background-color: hsla(233, 100%, 100%, 0);'>
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

			<div class="modal fade" id="idModalRegistra">
				<div class="modal-dialog" style="width: 60%">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header" style="padding: 35px 50px">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4>
								<span class="glyphicon glyphicon-ok-sign"></span> Registro de
								Planilla
							</h4>
						</div>
						<div class="modal-body" style="padding: 20px 10px;">
							<form id="id_form_registra" accept-charset="UTF-8" action="registraActualizaCrudPlanilla" class="form-horizontal" method="post">
								<div class="panel-group" id="steps">
									<!-- Step 1 -->
									<div class="panel panel-default">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a data-toggle="collapse" data-parent="#steps"
													href="#stepOne">Datos de Planilla</a>
											</h4>
										</div>
										<div id="stepOne" class="panel-collapse collapse in">
											<div class="panel-body">
												<div class="form-group">
													<label class="col-lg-3 control-label" for="id_monto">Monto a pagar </label>
													<div class="col-lg-5">
														<input class="form-control" id="id_monto"	name="montopagar" placeholder="Ingrese el nombre" type="text" maxlength="30" />
													</div>
												</div>
													<div class="form-group">
													<label class="col-lg-3 control-label" for="id_cargo"> Cargo </label>
													<div class="col-lg-5">
														<input class="form-control" id="id_cargo"	name="cargo" placeholder="Ingrese el cargo" type="text" maxlength="30" />
													</div>
												</div>
												<div class="form-group">
													<label class="col-lg-3 control-label" for="id_planilla">Planilla </label>
													<div class="col-lg-5">
														<input class="form-control" id="id_planilla"	name="planilladescripcion" placeholder="Ingrese si pertenece a una planilla" type="text" maxlength="30" />
													</div>
												</div>
											
												<div class="form-group">
													<label class="col-lg-3 control-label" for="id_tipo_pago">Tipo de Pago</label>
													<div class="col-lg-5">
														<input class="form-control" id="id_tipo_pago"	name="tipopago" placeholder="Ingrese el tipo de pago" type="text" maxlength="30" />
													</div>
												</div>
												<div class="form-group">
													<label class="col-lg-3 control-label" for="id_fecha">Fecha de Pago</label>
													<div class="col-lg-5">
														<input class="form-control" id="id_fecha"	name="fechapago" placeholder="Ingrese la fecha" type="date" maxlength="30" />
													</div>
												</div>
												
												<div class="form-group">
													<label class="col-lg-3 control-label" for="id_tipo_usuario">Trabajador</label>
													<div class="col-lg-5">
														<select id="id_tipo_usuario" name="trabajador" class='form-control'> 
															<option value=" ">[Seleccione]</option>
														</select>
													</div>
												</div>

												
												
												<div class="form-group">
													<div class="col-lg-9 col-lg-offset-3">
														<button type="submit" class="btn btn-primary">REGISTRA</button>
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

			<div class="modal fade" id="idModalActualiza">
				<div class="modal-dialog" style="width: 60%">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header" style="padding: 35px 50px">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4>
								<span class="glyphicon glyphicon-ok-sign"></span> Actualiza Planilla
							</h4>
						</div>
						<div class="modal-body" style="padding: 20px 10px;">
							<form id="id_form_actualiza" accept-charset="UTF-8"
								action="registraActualizaCrudPlanilla" class="form-horizontal"
								method="post">
								<div class="panel-group" id="steps">
									<!-- Step 1 -->
									<div class="panel panel-default">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a data-toggle="collapse" data-parent="#steps"
													href="#stepOne">Datos de Planilla</a>
											</h4>
										</div>
										<div id="stepOne" class="panel-collapse collapse in">
											<div class="panel-body">
												<div class="form-group">
													<label class="col-lg-3 control-label" for="id_ID">ID</label>
													<div class="col-lg-5">
														<input class="form-control" id="id_ID" readonly="readonly"
															name="idplanilla" type="text" maxlength="8" />
													</div>
												</div>
												<div class="form-group">
													<label class="col-lg-3 control-label" for="id_act_monto">Monto a Pagar</label>
													<div class="col-lg-5">
														<input class="form-control" id="id_act_monto" name="montopagar" placeholder="Ingrese el nombre" type="text" maxlength="30"  />
													</div>
												</div>
												<div class="form-group">
													<label class="col-lg-3 control-label" for="id_act_cargo">Cargo</label>
													<div class="col-lg-5">
														<input class="form-control" id="id_act_cargo"	name="cargo" placeholder="Ingrese el apellido materno" type="text" maxlength="30" />
													</div>
												</div>
												<div class="form-group">
													<label class="col-lg-3 control-label" for="id_act_planilla">Planilla</label>
													<div class="col-lg-5">
														<input class="form-control" id="id_act_planilla"	name="planilladescripcion" placeholder="Ingrese el apellido paterno" type="text" maxlength="30" />
													</div>
												</div>
												
												<div class="form-group">
													<label class="col-lg-3 control-label" for="id_act_tipopago">Tipo de pago</label>
													<div class="col-lg-5">
														<input class="form-control" id="id_act_tipopago" name="tipopago" placeholder="Ingrese el nombre" type="text" maxlength="30" />
													</div>
												</div>
												<div class="form-group">
													<label class="col-lg-3 control-label" for="id_act_fechapago">Fecha de Pago</label>
													<div class="col-lg-5">
														<input class="form-control" id="id_act_fechapago"	name="fechapago" placeholder="Ingrese el nombre" type="date" maxlength="30" />
													</div>
												</div>
												
												
												<div class="form-group">
													<label class="col-lg-3 control-label" for="id_act_tipo_usuario">Trabajador</label>
													<div class="col-lg-5">
														<select id="id_act_tipo_usuario" name="trabajador" class='form-control'> 
															<option value=" ">[Seleccione]</option>
														</select>
													</div>
												</div>
												
												
												<div class="form-group">
													<div class="col-lg-9 col-lg-offset-3">
														<button type="submit" class="btn btn-primary">ACTUALIZA</button>
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
							<h4><span class="glyphicon glyphicon-ok-sign"></span> Eliminar Usuario</h4>
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

$.getJSON("listaTrabajador",{},function(data){
	$.each(data,function(i, obj){
		$("#id_tipo_usuario").append("<option value='" + obj.idtrabajador+ "'>"+obj.nombre+"</option>");
		$("#id_act_tipo_usuario").append("<option value='" + obj.idtrabajador+ "'>"+obj.nombre+"</option>");
	});
});

</script>



<script type="text/javascript">
$("#success-alert").fadeTo(2000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
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

function editar(id,montopagar,cargo,planilladescripcion,tipopago,fechapago,idtrabajador){
	$('input[id=id_ID]').val(id);
	$('input[id=id_act_monto]').val(montopagar);
	$('input[id=id_act_cargo]').val(cargo);
	$('input[id=planilladescripcion]').val(planilladescripcion);
	$('input[id=id_act_tipopago]').val(tipopago);
	$('input[id=id_act_fechapago]').val(fechapago);
	$('select[id=id_act_tipo_usuario]').val(idtrabajador);
	$('#idModalActualiza').modal("show");
}
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
    	nombres: {
    		selector : '#id_nombre',
            validators: {
                notEmpty: {
                    message: 'El nombre es un campo obligatorio'
                },
                stringLength :{
                	message:'El nombre es de 5 a 100 caracteres',
                	min : 5,
                	max : 100
                }
            }
        },
      apaterno: {
			selector: '#id_paterno',
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
       amaterno:{
			selector:"#id_amaterno",
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
	 fechaNacimiento:{
			selector:"#id_fechanacimiento",
			validators:{
				notEmpty:{
					message:'El fecha es obligatorio'
				},
				date:{
					format:'DD/MM/YYYY'
					}
			}
       },
       celular:{
			selector:"#id_celular",
			validators:{
				notEmpty:{
					message:'El celular es obligatorio'
				},
			
			stringLength:{
				max:9,
				min:9,
				message:'no supera el minimo'	
			}
		}
       },	
       dni:{
			selector:"#id_dni",
			validators:{
				notEmpty:{
					message:'El dni es obligatorio'
				},
			
			stringLength:{
				max:8,
				min:8,
				message:'no supera el minimo'	
			}
		}
       },
       tipo:{
			selector:"#id_tipo",
			validators:{
				notEmpty:{
					message:'El tipo es obligatorio'
				},
			stringLength:{
				max:4,
				min:100,
				message:'no supera el minimo'	
			}
		}
       },       
       login:{
			selector:"#id_login",
			validators:{
				notEmpty:{
					message:'El login es obligatorio'
				},
			stringLenth:{
				max:4,
				min:100,
				message:'no supera el minimo'	
			}
		}
       },
       tipoUsuario: {
    		selector : '#id_tipo_usuario',
            validators: {
            	notEmpty: {
                    message: 'El sistema de evaluacion es un campo obligatorio'
                },
            }
        },
        ubigeo: {
    		selector : '#id_distrito',
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
        	nombres: {
        		selector : '#id_act_nombre',
                validators: {
                    notEmpty: {
                        message: 'El nombre es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El nombre es de 5 a 100 caracteres',
                    	min : 5,
                    	max : 100
                    }
                }
            },
          apaterno: {
    			selector: '#id_act_paterno',
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
           amaterno:{
    			selector:"#id_act_amaterno",
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
    	 fechaNacimiento:{
    			selector:"#id_act_fechanacimiento",
    			validators:{
    				notEmpty:{
    					message:'El fecha es obligatorio'
    				},
    				date:{
    					format:'DD/MM/YYYY'
    					}
    			}
           },
           estado:{
   			selector:"#id_act_estado",
			validators:{
				notEmpty:{
					message:'El celular es obligatorio'
				},
			
			stringLength:{
				max:9,
				min:9,
				message:'no supera el minimo'	
			}
			}
      	},
           celular:{
    			selector:"#id_act_celular",
    			validators:{
    				notEmpty:{
    					message:'El celular es obligatorio'
    				},
    			
    			stringLength:{
    				max:9,
    				min:9,
    				message:'no supera el minimo'	
    			}
    		}
           },	
           dni:{
    			selector:"#id_act_dni",
    			validators:{
    				notEmpty:{
    					message:'El dni es obligatorio'
    				},
    			
    			stringLength:{
    				max:8,
    				min:8,
    				message:'no supera el minimo'	
    			}
    		}
           },
           tipo:{
    			selector:"#id_act_tipo",
    			validators:{
    				notEmpty:{
    					message:'El tipo es obligatorio'
    				},
    			stringLength:{
    				max:4,
    				min:100,
    				message:'no supera el minimo'	
    			}
    		}
           },       
           login:{
    			selector:"#id_act_login",
    			validators:{
    				notEmpty:{
    					message:'El login es obligatorio'
    				},
    			stringLenth:{
    				max:4,
    				min:100,
    				message:'no supera el minimo'	
    			}
    		}
           },
           tipoUsuario: {
        		selector : '#id_act_tipo_usuario',
                validators: {
                	notEmpty: {
                        message: 'El sistema de evaluacion es un campo obligatorio'
                    },
                }
            },
            ubigeo: {
        		selector : '#id_act_distrito',
                validators: {
                	notEmpty: {
                        message: 'El sistema de evaluacion es un campo obligatorio'
                    }
                }
            },  
        	
        }   
    });
</script>	
</div>
</body>
</html>




