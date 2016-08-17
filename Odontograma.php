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
		<link rel="stylesheet" type="text/css" href="./css/stylesMenu.css"/>
 		<link rel="stylesheet" type="text/css" href="./css/stylesFigurePaint.css"/>
 		<link rel="stylesheet" type="text/css" href="./css/stylesHistory.css"/>

		
		<script>
			var PACIENTE = <?php echo $_GET["paciente"]; ?>;
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
		
		<h1 class="text-center"> ODONTOLOGIA </h1>
		<ul class="nav nav-tabs" data-tabs="tabs">
			<li id="tabInfoPaciente" class="active"><a href="#ContentForm" data-toggle="tab">Paciente</a></li>
			<li id="tabOdontograma"><a href="#ContentOdontograma" data-toggle="tab">Odontograma</a></li>
			<li id="tabInfoSeguimiento"><a href="#ContentSeguimiento" data-toggle="tab">Seguimiento</a></li>
		</ul>
		
		<div id="my-tab-content" class="tab-content">
			
			<section class="tab-pane active" id="ContentForm">

				<div id="ContentFormFirts">
					<h2 class="text-center">Historia Clínica Odontológica</h2>
					
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
							    CC - 6855360
							  </div>
							</div>
						</div>
						<div class="col-md-1" id="Sexo">
							<div class="panel panel-info">
							  <div class="panel-heading">
							    <h3 class="panel-title">Sexo</h3>
							  </div>
							  <div class="panel-body">
							    Masculino
							  </div>
							</div>
						</div>
						<div class="col-md-1" id="Edad">
							<div class="panel panel-info">
							  <div class="panel-heading">
							    <h3 class="panel-title">Edad</h3>
							  </div>
							  <div class="panel-body">
							    25
							  </div>
							</div>
						</div>						
						<div class="col-md-4" id="FechaNacimiento">
							<div class="panel panel-info">
							  <div class="panel-heading">
							    <h3 class="panel-title">Fecha de nacimiento</h3>
							  </div>
							  <div class="panel-body">
							    05/09/1991
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
							    PENSIONADO 
							  </div>
							</div>
						</div>
						<div class="col-md-1" id="EstadoCivil">
							<div class="panel panel-info">
							  <div class="panel-heading">
							    <h3 class="panel-title">Estado civil</h3>
							  </div>
							  <div class="panel-body">
							    Casado
							  </div>
							</div>
						</div>
						<div class="col-md-2" id="tipoPaciente">
							<div class="panel panel-info">
							  <div class="panel-heading">
							    <h3 class="panel-title">Tipo de usuario</h3>
							  </div>
							  <div class="panel-body">
							    Cotizante
							  </div>
							</div>
						</div>
						<div class="col-md-2" id="pacienteEps">
							<div class="panel panel-info">
							  <div class="panel-heading">
							    <h3 class="panel-title">Aseguradora</h3>
							  </div>
							  <div class="panel-body">
							    NACIONAL
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
							    Tv 15 Dig 1 1 100 B GALILEA
							  </div>
							</div>
						</div>
						<div class="col-md-2" id="Telefonos">
							<div class="panel panel-info">
							  <div class="panel-heading">
							    <h3 class="panel-title">Telefono</h3>
							  </div>
							  <div class="panel-body">
							    7864396- 3107058984
							  </div>
							</div>
						</div>
						<div class="col-md-2" id="Municipio">
							<div class="panel panel-info">
							  <div class="panel-heading">
							    <h3 class="panel-title">Municipio</h3>
							  </div>
							  <div class="panel-body">
							    Sincelejo
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
							    MANUELA BILLALVA
							  </div>
							</div>
						</div>
						<div class="col-md-4" id="TelResponsable">
							<div class="panel panel-info">
							  <div class="panel-heading">
							    <h3 class="panel-title">Telefono persona responsable</h3>
							  </div>
							  <div class="panel-body">
							    7864396
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
							    " ME MOLESTA UNA MUELITA "  
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
							    PACIENTE REFIERE ODONTALGIA LEVE TIPO SENSIBILIDAD QUE APARECIO DE FORMA INCIDIOSA E INTERMITENTE; EL CUAL ES PROVOCADO Y SE EXACERBA CON LOS CAMBIOS TERMICOS; CUYA INTENSIDAD ES TOLERABLE; LOCALIZADO EN ÁREA PREMOLAR INFERIOR DERECHA DE 3 MESES DE EVOLUCIÓN. ULTIMA VISITA ODONTOLOGICA HACE 3 AÑOS POR OPERATORIA DENTAL.   
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
							    LINEA MATERNA: HIPERTENSION  
							  </div>
							</div>
						</div>
					</div>


				</div>
				<div id="ContentFormSecond">
					<h2 class="text-center">Antecedentes Odontológicos y Médicos Generales</h2>
				</div>
				
				<!-- <div id="ContentFormFirts">
					<h2>Historia Clínica Odontológica</h2>
					<table border="0" cellspacing="0" cellpadding="2">
						<tbody>
							<tr>
								<td>
									<table border="1" cellspacing="0" cellpadding="2">
										<tbody>
										<tr>
											<td>
												Regional<br>
												<input type="text" name="txtRegional" value="Noroccidente" size="20" maxlength="100" readonly="">
											</td>
											<td colspan="3">
												Nombre de la IPS<br>
												<input type="text" name="txtNombreIPS" value="Promosalud Del Sinu Ltda " size="60" maxlength="100" readonly="">
											</td>
											<td>
												Número de la HC<br>
												<input type="text" name="txtNumeroHC" value="116152819" size="20" maxlength="100" readonly="">
											</td>
										</tr>
										<tr>
											<td>
												Primer apellido<br>
												<input type="text" name="txtPrimerApellido" value="Cordero" size="20" maxlength="100" readonly="">
											</td>
											<td>
												Segundo apellido<br>
												<input type="text" name="txtSegundoApellido" value="Guerra" size="20" maxlength="100" readonly="">
											</td>
											<td colspan="2">
												Nombre(s)<br>
												<input type="text" name="txtNombres" value="Adalberto Mariano" size="40" maxlength="100" readonly="">
											</td>
											<td>
												Fecha inicio tratamiento<br>
												<input type="text" name="txtFechaInicioTratamiento" value="2015-08-26 00:00:00" size="20" maxlength="100" readonly="">
											</td>
										</tr>
										<tr>
											<td>
												Identificacion<br>
												<input type="text" name="txtIdentificacion" value="CC - 6855360" size="20" maxlength="100" readonly="">
											</td>
											<td>
												Sexo<br>
												<input type="text" name="txtSexo" value="Masculino" size="20" maxlength="100" readonly="">
											</td>
											<td>
												Edad<br>
												<input type="text" name="txtEdad" value="74 Años" size="10" maxlength="10" readonly="">
											</td>
											<td>
												Tipo de usuario<br>
												<input type="text" name="txtTipoUsuario" value="Cotizante" size="20" maxlength="100" readonly="">
											</td>
											<td>
												Rango<br>
												<input type="text" name="txtRango" value="Rango 2 ( Estrato 2 Y 3)" size="20" readonly="">
											</td>
										</tr>
										<tr>
											<td colspan="2">
												Ocupación<br>
												<input type="hidden" name="respuesta[20021][codigo]" value="1" disabled="">
												<input type="text" name="respuesta[20021][valor]" value="PENSIONADO" size="40" maxlength="100" readonly="">
											</td>
											<td>
												Estado civil<br>
												<select name="respuesta[26320]" disabled="">
													<option value=""></option>
													<option value="202">Soltera (o)</option>
													<option value="203">Union libre</option>
													<option value="204" selected="">Casada (o)</option>
													<option value="205">Separada (o)</option>
												</select>
											</td>
											<td>
												Fecha nacimiento<br>
												<input type="hidden" name="respuesta[28200][codigo]" value="1" disabled="">
												<input type="text" name="respuesta[28200][valor]" value="17" size="2" maxlength="2" readonly=""> /
												<input type="hidden" name="respuesta[28201][codigo]" value="1" disabled="">
												<input type="text" name="respuesta[28201][valor]" value="11" size="2" maxlength="2" readonly=""> /
												<input type="hidden" name="respuesta[28202][codigo]" value="1" disabled="">
												<input type="text" name="respuesta[28202][valor]" value="1944" size="4" maxlength="4" readonly="">
											</td>
											<td>
												Aseguradora<br>
												<input type="hidden" name="respuesta[38714][codigo]" value="1" disabled="">
												<input type="text" name="respuesta[38714][valor]" value="NACIONAL" size="20" maxlength="100" readonly="">
											</td>
										</tr>
										<tr>
											<td colspan="2">
												Dirección de la residencia<br>
												<input type="hidden" name="respuesta[20027][codigo]" value="1" disabled="">
												<input type="text" name="respuesta[20027][valor]" value="Tv 15 Dig 1 1 100 B GALILEA" size="40" maxlength="100" readonly="">
											</td>
											<td>
												Telefono<br>
												<input type="hidden" name="respuesta[20028][codigo]" value="1" disabled="">
												<input type="text" name="respuesta[20028][valor]" value="7864396- 3107058984" size="20" maxlength="100" readonly="">
											</td>
											<td colspan="2">
												Municipio<br>
												<input type="hidden" name="respuesta[20025][codigo]" value="1" disabled="">
												<input type="text" name="respuesta[20025][valor]" value="Monteria" size="40" maxlength="100" readonly="">
											</td>
										</tr>
										<tr>
											<td colspan="3">
												Persona responsable<br>
												<input type="hidden" name="respuesta[26360][codigo]" value="1" disabled="">
												<input type="text" name="respuesta[26360][valor]" value="MANUELA BILLALVA" size="60" maxlength="100" readonly="">
											</td>
											<td colspan="2">
												Telefono persona responsable<br>
												<input type="hidden" name="respuesta[38715][codigo]" value="1" disabled="">
												<input type="text" name="respuesta[38715][valor]" value="7864396" size="20" maxlength="100" readonly="">
											</td>
										</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td style="padding-top: 12px;">
									<table border="1" cellspacing="0" cellpadding="2" width="100%">
										<tbody><tr>
											<td>
												<u>Motivo de consulta:</u><br>
												<input type="hidden" name="respuesta[21000][codigo]" value="1" disabled="">
												
											" ME MOLESTA UNA MUELITA " &nbsp;</td>
										</tr>
										<tr>
											<td>
												<u>Evolución y estado actual (Ampliación motivo de consulta - reporte de síntomas):</u><br>
												<input type="hidden" name="respuesta[21010][codigo]" value="1" disabled="">
												
											PACIENTE REFIERE ODONTALGIA LEVE TIPO SENSIBILIDAD QUE APARECIO DE FORMA INCIDIOSA E INTERMITENTE; EL CUAL ES PROVOCADO Y SE EXACERBA CON  LOS CAMBIOS TERMICOS; CUYA INTENSIDAD ES TOLERABLE; LOCALIZADO   EN ÁREA PREMOLAR INFERIOR DERECHA  DE 3 MESES DE  EVOLUCIÓN. ULTIMA VISITA ODONTOLOGICA HACE  3 AÑOS POR OPERATORIA DENTAL. &nbsp;</td>
										</tr>
										<tr>
											<td>
												<u>Antecedentes familiares:</u><br>
												<input type="hidden" name="respuesta[21810][codigo]" value="1" disabled="">
												
											LINEA MATERNA: HIPERTENSION &nbsp;</td>
										</tr>
									</tbody></table>
								</td>
							</tr>
						</tbody>
					</table>
					<button>Guardar</button>
				</div> -->
				<div id="ContentFormSecond">
					<h2>Antecedentes Odontológicos y Médicos Generales</h2>
					<table border="1" cellspacing="0" cellpadding="2" id="tablaAntecedentesOdonto">
						<tbody><tr>
							<th>&nbsp;</th>
							<th>Si</th>
							<th>No</th>
							<th>
								Observaciones<br>
								<span style="font-weight: normal; font-size: smaller;">(Si contesta afirmativamente, debe diligenciar las observaciones)</span>
							</th>
						</tr>
						<tr>
							<td>Alergias</td>
							<td><input type="radio" name="respuesta[38720]" value="1" disabled=""></td>
							<td><input type="radio" name="respuesta[38720]" value="8" checked="" disabled=""></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>Discrasias sanguíneas</td>
							<td><input type="radio" name="respuesta[38750]" value="1" disabled=""></td>
							<td><input type="radio" name="respuesta[38750]" value="8" checked="" disabled=""></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>Cardiopatías</td>
							<td><input type="radio" name="respuesta[38780]" value="1" disabled=""></td>
							<td><input type="radio" name="respuesta[38780]" value="8" checked="" disabled=""></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>Embarazo</td>
							<td><input type="radio" name="respuesta[38810]" value="1" disabled=""></td>
							<td><input type="radio" name="respuesta[38810]" value="8" checked="" disabled=""></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>Alteraciones presión arterial</td>
							<td><input type="radio" name="respuesta[38840]" value="1" checked="" disabled=""></td>
							<td><input type="radio" name="respuesta[38840]" value="8" disabled=""></td>
							<td>HIPERTENSO CONTROLADO&nbsp;</td>
						</tr>
						<tr>
							<td>Toma de medicamentos</td>
							<td><input type="radio" name="respuesta[38870]" value="1" checked="" disabled=""></td>
							<td><input type="radio" name="respuesta[38870]" value="8" disabled=""></td>
							<td>LOSARTAN, METROPROLOL, ASAWIN, AMLODIPINO&nbsp;</td>
						</tr>
						<tr>
							<td>Tratamiento médico actual</td>
							<td><input type="radio" name="respuesta[38900]" value="1" checked="" disabled=""></td>
							<td><input type="radio" name="respuesta[38900]" value="8" disabled=""></td>
							<td>POR CONTROL DE HIPERTENSION&nbsp;</td>
						</tr>
						<tr>
							<td>Hepatitis</td>
							<td><input type="radio" name="respuesta[38730]" value="1" disabled=""></td>
							<td><input type="radio" name="respuesta[38730]" value="8" checked="" disabled=""></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>Diabetes</td>
							<td><input type="radio" name="respuesta[38760]" value="1" disabled=""></td>
							<td><input type="radio" name="respuesta[38760]" value="8" checked="" disabled=""></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>Fiebre reumática</td>
							<td><input type="radio" name="respuesta[38790]" value="1" disabled=""></td>
							<td><input type="radio" name="respuesta[38790]" value="8" checked="" disabled=""></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>HIV - SIDA</td>
							<td><input type="radio" name="respuesta[38820]" value="1" disabled=""></td>
							<td><input type="radio" name="respuesta[38820]" value="8" checked="" disabled=""></td>
							<td>NO SE HA REALIZADO LA PRUEBA&nbsp;</td>
						</tr>
						<tr>
							<td>Inmunosupresión</td>
							<td><input type="radio" name="respuesta[38850]" value="1" disabled=""></td>
							<td><input type="radio" name="respuesta[38850]" value="8" checked="" disabled=""></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>Patologías renales</td>
							<td><input type="radio" name="respuesta[38880]" value="1" disabled=""></td>
							<td><input type="radio" name="respuesta[38880]" value="8" checked="" disabled=""></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>Patologías respiratorias</td>
							<td><input type="radio" name="respuesta[38910]" value="1" disabled=""></td>
							<td><input type="radio" name="respuesta[38910]" value="8" checked="" disabled=""></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>Trastornos gástricos</td>
							<td><input type="radio" name="respuesta[38740]" value="1" disabled=""></td>
							<td><input type="radio" name="respuesta[38740]" value="8" checked="" disabled=""></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>Trastornos emocionales</td>
							<td><input type="radio" name="respuesta[38770]" value="1" disabled=""></td>
							<td><input type="radio" name="respuesta[38770]" value="8" checked="" disabled=""></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>Sinusitis</td>
							<td><input type="radio" name="respuesta[38800]" value="1" disabled=""></td>
							<td><input type="radio" name="respuesta[38800]" value="8" checked="" disabled=""></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>Cirugías (incluso orales)</td>
							<td><input type="radio" name="respuesta[38830]" value="1" checked="" disabled=""></td>
							<td><input type="radio" name="respuesta[38830]" value="8" disabled=""></td>
							<td>HERNIA INGUINAL&nbsp;</td>
						</tr>
						<tr>
							<td>Exodoncias</td>
							<td><input type="radio" name="respuesta[38860]" value="1" checked="" disabled=""></td>
							<td><input type="radio" name="respuesta[38860]" value="8" disabled=""></td>
							<td>REFIERE EL PACIENTE SIN COMPLICACIONES&nbsp;</td>
						</tr>
						<tr>
							<td>Enfermedades orales</td>
							<td><input type="radio" name="respuesta[38890]" value="1" checked="" disabled=""></td>
							<td><input type="radio" name="respuesta[38890]" value="8" disabled=""></td>
							<td>ANTECEDENTES  DE CARIES DENTAL&nbsp;</td>
						</tr>
						<tr>
							<td>Uso de protesis o aparatologia oral</td>
							<td><input type="radio" name="respuesta[38920]" value="1" checked="" disabled=""></td>
							<td><input type="radio" name="respuesta[38920]" value="8" disabled=""></td>
							<td>PROTESIS REMOVIBLE SUPERIOR&nbsp;</td>
						</tr>
						<tr>
							<td colspan="4" style="padding-top: 6px;">
								<u>Hábitos y otras patologías o antecedentes odontológicos o médicos:</u><br>
								<input type="hidden" name="respuesta[38930][codigo]" value="1" disabled="">
								
							HABITO DE BRUXISMO&nbsp;</td>
						</tr>
					</tbody></table>
					<table border="1" cellspacing="0" cellpadding="2" id="tablaExamenEstomatologico">
						<tbody><tr><th colspan="4">Examen estomatológico</th></tr>
						<tr>
							<th rowspan="2">Estructura</th>
							<th colspan="2">Sintomatico</th>
							<th rowspan="2">
								Observaciones<br>
								<span style="font-weight: normal; font-size: smaller;">(Si contesta afirmativamente, debe diligenciar las observaciones)</span>
							</th>
						</tr>
						<tr>
							<th>Si</th>
							<th>No</th>
						</tr>
						<tr>
							<td>Labio inferior</td>
							<td><input type="radio" name="respuesta[38950]" value="1" disabled=""></td>
							<td><input type="radio" name="respuesta[38950]" value="8" checked="" disabled=""></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>Labio superior</td>
							<td><input type="radio" name="respuesta[38960]" value="1" disabled=""></td>
							<td><input type="radio" name="respuesta[38960]" value="8" checked="" disabled=""></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>Comisuras</td>
							<td><input type="radio" name="respuesta[38970]" value="1" disabled=""></td>
							<td><input type="radio" name="respuesta[38970]" value="8" checked="" disabled=""></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>Mucosa oral</td>
							<td><input type="radio" name="respuesta[38980]" value="1" disabled=""></td>
							<td><input type="radio" name="respuesta[38980]" value="8" checked="" disabled=""></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>Surcos yugales</td>
							<td><input type="radio" name="respuesta[38990]" value="1" disabled=""></td>
							<td><input type="radio" name="respuesta[38990]" value="8" checked="" disabled=""></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>Frenillos</td>
							<td><input type="radio" name="respuesta[39000]" value="1" disabled=""></td>
							<td><input type="radio" name="respuesta[39000]" value="8" checked="" disabled=""></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>Orofaringe</td>
							<td><input type="radio" name="respuesta[39010]" value="1" disabled=""></td>
							<td><input type="radio" name="respuesta[39010]" value="8" checked="" disabled=""></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>Paladar</td>
							<td><input type="radio" name="respuesta[39020]" value="1" disabled=""></td>
							<td><input type="radio" name="respuesta[39020]" value="8" checked="" disabled=""></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>Glándulas salivales</td>
							<td><input type="radio" name="respuesta[39030]" value="1" disabled=""></td>
							<td><input type="radio" name="respuesta[39030]" value="8" checked="" disabled=""></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>Piso de boca</td>
							<td><input type="radio" name="respuesta[39040]" value="1" disabled=""></td>
							<td><input type="radio" name="respuesta[39040]" value="8" checked="" disabled=""></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>Dorso de lengua</td>
							<td><input type="radio" name="respuesta[39050]" value="1" disabled=""></td>
							<td><input type="radio" name="respuesta[39050]" value="8" checked="" disabled=""></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>Vientre de lengua</td>
							<td><input type="radio" name="respuesta[39060]" value="1" disabled=""></td>
							<td><input type="radio" name="respuesta[39060]" value="8" checked="" disabled=""></td>
							<td>&nbsp;</td>
						</tr>
						<tr><td colspan="4">&nbsp;</td></tr>
						<tr><th colspan="4">Articulación temporo mandibular</th></tr>
						<tr>
							<th rowspan="2">Hallazgos clínicos</th>
							<th colspan="2">Presente</th>
							<th rowspan="2">
								Observaciones<br>
								<span style="font-weight: normal; font-size: smaller;">(Si contesta afirmativamente, debe diligenciar las observaciones)</span>
							</th>
						</tr>
						<tr>
							<th>Si</th>
							<th>No</th>
						</tr>
						<tr>
							<td>Ruidos</td>
							<td><input type="radio" name="respuesta[39080]" value="1" disabled=""></td>
							<td><input type="radio" name="respuesta[39080]" value="8" checked="" disabled=""></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>Desviación</td>
							<td><input type="radio" name="respuesta[39090]" value="1" disabled=""></td>
							<td><input type="radio" name="respuesta[39090]" value="8" checked="" disabled=""></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>Cambio de volumen</td>
							<td><input type="radio" name="respuesta[39100]" value="1" disabled=""></td>
							<td><input type="radio" name="respuesta[39100]" value="8" checked="" disabled=""></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>Bloqueo mandibular</td>
							<td><input type="radio" name="respuesta[39110]" value="1" disabled=""></td>
							<td><input type="radio" name="respuesta[39110]" value="8" checked="" disabled=""></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>Limitación de apertura</td>
							<td><input type="radio" name="respuesta[39120]" value="1" disabled=""></td>
							<td><input type="radio" name="respuesta[39120]" value="8" checked="" disabled=""></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>Dolor articular</td>
							<td><input type="radio" name="respuesta[39130]" value="1" disabled=""></td>
							<td><input type="radio" name="respuesta[39130]" value="8" checked="" disabled=""></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>Dolor muscular</td>
							<td><input type="radio" name="respuesta[39140]" value="1" disabled=""></td>
							<td><input type="radio" name="respuesta[39140]" value="8" checked="" disabled=""></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td colspan="4" align="center" style="padding: 6px 4px 6px 4px;">
								<input type="button" name="Guardar" value="Guardar Respuestas" onclick="grabarRespuestasCuestionario()" disabled="">
							</td>
						</tr>
						<tr>
							<td colspan="9" align="center">
								<table border="1" cellpadding="2" cellspacing="0" width="70%">
									<tbody><tr><th colspan="9">Indice COPS</th></tr>
									<tr>
										<td>Sanos</td>
										<td align="center">Cariados no cavitacional (C1)</td>
										<td align="center">Cariados Cavitacional (C2)</td>
										<td align="center">Obturados (O)</td>
										<td align="center">Perdidos Por caries (P)</td>
										<td align="center">Perdidos otra razon (K)</td>
										<td align="center">Total Dientes Presentes</td>
										<td align="center">COP (C2+O+P)</td>
										<td align="center">COP Modificado (C1+C2+O+P)</td>
									</tr>
									<tr>
										<td align="center"><input type="text" name="txtIndiceCOPSSanos" value="12" size="6" maxlength="5" readonly=""></td>
										<td align="center"><input type="text" name="txtIndiceCOPSCariadosC1" value="0" size="6" maxlength="5" readonly=""></td>
										<td align="center"><input type="text" name="txtIndiceCOPSCariados" value="0" size="6" maxlength="5" readonly=""></td>
										<td align="center"><input type="text" name="txtIndiceCOPSObturados" value="8" size="6" maxlength="5" readonly=""></td>
										<td align="center"><input type="text" name="txtIndiceCOPSExfoliados" value="0" size="6" maxlength="5" readonly=""></td>
										<td align="center"><input type="text" name="txtIndiceCOPSPerdidosK" value="8" size="6" maxlength="5" readonly=""></td>
										<td align="center"><input type="text" name="txtTotalDientes" value="20" size="6" maxlength="5" readonly=""></td>
										<td align="center"><input type="text" name="txtCOP" value="16" size="6" maxlength="5" readonly=""></td>
										<td align="center"><input type="text" name="txtCOPMod" value="16" size="6" maxlength="5" readonly=""></td>
									</tr>
								</tbody></table>
							</td>
						</tr>
					</tbody></table>
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