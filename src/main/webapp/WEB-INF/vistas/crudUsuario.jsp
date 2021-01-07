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
<h3>Mantenimiento Usuario</h3>
	
	

<div class="container" >

 
			<div class="col-md-23">
				<form id="idFormElimina" action="eliminaCrudUsuario">
					<input type="hidden" id="id_elimina" name="id">
				</form>

				<form accept-charset="UTF-8" action="consultaCrudUsuario" class="simple_form" id="defaultForm2" method="post">
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
											<th>Nombres</th>
											<th>materno</th>
											<th>paterno</th>	
											<th>fechaNacimiento</th>
											<th>fechaRegistro</th>
											<th>celular</th>
											<th>estado</th>
											<th>direccion</th>
											<th>login</th>
											<th>password</th>
											<th>dni</th>
											<th>Tipo de Usuario</th>
											<th>Actualiza</th>
											<th>Elimina</th>
										</tr>
									</thead>
									<tbody>

										<c:forEach items="${USUARIOS}" var="x">
											<tr>
												<td>${x.idUsuario}</td>
												<td>${x.nombres}</td>
												<td>${x.amaterno}</td>
												<td>${x.apaterno}</td>
												<td>${x.fechaNacimiento}</td>
												<td>${x.fechaRegistro}</td>
												<td>${x.celular}</td>
												<td>${x.estado}</td>
												<td>${x.direccion}</td>
												<td>${x.login}</td>
												<td>${x.password}</td>
												<td>${x.dni}</td>
												<td>${x.tipoUsuario.nombre}</td>
												<td>
<button type='button' data-toggle='modal' onclick="editar('${x.idUsuario}','${x.nombres}','${x.amaterno}','${x.apaterno}','${x.fechaNacimiento}',
'${x.fechaRegistro}','${x.celular}','${x.estado}','${x.direccion}','${x.login}','${x.password}','${x.dni}','${x.tipoUsuario.idTipoUsuario}');" class='btn btn-success'	style='background-color: hsla(233, 100%, 100%, 0);'>
														<img src='images/edit.gif' id='id_update' width='auto'	height='auto' />
													</button>
												</td>
												<td>
													<button type='button' data-toggle='modal'  onclick="eliminar('${x.idUsuario}');" class='btn btn-success'	style='background-color: hsla(233, 100%, 100%, 0);'>
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
								Usuario
							</h4>
						</div>
						<div class="modal-body" style="padding: 20px 10px;">
							<form id="id_form_registra" accept-charset="UTF-8" action="registraActualizaCrudUsuario" class="form-horizontal" method="post">
								<div class="panel-group" id="steps">
									<!-- Step 1 -->
									<div class="panel panel-default">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a data-toggle="collapse" data-parent="#steps"
													href="#stepOne">Datos de Usuario</a>
											</h4>
										</div>
										<div id="stepOne" class="panel-collapse collapse in">
											<div class="panel-body">
												<div class="form-group">
													<label class="col-lg-3 control-label" for="id_nombre">Nombre</label>
													<div class="col-lg-5">
														<input class="form-control" id="id_nombre"	name="nombres" placeholder="Ingrese el nombre" type="text" maxlength="30" />
													</div>
												</div>
													<div class="form-group">
													<label class="col-lg-3 control-label" for="id_materno">Apellido Materno</label>
													<div class="col-lg-5">
														<input class="form-control" id="amaterno"	name="amaterno" placeholder="Ingrese el apellido materno" type="text" maxlength="30" />
													</div>
												</div>
												<div class="form-group">
													<label class="col-lg-3 control-label" for="id_paterno">Apellido Paterno</label>
													<div class="col-lg-5">
														<input class="form-control" id="id_paterno"	name="apaterno" placeholder="Ingrese el apellido paterno" type="text" maxlength="30" />
													</div>
												</div>
											
												<div class="form-group">
													<label class="col-lg-3 control-label" for="id_nombre">Fecha de Nacimiento</label>
													<div class="col-lg-5">
														<input class="form-control" id="id_fechanacimiento"	name="fechaNacimiento" placeholder="Ingrese el nombre" type="date" maxlength="30" />
													</div>
												</div>
												<div class="form-group">
													<label class="col-lg-3 control-label" for="id_correo">Fecha de Registro</label>
													<div class="col-lg-5">
														<input class="form-control" id="id_correo"	name="fechaRegistro" placeholder="Ingrese el email" type="email" maxlength="30" />
													</div>
												</div>
												<div class="form-group">
													<label class="col-lg-3 control-label" for="id_celular">Celular</label>
													<div class="col-lg-5">
														<input class="form-control" id="id_celular"	name="celular" placeholder="Ingrese el email" type="number" maxlength="30" />
													</div>
												</div>
												<div class="form-group">
													<label class="col-lg-3 control-label" for="id_direccion">Estado</label>
													<div class="col-lg-5">
														<input class="form-control" id="id_direccion"	name="estado" placeholder="Ingrese la direccion" type="text" maxlength="30" />
													</div>
												</div>
												<div class="form-group">
													<label class="col-lg-3 control-label" for="id_direccion">Direccion</label>
													<div class="col-lg-5">
														<input class="form-control" id="id_direccion"	name="direccion" placeholder="Ingrese la direccion" type="text" maxlength="30" />
													</div>
												</div>
												
												<div class="form-group">
													<label class="col-lg-3 control-label" for="id_login">Login</label>
													<div class="col-lg-5">
														<input class="form-control" id="id_login"	name="login" placeholder="Ingrese el login" type="text" maxlength="30" />
													</div>
												</div>
												<div class="form-group">
													<label class="col-lg-3 control-label" for="id_password">Contraseña</label>
													<div class="col-lg-5">
														<input class="form-control" id="id_password"	name="password" placeholder="Ingrese el password" type="password" maxlength="30" />
													</div>
												</div>
												<div class="form-group">
													<label class="col-lg-3 control-label" for="id_dni">DNI</label>
													<div class="col-lg-5">
														<input class="form-control" id="id_dni"	name="dni" placeholder="Ingrese el dni" type="number" maxlength="30" />
													</div>
												</div>
												<div class="form-group">
													<label class="col-lg-3 control-label" for="id_tipo_usuario">Tipo de Usuario</label>
													<div class="col-lg-5">
														<select id="id_tipo_usuario" name="tipoUsuario" class='form-control'> 
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
								<span class="glyphicon glyphicon-ok-sign"></span> Actualiza Usuario
							</h4>
						</div>
						<div class="modal-body" style="padding: 20px 10px;">
							<form id="id_form_actualiza" accept-charset="UTF-8"
								action="registraActualizaCrudUsuario" class="form-horizontal"
								method="post">
								<div class="panel-group" id="steps">
									<!-- Step 1 -->
									<div class="panel panel-default">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a data-toggle="collapse" data-parent="#steps"
													href="#stepOne">Datos de Usuario</a>
											</h4>
										</div>
										<div id="stepOne" class="panel-collapse collapse in">
											<div class="panel-body">
												<div class="form-group">
													<label class="col-lg-3 control-label" for="id_ID">ID</label>
													<div class="col-lg-5">
														<input class="form-control" id="id_ID" readonly="readonly"
															name="idUsuario" type="text" maxlength="8" />
													</div>
												</div>
												<div class="form-group">
													<label class="col-lg-3 control-label" for="id_act_nombre">Nombre</label>
													<div class="col-lg-5">
														<input class="form-control" id="id_act_nombre" name="nombres" placeholder="Ingrese el nombre" type="text" maxlength="30"  />
													</div>
												</div>
												<div class="form-group">
													<label class="col-lg-3 control-label" for="id_act_materno">Apellido Materno</label>
													<div class="col-lg-5">
														<input class="form-control" id="id_act_materno"	name="amaterno" placeholder="Ingrese el apellido materno" type="text" maxlength="30" />
													</div>
												</div>
												<div class="form-group">
													<label class="col-lg-3 control-label" for="id_act_paterno">Apellido Paterno</label>
													<div class="col-lg-5">
														<input class="form-control" id="id_act_paterno"	name="apaterno" placeholder="Ingrese el apellido paterno" type="text" maxlength="30" />
													</div>
												</div>
												
												<div class="form-group">
													<label class="col-lg-3 control-label" for="id_act_fechanacimienot">Fecha de Nacimiento</label>
													<div class="col-lg-5">
														<input class="form-control" id="id_act_fechanacimienot"	name="fechaNacimiento" placeholder="Ingrese el nombre" type="date" maxlength="30" />
													</div>
												</div>
												<div class="form-group">
													<label class="col-lg-3 control-label" for="id_act_fechanacimienot">Fecha de Registro</label>
													<div class="col-lg-5">
														<input class="form-control" id="id_act_fecharegistro"	name="fechaRegistro" placeholder="Ingrese el nombre" type="date" maxlength="30" />
													</div>
												</div>
												
												<div class="form-group">
													<label class="col-lg-3 control-label" for="id_act_celular">Celular</label>
													<div class="col-lg-5">
														<input class="form-control" id="id_act_celular"	name="celular" placeholder="Ingrese el celular" type="number" maxlength="30" />
													</div>
												</div>
												<div class="form-group">
													<label class="col-lg-3 control-label" for="id_act_estado">Estado</label>
													<div class="col-lg-5">
														<input class="form-control" id="id_act_estado"	name="estado" placeholder="Ingrese el estado" type="text" maxlength="30" />
													</div>
												</div>
												<div class="form-group">
													<label class="col-lg-3 control-label" for="id_act_direccion">Direccion</label>
													<div class="col-lg-5">
														<input class="form-control" id="id_act_direccion"	name="direccion" placeholder="Ingrese la direccion" type="text" maxlength="30" />
													</div>
												</div>
											
												<div class="form-group">
													<label class="col-lg-3 control-label" for="id_act_login">Login</label>
													<div class="col-lg-5">
														<input class="form-control" id="id_act_login"	name="login" placeholder="Ingrese el login" type="text" maxlength="30" />
													</div>
												</div>
												<div class="form-group">
													<label class="col-lg-3 control-label" for="id_act_password">Contraseña</label>
													<div class="col-lg-5">
														<input class="form-control" id="id_act_password"	name="password" placeholder="Ingrese el password" type="password" maxlength="30" />
													</div>
												</div>
													<div class="form-group">
													<label class="col-lg-3 control-label" for="id_act_dni">DNI</label>
													<div class="col-lg-5">
														<input class="form-control" id="id_act_dni"	name="dni" placeholder="Ingrese el dni" type="number" maxlength="30" />
													</div>
												</div>
												<div class="form-group">
													<label class="col-lg-3 control-label" for="id_act_tipo_usuario">Tipo de Usuario</label>
													<div class="col-lg-5">
														<select id="id_act_tipo_usuario" name="tipoUsuario" class='form-control'> 
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

$.getJSON("listaTipoUsuario",{},function(data){
	$.each(data,function(i, obj){
		$("#id_tipo_usuario").append("<option value='" + obj.idTipoUsuario+ "'>"+obj.nombre+"</option>");
		$("#id_act_tipo_usuario").append("<option value='" + obj.idTipoUsuario+ "'>"+obj.nombre+"</option>");
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

function editar(id,nombres,amaterno,apaterno,fechaNacimiento,fechaRegistro,celular,estado,direccion,login,password,dni,idTipoUsuario){
	$('input[id=id_ID]').val(id);
	$('input[id=id_act_nombre]').val(nombres);
	$('input[id=id_act_materno]').val(amaterno);
	$('input[id=id_act_paterno]').val(apaterno);
	$('input[id=id_act_fechanacimienot]').val(fechaNacimiento);
	$('input[id=id_act_fecharegistro]').val(fechaRegistro);
	$('input[id=id_act_celular]').val(celular);
	$('input[id=id_act_estado]').val(estado);
	$('input[id=id_act_direccion]').val(direccion);
	$('input[id=id_act_login]').val(login);
	$('input[id=id_act_password]').val(password);
	$('input[id=id_act_dni]').val(dni);
	$('select[id=id_act_tipo_usuario]').val(idTipoUsuario);
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




