<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
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


<title>Sistema Parroquia | ARPYNET</title>
</head>
<body>

<jsp:include page="intranetCabecera.jsp" />
<div class="container" style="margin-top: 4%">
<h3>Consulta Misas</h3>
<div class="col-md-23" >  
			  <form id="idFormElimina" action="eliminaCrudLibro">
			  		<input type="hidden" id="id_elimina" name="id">
			  </form>	
				
		       <form accept-charset="UTF-8"  action="consultaMisas" class="simple_form" id="defaultForm2"  method="post">
					<div class="row" style="height: 70px">
						<div class="col-md-2" >
								<input class="form-control" id="id_nonbre_filtro"  name="filtro" placeholder="Ingrese el codigo" type="text" maxlength="30"/>
						</div>
						<div class="col-md-2" >
							<button type="submit" class="btn btn-primary" style="width: 150px">FILTRA</button>
						</div>
						<div class="col-md-2">
							<a href="/export/all" class="btn btn-danger">EXPORTAR EXCEL</a>
						</div>
						<div class="col-md-2">
							<a href="#" class="btn btn-info">EXPORTAR PDF</a>
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
												<th>Precio</th>
												<th>Descripcion</th>
												<th>La misa es para: </th>
												<th>De quien : </th>
												<th>Fecha misa</th>
												<th>Tipo de misa</th>
												
											</tr>
										</thead>
											<tbody>
												    
												<c:forEach items="${sessionScope.misas}" var="x">
													<tr>
														<td>${x.idmisas}</td>
														<td>${x.precio}</td>
														<td>${x.descripcion}</td>
														<td>${x.paraquien}</td>
														<td>${x.dequien}</td>
														<td>${x.fechamisa}</td>
														<td>${x.tipoMisa.descripcion}</td>
													
														
													</tr>
												</c:forEach>
										</tbody>
										</table>	
									
								</div>	
						</div>
					</div>
		 		</form>
		  </div>




</div>
</body>
</html>



