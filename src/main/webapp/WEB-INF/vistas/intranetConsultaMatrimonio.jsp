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
<h3>Consulta Matrimonio</h3>
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
							<a href="/exportmatrimonio/all" class="btn btn-danger">EXPORTAR EXCEL</a>
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



