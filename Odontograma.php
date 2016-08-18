<!DOCTYPE html>
<html lang="es">
	<head>
		<meta charset="utf-8"/>
		<title>Odontograma</title>

		<link rel="icon" type="image/png" href="./css/img/icon.png" />
		
		<link rel="stylesheet" type="text/css" href="./css/normalize.css"/>
		<link rel="stylesheet" type="text/css" href="./bootstrap-3.3.6-dist/css/bootstrap.min.css"/>
		<link rel="stylesheet" type="text/css" href="./font-awesome-4.5.0/css/font-awesome.min.css"/>
		<link rel="stylesheet" type="text/css" href="./css/styles.css"/>
		<link rel="stylesheet" type="text/css" href="./css/stylesOdontograma.css"/>
		<link rel="stylesheet" type="text/css" href="./css/stylesMenu.css"/>
 		<link rel="stylesheet" type="text/css" href="./css/stylesFigurePaint.css"/>
 		<link rel="stylesheet" type="text/css" href="./css/stylesHistory.css"/>

		
		<script>
			var PACIENTE = <?php echo $_GET["paciente"]; ?>;
			var CITA 	 = <?php echo $_GET["cita"]; ?>;
		</script>

		<script type="text/javascript" src="./js/jquery-1.12.3.min.js"></script>
		<script type="text/javascript" src="./js/prefixfree.min.js"></script>
		<script type="text/javascript" src="./bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="./js/bootbox.min.js"></script>
		<script type="text/javascript" src="./js/Methods.js"></script>
		<script type="text/javascript" src="./js/codigo.js"></script>
 		<script type="text/javascript" src="./js/ObjectFigures.js"></script>
		
	</head>
	<body>
	
		<ul class="nav nav-tabs" data-tabs="tabs">
			<li id="tabInfoPaciente" class="active"><a href="#ContentForm" data-toggle="tab">Paciente</a></li>
			<li id="tabOdontograma"><a href="#ContentOdontograma" data-toggle="tab">Odontograma</a></li>
			<li id="tabInfoSeguimiento"><a href="#ContentSeguimiento" data-toggle="tab">Seguimiento</a></li>
		</ul>
		
		<div id="my-tab-content" class="tab-content">
			
			<section class="tab-pane active" id="ContentForm">
				
				<h2 class="text-center">Historia Clínica Odontológica</h2>

				<div id="ContentFormFirts">
					
					<div class="row">
						<div class="col-md-4" id="pacienteIps">
							<div class="panel panel-info">
							  <div class="panel-heading">
							    <h3 class="panel-title">Nombre de la IPS</h3>
							  </div>
							  <div class="panel-body">
							  </div>
							</div>
						</div>
						<div class="col-md-2" id="numhc">
							<div class="panel panel-info">
							  <div class="panel-heading">
							    <h3 class="panel-title">Número de la HC</h3>
							  </div>
							  <div class="panel-body">
							  </div>
							</div>
						</div>
						<div class="col-md-2" id="iniciotratamiento">
							<div class="panel panel-info">
							  <div class="panel-heading">
							    <h3 class="panel-title">Fecha inicio tratamiento</h3>
							  </div>
							  <div class="panel-body">
							  </div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4" id="Apellidos">
							<div class="panel panel-info">
							  <div class="panel-heading">
							    <h3 class="panel-title">Apellidos</h3>
							  </div>
							  <div class="panel-body">
							  </div>
							</div>
						</div>
						<div class="col-md-4" id="Nombres">
							<div class="panel panel-info">
							  <div class="panel-heading">
							    <h3 class="panel-title">Nombres</h3>
							  </div>
							  <div class="panel-body">
							  </div>
							</div>
						</div>						
					</div>
					<div class="row">
						<div class="col-md-2" id="Identificacion">
							<div class="panel panel-info">
							  <div class="panel-heading">
							    <h3 class="panel-title">Identificacion</h3>
							  </div>
							  <div class="panel-body">
							  </div>
							</div>
						</div>
						<div class="col-md-1" id="Sexo">
							<div class="panel panel-info">
							  <div class="panel-heading">
							    <h3 class="panel-title">Sexo</h3>
							  </div>
							  <div class="panel-body">
							  </div>
							</div>
						</div>
						<div class="col-md-1" id="Edad">
							<div class="panel panel-info">
							  <div class="panel-heading">
							    <h3 class="panel-title">Edad</h3>
							  </div>
							  <div class="panel-body">
							  </div>
							</div>
						</div>						
						<div class="col-md-4" id="FechaNacimiento">
							<div class="panel panel-info">
							  <div class="panel-heading">
							    <h3 class="panel-title">Fecha de nacimiento</h3>
							  </div>
							  <div class="panel-body">
							  </div>
							</div>
						</div>						
					</div>
					<div class="row">
						<div class="col-md-3" id="Ocupacion">
							<div class="panel panel-info">
							  <div class="panel-heading">
							    <h3 class="panel-title">Ocupación</h3>
							  </div>
							  <div class="panel-body">
							  </div>
							</div>
						</div>
						<div class="col-md-1" id="EstadoCivil">
							<div class="panel panel-info">
							  <div class="panel-heading">
							    <h3 class="panel-title">Estado civil</h3>
							  </div>
							  <div class="panel-body">
							  </div>
							</div>
						</div>
						<div class="col-md-2" id="tipoPaciente">
							<div class="panel panel-info">
							  <div class="panel-heading">
							    <h3 class="panel-title">Tipo de usuario</h3>
							  </div>
							  <div class="panel-body">
							  </div>
							</div>
						</div>
						<div class="col-md-2" id="pacienteEps">
							<div class="panel panel-info">
							  <div class="panel-heading">
							    <h3 class="panel-title">Aseguradora</h3>
							  </div>
							  <div class="panel-body">
							  </div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4" id="Direccion">
							<div class="panel panel-info">
							  <div class="panel-heading">
							    <h3 class="panel-title">Dirección de la residencia</h3>
							  </div>
							  <div class="panel-body">
							  </div>
							</div>
						</div>
						<div class="col-md-2" id="Telefonos">
							<div class="panel panel-info">
							  <div class="panel-heading">
							    <h3 class="panel-title">Telefono</h3>
							  </div>
							  <div class="panel-body">
							  </div>
							</div>
						</div>
						<div class="col-md-2" id="Municipio">
							<div class="panel panel-info">
							  <div class="panel-heading">
							    <h3 class="panel-title">Municipio</h3>
							  </div>
							  <div class="panel-body">
							  </div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4" id="Responsable">
							<div class="panel panel-info">
							  <div class="panel-heading">
							    <h3 class="panel-title">Persona responsable</h3>
							  </div>
							  <div class="panel-body">
							  </div>
							</div>
						</div>
						<div class="col-md-4" id="TelResponsable">
							<div class="panel panel-info">
							  <div class="panel-heading">
							    <h3 class="panel-title">Telefono persona responsable</h3>
							  </div>
							  <div class="panel-body">
							  </div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-11" id="motivoSimple">
							<div class="panel panel-info">
							  <div class="panel-heading">
							    <h3 class="panel-title">Motivo de consulta</h3>
							  </div>
							  <div class="panel-body">
							  </div>
							</div>
						</div>				
					</div>
					<div class="row">
						<div class="col-md-11" id="MotivoAmpliado">
							<div class="panel panel-info">
							  <div class="panel-heading">
							    <h3 class="panel-title">Evolución y estado actual (Ampliación motivo de consulta - reporte de síntomas)</h3>
							  </div>
							  <div class="panel-body">  
							  </div>
							</div>
						</div>			
					</div>
					<div class="row">
						<div class="col-md-11" id="antecedenteFamiliar">
							<div class="panel panel-info">
							  <div class="panel-heading">
							    <h3 class="panel-title">Antecedentes familiares</h3>
							  </div>
							  <div class="panel-body">
							  </div>
							</div>
						</div>
					</div>


				</div>
				<div id="ContentFormSecond">
					<h2 class="text-center">Antecedentes Odontológicos y Médicos Generales</h2>
										
					<div class="panel panel-primary">						
						<div class="panel-heading">
							<h3 class="panel-title">Antecedentes generales</h3>
						</div>
						<div id="contentAntecedentesGenerales" class="row panel-body">

						</div>
					</div>
					<div class="panel panel-primary">						
						<div class="panel-heading">
							<h3 class="panel-title">Examen estomatológico</h3>
						</div>
						<div id="contentAntecedentesEstomatologico" class=" row panel-body">

						</div>
					</div>
					<div class="panel panel-primary">						
						<div class="panel-heading">
							<h3 class="panel-title">Articulación temporo mandibular</h3>
						</div>
						<div id="contentAntecedentesHallazgo" class=" row panel-body">

						</div>
					</div>

				</div>
				
				

			</section><!-- fin contenido del formulario -->
				
			<section class="tab-pane" id="ContentOdontograma">
				
				<h2 class="text-center">ODONTOGRAMA</h2>
				<ul class="nav nav-tabs" data-tabs="tabs">
					<li id="tabDiagnosticos"><a href="#diagnosticos" data-toggle="tab">Diagnostico</a></li>
					<li id="tabTratamientos"><a href="#tratamientos" data-toggle="tab">Tratamiento</a></li>
					<li id="tabEvolutions"><a href="#evolucion" data-toggle="tab">Evolucion</a></li>
				</ul>
				
				<div id="my-tab-content" class="tab-content">
					
					<div class="tab-pane" id="diagnosticos" >
						<section class="ContentOdontograma">
							
							<div class="fileGroup contentTop">
								
								<div class="group groupleft topLeft text-right">
									
									<div class="subGroup groupBig Subgroupuprightadult">
										
									</div><!-- fin grupo superior derecho adultos -->
										
									<div class="subGroup groupLittle Subgroupuprightchild">
										
									</div><!-- fin grupo superior derecho ninos-->
								</div>
								<div class="group groupRigth topRigth">
									
									<div class="subGroup groupBig Subgroupupleftadult">
										
									</div><!-- fin grupo superior izquierdo adultos-->
									<div class="subGroup groupLittle Subgroupupleftchild">
											
									</div><!-- fin grupo superior izquierdo ninos -->
								</div>
							</div>
							<div class="fileGroup contentBot">
								
								<div class="group groupleft botLeft text-right">
									
									<div class="subGroup groupBig Subgroupdownrightadult">
										
									</div><!-- fin grupo inferior derecho-->
									<div class="subGroup groupLittle Subgroupdownrightchild">
											
									</div><!-- fin grupo inferior derecho ninos-->
								</div>
								<div class="group groupRigth botRigth">
											
									<div class="subGroup groupBig Subgroupdownleftadult">
												
									</div><!-- fin grupo inferior izquierdo adultos-->
									<div class="subGroup groupLittle Subgroupdownleftchild">
													
									</div><!-- fin grupo inferior izquierdo ninos-->
								</div>
							</div>
															<!-- <div id="ContentDiagnosticos"></div> -->
							<section class="procedureNullRepresentacion">
								
							</section>
						</section>
						<section  class="panel-group contentProcedures" id="diagnosticosMenu" role="tablist" aria-multiselectable="true">
							
						</section>
														
					</div><!-- fin diagnosticos-->
					<div class="tab-pane"  id="tratamientos">
						
						<section class="ContentOdontograma">
							<div class="fileGroup contentTop">
								
								<div class="group groupleft topLeft text-right">
									
									<div class="subGroup groupBig Subgroupuprightadult">
										
									</div><!-- fin grupo superior derecho adultos -->
										
									<div class="subGroup groupLittle Subgroupuprightchild">
										
									</div><!-- fin grupo superior derecho ninos-->
								</div>
								<div class="group groupRigth topRigth">
											
									<div class="subGroup groupBig Subgroupupleftadult">
												
									</div><!-- fin grupo superior izquierdo adultos-->
									<div class="subGroup groupLittle Subgroupupleftchild">
													
									</div><!-- fin grupo superior izquierdo ninos -->
								</div>
							</div>
							<div class="fileGroup contentBot">
								
								<div class="group groupleft botLeft text-right">
									
									<div class="subGroup groupBig Subgroupdownrightadult">
										
									</div><!-- fin grupo inferior derecho-->
									<div class="subGroup groupLittle Subgroupdownrightchild">
										
									</div><!-- fin grupo inferior derecho ninos-->
								</div>
								<div class="group groupRigth botRigth">
									
									<div class="subGroup groupBig Subgroupdownleftadult">
									
									</div><!-- fin grupo inferior izquierdo adultos-->
									<div class="subGroup groupLittle Subgroupdownleftchild">
											
									</div><!-- fin grupo inferior izquierdo ninos-->
								</div>
							</div>
							<section class="procedureNullRepresentacion">
								
							</section>
						</section>
						<section  class="panel-group contentProcedures" id="tratamientosMenu" role="tablist" aria-multiselectable="true">
							
						</section>
														
					</div><!-- fin tratamientos-->
					<div class="tab-pane"  id="evolucion">
						
						<section class="ContentOdontograma">
							
							<div class="fileGroup contentTop">
								
								<div class="group groupleft topLeft text-right">
									
									<div class="subGroup groupBig Subgroupuprightadult">
										
									</div><!-- fin grupo superior derecho adultos -->
									
									<div class="subGroup groupLittle Subgroupuprightchild">
										
									</div><!-- fin grupo superior derecho ninos-->
								</div>
								<div class="group groupRigth topRigth">
									
									<div class="subGroup groupBig Subgroupupleftadult">
										
									</div><!-- fin grupo superior izquierdo adultos-->
									<div class="subGroup groupLittle Subgroupupleftchild">
										
									</div><!-- fin grupo superior izquierdo ninos -->
								</div>
							</div>
							<div class="fileGroup contentBot">
												
								<div class="group groupleft botLeft text-right">
									
									<div class="subGroup groupBig Subgroupdownrightadult">
										
									</div><!-- fin grupo inferior derecho-->
									<div class="subGroup groupLittle Subgroupdownrightchild">
										
									</div><!-- fin grupo inferior derecho ninos-->
								</div>
								<div class="group groupRigth botRigth">
									
									<div class="subGroup groupBig Subgroupdownleftadult">
										
									</div><!-- fin grupo inferior izquierdo adultos-->
									<div class="subGroup groupLittle Subgroupdownleftchild">
										
									</div><!-- fin grupo inferior izquierdo ninos-->
								</div>
							</div>
						</section>
						<section class="procedureNullRepresentacion">
							
						</section>
														
					</div><!-- fin evolucion-->
				</div>
				<div class="container-fluid" id="ContentDescripcionEvol">
					
				</div>
				<button id="closeHistory" class="btn btn-default">Guardar</button>
			</section> <!-- Fin seccion del odontograma -->
			<section class="tab-pane" id="ContentSeguimiento">
				<h3>Contenido extra</h3>
			</section> <!-- Fin contenido seguimiento -->
		</div>
														
	</body>
</html>