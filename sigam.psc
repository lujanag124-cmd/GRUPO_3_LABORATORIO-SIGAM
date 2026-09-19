SubAlgoritmo mostrarBienvenida
	Escribir "===================================================="
	Escribir "               �BIENVENIDO/A A SIGAM!               "
	Escribir "===================================================="
	Escribir "Sistema de Gesti�n y Asignaci�n de Auxilio Mecanico "
	Escribir "...................................................."
FinSubAlgoritmo

Algoritmo SIGAM	
	// Mensaje de bienvenida
	mostrarBienvenida;
	
	//Variables generales
	Definir usuario, password, ubicaciones, tipoVehiculos, situaciones, patentes Como Caracter;
	Definir solicitudUbicaciones, solicitudTipoVehiculos, solicitudSituaciones Como Caracter;
	Definir opcionUsuario, choferesAsignados, choferEncontrado, opcionPost, choferLogueado, opcionChofer Como Entero;
	Definir loginActivo, solicitudConfirmada Como Logico;
	Definir valorUsuario Como Caracter;  //Guarda la info de validalogin
	Definir nombresChoferes, usuariosChoferes, clavesChoferes, estadosChoferes, tiposGrua, localidadesChoferes,estadosDisponibles,estadosServicio,estadosSolicitudes  Como Caracter
	Definir cantSolicitudes, cantCanceladas Como Entero;
	
	//Estos vectores determinan la cantidad total de solicitudes, el valor es aleatorio. 
	Dimension solicitudUbicaciones[10];
	Dimension solicitudTipoVehiculos[10];
	Dimension solicitudSituaciones[10];
	Dimension patentes[10];
	Dimension choferesAsignados[10];
	Dimension ubicaciones[3];
	Dimension tipoVehiculos[3];
	Dimension situaciones[3];
	Dimension estadosSolicitudes[10];
	Dimension nombresChoferes[3];
	Dimension usuariosChoferes[3];
	Dimension clavesChoferes[3];
	Dimension estadosChoferes[3];
	Dimension tiposGrua[3];
	Dimension localidadesChoferes[3];
	Dimension estadosDisponibles[3];
	Dimension estadosServicio[5];
	
	//Datos hardcodeados para los vectores
	cargarDatosSistema(ubicaciones, tipoVehiculos, situaciones, nombresChoferes, usuariosChoferes, clavesChoferes, estadosChoferes, tiposGrua, localidadesChoferes, estadosDisponibles, estadosServicio)
	
	cantCanceladas=0;
	cantSolicitudes=0;
	
	
	Mientras verdadero hacer
		valorUsuario = "Incorrecto"
		
		Mientras valorUsuario == "Incorrecto" Hacer
			Limpiar Pantalla 
			
			// Mensaje de bienvenida
			mostrarBienvenida;
			
			// Inicio de sesi�n
			inicioSesion(usuario, password);
			valorUsuario <- validaLogin (usuario, password,choferLogueado)
			
			// Validaci�n para credenciales incorrectas en login
			si valorUsuario == "Incorrecto" Entonces
				Escribir "Usuario o contrase�a incorrecta. Por favor, intente nuevamente."
				Esperar 2.0 Segundos
				Limpiar Pantalla
			FinSi
		FinMientras
		
		// Al iniciar sesi�n, limpiar� la pantalla de la consola para mostrar correctamente los men�s
		Limpiar Pantalla;
		
		// Mientras login sea verdadero realizar� todas las acciones dentro del mientras..
		loginActivo <- Verdadero;
		
		Mientras loginActivo Hacer
			Segun valorUsuario Hacer
				"Chofer" :
					menuChofer(opcionUsuario)
					Segun opcionUsuario Hacer
						1:
						2:
							si cantSolicitudes=0 Entonces
								Limpiar Pantalla
								Escribir "Aun no tiene servicio asignado"
								Escribir ""
								Escribir "Presione una tecla para volver al menu..." 
								Esperar Tecla
								Limpiar Pantalla
							sino 
								mostrarServicioChofer(cantSolicitudes,choferesAsignados,choferLogueado,patentes,solicitudUbicaciones,solicitudTipoVehiculos,solicitudSituaciones,estadosSolicitudes)
								opcionChofer <- opcionServicioChofer
								Segun opcionChofer Hacer
									1:iniciarViaje(cantSolicitudes,choferesAsignados,choferLogueado,estadosSolicitudes,estadosServicio)
									2:
										Escribir "Volviendo al menu principal..."
										Esperar 1.2 segundos
										Limpiar Pantalla
								FinSegun
							FinSi
						3:	
							finalizarViaje(cantSolicitudes,choferesAsignados,choferLogueado,estadosSolicitudes,estadosServicio,estadosChoferes,estadosDisponibles)
						4:
						5:
						6: loginActivo <- Falso	
						De Otro Modo:
							Escribir "La opcion ingresada no es valida. Por favor, intente nuevamente"
							Esperar 2.5 Segundos
							Limpiar Pantalla
					FinSegun
				"Cliente" :
					menuCliente(opcionUsuario)
					Segun opcionUsuario Hacer
						1:si cantSolicitudes < 10 Entonces
							solicitudConfirmada <- solicitarAuxilio(solicitudUbicaciones,solicitudTipoVehiculos,solicitudSituaciones,cantSolicitudes,cantCanceladas, ubicaciones, tipoVehiculos, situaciones, patentes)
							
							mostrarSolicitudConfirmada(solicitudConfirmada, solicitudUbicaciones, solicitudTipoVehiculos, solicitudSituaciones, cantSolicitudes,cantCanceladas, patentes)
							
							si solicitudConfirmada= Verdadero Entonces
								choferEncontrado<- MotorDeBusqueda(solicitudUbicaciones,cantSolicitudes,localidadesChoferes, estadosChoferes)
								motorDeAsignacion(choferEncontrado,nombresChoferes,choferesAsignados,estadosChoferes,cantSolicitudes,estadosSolicitudes, estadosServicio)
								opcionPost <- opcionPostSolicitud
								Segun opcionPost Hacer
									1: si cantSolicitudes>0 Entonces	
											Limpiar Pantalla
											mostrarServicioCliente(patentes, cantSolicitudes,solicitudTipoVehiculos,solicitudUbicaciones,solicitudSituaciones,estadosSolicitudes, choferesAsignados, nombresChoferes,estadosServicio)
										SiNo
											Escribir "No hay solicitudes registradas"
										FinSi
									2:	
										Escribir "Volviendo al menu principal..."
										Esperar 1.2 segundos
								FinSegun
							FinSi
						SiNo
							Escribir "No se pueden registrar mas solicitudes. El l�mite diario es 10 solicitudes."
						FinSi
						
						Esperar 1 Segundos
						Limpiar Pantalla
					2:si cantSolicitudes>0 Entonces	
						Limpiar Pantalla
						mostrarServicioCliente(patentes, cantSolicitudes,solicitudTipoVehiculos,solicitudUbicaciones,solicitudSituaciones,estadosSolicitudes, choferesAsignados, nombresChoferes,estadosServicio)
					SiNo
						Limpiar Pantalla
						Escribir "No hay solicitudes registradas"
						Escribir ""
						Escribir "Presione una tecla para volver al menu..."
						Esperar Tecla
						Limpiar Pantalla
						
					FinSi
					3:
					4:
					5:
					6:loginActivo <- Falso
					De Otro Modo:
						Escribir "La opci�n ingresada no es valida. Por favor, intente nuevamente"
						Esperar 2.5 Segundos 
						Limpiar Pantalla
					FinSegun
				"Admin" :
					menuAdmin(opcionUsuario)
					Segun opcionUsuario Hacer
						1:
						2:
						3:
						4:
						5:
						6:loginActivo <- Falso
						De Otro Modo:
							Escribir "La opcion ingresada no es valida. Por favor, intente nuevamente"
							Esperar 2.5 Segundos
							Limpiar Pantalla
					FinSegun
				"Soporte" :
					menuSoporte(opcionUsuario)
					Segun opcionUsuario Hacer
						1:
						2:
						3:
						4:loginActivo <- Falso
						De Otro Modo:
							Escribir "La opcion ingresada no es valida. Por favor, intente nuevamente"
							Esperar 2.5 Segundos
							Limpiar Pantalla
					FinSegun
			FinSegun
		Fin Mientras	 
			escribir "Cerrando sesion..."
			Esperar 1.5 segundos
			Limpiar Pantalla
			
			// Mensaje de bienvenida
			mostrarBienvenida;
	FinMientras

FinAlgoritmo


SubAlgoritmo menuChofer(opcionUsuario Por Referencia)
	Escribir "=========================================="
	Escribir "               Menu Chofer                "
	Escribir "=========================================="
	Escribir "";
	Escribir "1) Ver estado actual";
	Escribir "2) Ver servicio asignado";
	Escribir "3) Finalizar viaje";
	Escribir "4) Reportar incidencia";
	Escribir "5) Ver historial de ganancias";
	Escribir "6) Cerrar sesi�n";
	Escribir "";
	Escribir Sin Saltar "Ingrese una opci�n: ";
	Leer opcionUsuario;
FinSubAlgoritmo

SubAlgoritmo  menuCliente(opcionUsuario Por Referencia)
	Escribir "=========================================="
	Escribir "               Menu Cliente               "
	Escribir "=========================================="
	Escribir "";
	Escribir "1) Solicitar auxilio";
	Escribir "2) Consultar servicio";
	Escribir "3) Reportar incidencia";
	Escribir "4) Calificar servicio";
	Escribir "5) Ver historial";
	Escribir "6) Cerrar sesi�n";
	Escribir "";
	Escribir Sin Saltar "Ingrese una opci�n: ";
	Leer opcionUsuario;
FinSubAlgoritmo

SubAlgoritmo  menuAdmin(opcionUsuario Por Referencia)
	Escribir "=========================================="
	Escribir "               Menu Admin                 "
	Escribir "=========================================="
	Escribir "";
	Escribir "1) Gestionar choferes";
	Escribir "2) Gestionar gr�as";
	Escribir "3) Gestionar localidades";
	Escribir "4) Configurar distancias";
	Escribir "5) Consultar estad�sticas";
	Escribir "6) Cerrar sesi�n";
	Escribir "";
	Escribir Sin Saltar "Ingrese una opci�n: ";
	Leer opcionUsuario;
FinSubAlgoritmo

SubAlgoritmo  menuSoporte(opcionUsuario Por Referencia)
	Escribir "=========================================="
	Escribir "               Menu Soporte               "
	Escribir "=========================================="
	Escribir "";
	Escribir "1) Ver incidencias pendientes";
	Escribir "2) Gestionar incidencia";
	Escribir "3) Ver historial de incidencias";
	Escribir "4) Cerrar sesi�n";
	Escribir "";
	Escribir Sin Saltar "Ingrese una opci�n: ";
	Leer opcionUsuario;
FinSubAlgoritmo

//Inicio de sesi�n
SubAlgoritmo  inicioSesion(user Por Referencia, pasw Por Referencia)
	Escribir "Ingrese su usuario:";
	leer user
	Escribir "Ingrese su contrase�a:";
	Leer pasw
FinSubAlgoritmo


SubAlgoritmo mostrarSolicitudConfirmada (solicitudConfirmada, solicitudUbicaciones, solicitudTipoVehiculos, solicitudSituaciones, cantSolicitudes,cantCanceladas, patentes)
	Si solicitudConfirmada = Falso Entonces
		Escribir "La solicitud fue cancelada";
		Escribir ""
		Escribir "Presione una tecla para volver al menu..."
		Esperar Tecla
		Limpiar Pantalla
	SiNo
		Escribir "Solicitud confirmada. Aguarde la asignacion.";
		Esperar 2.5 Segundos
		Escribir "Estamos buscando la mejor coincidencia para tu solicitud..."
		Esperar 2.5 segundos
		Limpiar Pantalla
	FinSi
	
FinSubAlgoritmo

SubAlgoritmo mostrarServicioCliente(patentes, cantSolicitudes,solicitudTipoVehiculos,solicitudUbicaciones,solicitudSituaciones,estadosSolicitudes, choferesAsignados, nombresChoferes,estadosServicios)
	Escribir "--------------------------------------";
	Escribir "       Detalles del servicio          ";
	Escribir "--------------------------------------"
	Escribir "";
	Escribir "Patente: ", patentes[cantSolicitudes-1];
	Escribir "Ubicacion: ", solicitudUbicaciones[cantSolicitudes-1];
	Escribir "Vehiculo: ", solicitudTipoVehiculos[cantSolicitudes-1];
	Escribir "Situacion: ",solicitudSituaciones[cantSolicitudes-1];
	Escribir "Estado: ", estadosSolicitudes[cantSolicitudes-1];
	
	si estadosSolicitudes[cantSolicitudes-1]= estadosServicios[0] Entonces
		Escribir  "Chofer: Aun no asignado" 
	SiNo
		Escribir "Chofer: ", nombresChoferes[choferesAsignados[cantSolicitudes-1]]
	FinSi
	
	Escribir "Presione una tecla para volver al menu..."
	Esperar Tecla
	Limpiar Pantalla
FinSubAlgoritmo

SubAlgoritmo motorDeAsignacion(choferEncontrado,nombresChoferes,choferesAsignados Por Referencia,estadosChoferes Por Referencia,cantSolicitudes, estadosSolicitudes Por Referencia, estadosServicio)
	Si choferEncontrado <> -1
		choferesAsignados[cantSolicitudes-1]=choferEncontrado;
		estadosChoferes[choferEncontrado]= "Ocupado"
		estadosSolicitudes[CantSolicitudes-1]=estadosServicio[1]
		Escribir "Solicitud confirmada."
		Escribir "Estado: ", estadosServicio[1]
	SiNo
		Escribir "Solicitud confirmada."
		Escribir "Su solicitud qued� pendiente de asignaci�n"
		estadosSolicitudes[CantSolicitudes-1]=estadosServicio[0]
	FinSi
FinSubAlgoritmo

SubAlgoritmo cargarDatosSistema(ubicaciones Por Referencia, tipoVehiculos Por Referencia, situaciones Por Referencia, nombresChoferes Por Referencia, usuariosChoferes Por Referencia, clavesChoferes Por Referencia, estadosChoferes Por Referencia, tiposGrua Por Referencia, localidadesChoferes Por Referencia, estadosDisponibles Por Referencia, estadosServicio Por Referencia)
	// Ubicaciones
	ubicaciones[0] <- "Merlo"
	ubicaciones[1] <- "Ituzaingo"
	ubicaciones[2] <- "Moron"
	
	// Tipos de Veh�culos
	tipoVehiculos[0] <- "Moto"
	tipoVehiculos[1] <- "Auto"
	tipoVehiculos[2] <- "Camioneta"
	
	// Situaciones
	situaciones[0] <- "Pinchadura "
	situaciones[1] <- "Falla mecanica "
	situaciones[2] <- "Accidente/Choque "
	
	// Datos de Choferes
	nombresChoferes[0] <- "Ruben"
	nombresChoferes[1] <- "Carlos"
	nombresChoferes[2] <- "Tomas"
	
	usuariosChoferes[0] <- "chofer1"
	usuariosChoferes[1] <- "chofer2"
	usuariosChoferes[2] <- "chofer3"
	
	clavesChoferes[0] <- "chofer123"
	clavesChoferes[1] <- "chofer123"
	clavesChoferes[2] <- "chofer123"
	
	estadosChoferes[0] <- "Disponible"
	estadosChoferes[1] <- "Ocupado"
	estadosChoferes[2] <- "Disponible"
	
	tiposGrua[0] <- "Auto"
	tiposGrua[1] <- "Moto"
	tiposGrua[2] <- "Camioneta"
	
	localidadesChoferes[0] <- "Ituzaingo"
	localidadesChoferes[1] <- "Moron"
	localidadesChoferes[2] <- "Merlo"
	
	// Estados Disponibles
	estadosDisponibles[0] <- "Disponible"
	estadosDisponibles[1] <- "Ocupado"
	estadosDisponibles[2] <- "No disponible"
	
	// Estados de Servicio
	estadosServicio[0] <- "Pendiente"
	estadosServicio[1] <- "Asignado"
	estadosServicio[2] <- "En camino"
	estadosServicio[3] <- "Finalizado"
	estadosServicio[4] <- "Cancelado"
	
	
FinSubAlgoritmo


Funcion opcionPost <- opcionPostSolicitud
	Definir opcionPost Como Entero
	Repetir
		Escribir ""
		Escribir "1. Consultar detalles del servicio"
		Escribir "2. Volver al menu principal"
		Leer opcionPost
		
		si opcionPost < 1 o opcionPost > 2 Entonces
		Limpiar Pantalla
		Escribir "Por favor, ingrese una opci�n correcta: "
	FinSi
	Hasta Que opcionPost >= 1 y opcionPost <=2 
FinFuncion




//Motor de busqueda en etapa beta, actualmente solo pregunta por la disponibiliada de los choferes y compara las zonas
Funcion buscaChofer <- motorDeBusqueda (solicitudUbicaciones,cantSolicitudes,localidadesChoferes, estadosChoferes Por Referencia)
	Definir buscaChofer como entero
	definir i Como Entero
	buscaChofer = -1
	Para i=0 hasta 2 con paso 1 Hacer
		si buscaChofer = -1 Entonces
			si estadosChoferes[i]= "Disponible"
				si localidadesChoferes[i] = solicitudUbicaciones[cantSolicitudes-1]
					buscaChofer = i;
					//	estadosChoferes[i]= "Ocupado"
				FinSi
			FinSi
		FinSi
	FinPara
FinFuncion
//Funci�n que valida el acceso de las credenciales hardcodeadas y devuelve el valor del men�
Funcion tipoUsuario <- validaLogin (usu, psw, choferLogueado Por Referencia) 
	
	Definir chofer1, claveChofer1,chofer2, claveChofer2,chofer3, claveChofer3 Como Caracter; 	     // Variables Chofer
	Definir cliente1, claveCliente1 Como Caracter;    // Variables Cliente 
	Definir admin1, claveAdmin1 Como Caracter;       // Variables Administrador
	Definir soporte1, claveSoporte1 Como Caracter   // Variables Soporte	
	Definir tipoUsuario Como Caracter;             // Variable para el tipo de usuario
	
	//Credenciales hardcodeadas de los diferentes usuarios
	chofer1 = "chofer1";
	claveChofer1= "chofer123";
	
	chofer2 = "chofer2";
	claveChofer2= "chofer123";
	
	chofer3 = "chofer3";
	claveChofer3= "chofer123";
	
	cliente1 = "cliente1";
	claveCliente1 = "cliente123";
	
	admin1 = "admin1";
	claveAdmin1 = "admin123";
	
	soporte1 = "soporte1";
	claveSoporte1 = "soporte123";
	
	tipoUsuario = "Incorrecto"
	
	Si usu == chofer1 y psw == claveChofer1 Entonces
		tipoUsuario = "Chofer"
		choferLogueado=0
	SiNo
		si usu == chofer2 y psw == claveChofer2 Entonces
			tipoUsuario = "Chofer"
			choferLogueado=1
		SiNo
			si usu == chofer3 y psw == claveChofer3 Entonces
				tipoUsuario = "Chofer"
				choferLogueado=2
			SiNo
				si usu == cliente1 y psw == claveCliente1 Entonces
					tipoUsuario = "Cliente"
				SiNo 
					si usu == admin1 y psw == claveAdmin1 Entonces
					tipoUsuario = "Admin"
					SiNo 
						si usu == soporte1 y psw == claveSoporte1 Entonces
							tipoUsuario = "Soporte"
						FinSi
					FinSi
				FinSi
			FinSi
		FinSi
	FinSi
	
FinFuncion

//------------------------------------------------------------------------------
//------------------------FUNCIONES DEL CLIENTE --------------------------------
//------------------------------------------------------------------------------

Funcion confirmada <- solicitarAuxilio(solicitudUbicaciones Por Referencia, solicitudTipoVehiculos Por Referencia, solicitudSituaciones Por Referencia, cantSolicitudes Por Referencia,cantCanceladas Por Referencia,ubicaciones Por Referencia, tipovehiculos Por Referencia,situaciones Por Referencia, patentes Por Referencia)
	Definir confirmar como entero; 
	Definir confirmada Como Logico
	Definir opcionUbicaciones Como Entero
	Definir opcionSituaciones Como Entero
	Definir opcionVehiculos Como Entero
	Limpiar Pantalla;
	Escribir "==============================================================="
	Escribir "                     Solicitar auxilio                         "
	Escribir "==============================================================="
	Escribir " Por favor, seleccione y complete las opciones de la solicitud.";
	Escribir "---------------------------------------------------------------";
	
	Repetir
		Escribir "Seleccione la ubicaci�n: ";
		Escribir "1. Merlo"
		Escribir "2. Ituzaingo"
		Escribir "3. Moron"
		leer opcionUbicaciones;
		si opcionUbicaciones < 1 o opcionUbicaciones > 3 Entonces
			Limpiar Pantalla
			Escribir "Por favor, ingrese una opci�n correcta: "
		FinSi
	Hasta Que opcionUbicaciones >= 1 y opcionUbicaciones <= 3
	solicitudUbicaciones[cantSolicitudes]=ubicaciones[opcionUbicaciones-1];
	
	Repetir
		Escribir " ";
		Escribir "Seleccione el tipo de vehiculo: ";
		Escribir "1. Moto"
		Escribir "2. Auto"
		Escribir "3. Camioneta"
		leer opcionVehiculos;
		si opcionVehiculos < 1 o opcionVehiculos > 3 Entonces
			Limpiar Pantalla
			Escribir "Por favor, ingrese una opci�n correcta: "
		FinSi
	Hasta Que opcionVehiculos >= 1 y opcionVehiculos <= 3 
	solicitudTipoVehiculos[cantSolicitudes]=tipoVehiculos[opcionVehiculos-1];
	
	Repetir
		Escribir " ";
		Escribir "Seleccione la situacion: ";
		Escribir "1. Pinchadura"
		Escribir "2. Falla mecanica"
		Escribir "3. Accidente/Choque"
		Leer opcionSituaciones;
		si opcionSituaciones < 1 o opcionSituaciones > 3 Entonces
			Limpiar Pantalla
			Escribir "Por favor, ingrese una opci�n correcta: "
		FinSi
	Hasta Que opcionSituaciones >= 1 y opcionSituaciones <= 3 
	solicitudSituaciones[cantSolicitudes]=situaciones[opcionSituaciones-1];
	
	Escribir " ";
	Escribir "Ingrese su patente: ";
	Leer patentes[cantSolicitudes]
	
	Limpiar Pantalla
	Escribir "--------------------------------------";
	Escribir "     Los datos seleccionados son:     ";
	Escribir "--------------------------------------";
	Escribir "Ubicacion: ", ubicaciones[opcionUbicaciones-1]; 
	Escribir "Datos del vehiculo: ", tipoVehiculos[opcionVehiculos-1];
	Escribir "Situacion : ", situaciones[opcionSituaciones-1];
	Escribir "Patente: ", patentes[cantsolicitudes]
	Escribir "";
	Escribir "..............................................................";
	Escribir " Para avanzar con su solicitud, seleccione la opci�n deseada.  ";
	Escribir "..............................................................";
	Escribir "1. Confirmar solicitud"
	Escribir "2. Cancelar solicitud"
	Leer confirmar;
	
	Mientras  confirmar <> 1 y confirmar <> 2 Hacer
		Escribir "Por favor, ingrese una opci�n correcta: ";
		Leer confirmar;
	FinMientras
	
	si confirmar = 1 Entonces
		confirmada=Verdadero;
		cantSolicitudes=cantSolicitudes+1
		
	SiNo
		confirmada=Falso; 
		cantCanceladas=cantCanceladas+1;
	FinSi
	Limpiar Pantalla
FinFuncion


SubAlgoritmo mostrarSolicitudConfirmada (solicitudConfirmada, solicitudUbicaciones, solicitudTipoVehiculos, solicitudSituaciones, cantSolicitudes,cantCanceladas, patentes)
	Si solicitudConfirmada = Falso Entonces
		Escribir "La solicitud fue cancelada";
		Escribir ""
		Escribir "Presione una tecla para volver al menu..."
		Esperar Tecla
		Limpiar Pantalla
	SiNo
		Escribir "Solicitud confirmada. Aguarde la asignacion.";
		Esperar 2.5 Segundos
		Escribir "Estamos buscando la mejor coincidencia para tu solicitud..."
		Esperar 2.5 segundos
		Limpiar Pantalla
	FinSi
	
FinSubAlgoritmo


//Motor de busqueda en etapa beta, actualmente solo pregunta por la disponibiliada de los choferes y compara las zonas
Funcion buscaChofer <- motorDeBusqueda (solicitudUbicaciones,cantSolicitudes,localidadesChoferes, estadosChoferes Por Referencia)
	Definir buscaChofer como entero
	definir i Como Entero
	buscaChofer = -1
	Para i=0 hasta 2 con paso 1 Hacer
		si buscaChofer = -1 Entonces
			si estadosChoferes[i]= "Disponible"
				si localidadesChoferes[i] = solicitudUbicaciones[cantSolicitudes-1]
					buscaChofer = i;
				//	estadosChoferes[i]= "Ocupado"
				FinSi
			FinSi
		FinSi
	FinPara
FinFuncion

SubAlgoritmo motorDeAsignacion(choferEncontrado,nombresChoferes,choferesAsignados Por Referencia,estadosChoferes Por Referencia,cantSolicitudes, estadosSolicitudes Por Referencia, estadosServicio)
	Si choferEncontrado <> -1
		choferesAsignados[cantSolicitudes-1]=choferEncontrado;
		estadosChoferes[choferEncontrado]= "Ocupado"
		estadosSolicitudes[CantSolicitudes-1]=estadosServicio[1]
		Escribir "Solicitud confirmada."
		Escribir "Estado: ", estadosServicio[1]
	SiNo
		Escribir "Solicitud confirmada."
		Escribir "Su solicitud qued� pendiente de asignaci�n"
		estadosSolicitudes[CantSolicitudes-1]=estadosServicio[0]
		choferesAsignados[cantSolicitudes-1]=-1
		
	FinSi
FinSubAlgoritmo

Funcion opcionPost <- opcionPostSolicitud
	Definir opcionPost Como Entero
	Repetir
		Escribir ""
		Escribir "1. Consultar detalles del servicio"
		Escribir "2. Volver al menu principal"
		Leer opcionPost
		
		si opcionPost < 1 o opcionPost > 2 Entonces
		Limpiar Pantalla
		Escribir "Por favor, ingrese una opci�n correcta: "
	FinSi
	Hasta Que opcionPost >= 1 y opcionPost <=2 
FinFuncion

SubAlgoritmo mostrarServicioCliente(patentes, cantSolicitudes,solicitudTipoVehiculos,solicitudUbicaciones,solicitudSituaciones,estadosSolicitudes, choferesAsignados, nombresChoferes,estadosServicios)
	Escribir "--------------------------------------";
	Escribir "       Detalles del servicio          ";
	Escribir "--------------------------------------"
	Escribir "";
	Escribir "Patente: ", patentes[cantSolicitudes-1];
	Escribir "Ubicacion: ", solicitudUbicaciones[cantSolicitudes-1];
	Escribir "Vehiculo: ", solicitudTipoVehiculos[cantSolicitudes-1];
	Escribir "Situacion: ",solicitudSituaciones[cantSolicitudes-1];
	Escribir "Estado: ", estadosSolicitudes[cantSolicitudes-1];
	
	si estadosSolicitudes[cantSolicitudes-1]= estadosServicios[0] Entonces
		Escribir  "Chofer: Aun no asignado" 
	SiNo
		Escribir "Chofer: ", nombresChoferes[choferesAsignados[cantSolicitudes-1]]
	FinSi
	
	Escribir "Presione una tecla para volver al menu..."
	Esperar Tecla
	Limpiar Pantalla
FinSubAlgoritmo

//------------------------------------------------------------------------------
//------------------------FUNCIONES DEL CHOFER ---------------------------------
//------------------------------------------------------------------------------


SubAlgoritmo mostrarServicioChofer(cantSolicitudes,choferesAsignados,choferLogueado,patentes,solicitudUbicaciones,solicitudTipoVehiculos,solicitudSituaciones,estadosSolicitudes)
	Limpiar Pantalla
	Escribir "--------------------------------------";
	Escribir "       Detalles del servicio          ";
	Escribir "--------------------------------------"
	Escribir "";
	Definir i como entero
	Definir hayServicio como logico
	hayServicio = Falso
	para i = 0 hasta cantSolicitudes-1 Hacer
		si choferesAsignados[i] == choferLogueado Entonces
			hayServicio=Verdadero
			Escribir "Patente: ",patentes[i]
			Escribir "Ubicacion: ",solicitudUbicaciones[i]
			Escribir "Tipo de vehiculo: ", solicitudTipoVehiculos[i]
			Escribir "Situacion: " ,solicitudSituaciones[i]
			Escribir "Estado: ",estadosSolicitudes[i]
		FinSi
	FinPara
	si hayServicio=Falso Entonces
		Escribir "Aun no tiene servicio asignado"
	FinSi
FinSubAlgoritmo

Funcion opcionChofer <- opcionServicioChofer
	Definir opcionChofer Como Entero
	Repetir
		Escribir ""
		Escribir "1. Iniciar viaje"
		Escribir "2. Volver al menu principal"
		Leer opcionChofer
		
		si opcionChofer < 1 o opcionChofer > 2 Entonces
			Limpiar Pantalla
			Escribir "Por favor, ingrese una opci�n correcta: "
		FinSi
	Hasta Que opcionChofer >= 1 y opcionChofer <=2 
FinFuncion

SubAlgoritmo iniciarViaje(cantSolicitudes,choferesAsignados,choferLogueado,estadosSolicitudes Por Referencia,estadosServicio)
	Definir i Como Entero
	para i = 0 hasta cantSolicitudes-1 Hacer
		si choferesAsignados[i] == choferLogueado Entonces
			estadosSolicitudes[i] = estadosServicio[2]
		FinSi
	FinPara
FinSubAlgoritmo

SubAlgoritmo finalizarViaje(cantSolicitudes,choferesAsignados,choferLogueado,estadosSolicitudes Por Referencia,estadosServicio,estadosChoferes Por Referencia,estadosDisponibles)
	Definir i Como Entero
	para i = 0 hasta cantSolicitudes-1 Hacer
		si choferesAsignados[i] == choferLogueado Entonces
			si estadosSolicitudes[i] = estadosServicio[2]
				estadosSolicitudes[i] = estadosServicio[3]
				estadosChoferes[choferLogueado]= estadosDisponibles[0]
				Limpiar Pantalla
				Escribir "Viaje finalizado"
				Escribir "Presione una tecla para volver al menu..."
				Esperar Tecla
				Limpiar Pantalla
			SiNo
				Limpiar Pantalla
                Escribir "El viaje aun no fue iniciado."
                Escribir "Presione una tecla para volver al menu..."
                Esperar Tecla
                Limpiar Pantalla
            FinSi
			
		FinSi
	FinPara
FinSubAlgoritmo


