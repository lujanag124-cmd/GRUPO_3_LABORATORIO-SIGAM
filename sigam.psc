Algoritmo SIGAM
	
	Escribir "=========================================="
	Escribir "        Bienvenido a SIGAM                "
	Escribir "=========================================="
	Escribir "";
	
	//Variables generales
	Definir usuario, password,ubicaciones,tipoVehiculos,situaciones, patentes Como Caracter;
	Definir solicitudUbicaciones,solicitudTipoVehiculos,solicitudSituaciones Como Caracter;
	Definir opcionUsuario,choferesAsignados Como Entero;
	Definir loginActivo, solicitudConfirmada Como Logico;
	Definir choferEncontrado Como Entero;
	Definir valorUsuario Como Caracter;  //valorUsuario, es la variable que guarda la info de validalogin
	Definir nombresChoferes, usuariosChoferes, clavesChoferes, estadosChoferes, tiposGrua, localidadesChoferes,estadosDisponibles Como Caracter
	//Estos vectores determinan la cantidad total de solicitudes que tiene el programa, el valor es random. En esta ocación es solo para 10 solicitudes.
	Dimension solicitudUbicaciones[10];
	Dimension solicitudTipoVehiculos[10];
	Dimension solicitudsituaciones[10];
	Dimension patentes[10];
	Dimensionar choferesAsignados[10];
	
	Dimension ubicaciones[3];
	Dimension tipoVehiculos[3];
	Dimension situaciones[3];
	
	
	ubicaciones[0]= "Merlo";
	ubicaciones[1] ="Ituzaingo";
	ubicaciones[2] ="Moron";
	
	tipoVehiculos[0]="Moto";
	tipoVehiculos[1]="Auto";
	tipoVehiculos[2]="Camioneta";
	
	situaciones[0]="Pinchadura ";
	situaciones[1]="Falla mecanica ";
	situaciones[2]="Accidente/Choque ";
	
	Dimension nombresChoferes[3];
	Dimension usuariosChoferes[3];
	Dimension clavesChoferes[3];
	Dimension estadosChoferes[3];
	Dimension tiposGrua[3];
	Dimension localidadesChoferes[3];
	
	nombresChoferes[0]= "Ruben";
	nombresChoferes[1]= "Carlos";
	nombresChoferes[2]= "Tomi";
	
	usuariosChoferes[0] = "chofer1";
	usuariosChoferes[1] = "chofer2";
	usuariosChoferes[2] = "chofer3";
	
	clavesChoferes[0] = "chofer123";
	clavesChoferes[1] = "chofer123";
	clavesChoferes[2] = "chofer123";
	
	estadosChoferes[0]="Disponible";
	estadosChoferes[1]="Ocupado";
	estadosChoferes[2]="Disponible";
	
	tiposGrua[0]="Auto";
	tiposGrua[1]="Moto";
	tiposGrua[2]="Camioneta";
	
	localidadesChoferes[0]="Ituzaingo";
	localidadesChoferes[1]="Moron";
	localidadesChoferes[2]="Merlo";
	
	Dimension estadosDisponibles[3];
	
	estadosDisponibles[0]="Disponible";
	estadosDisponibles[1]="Ocupado";
	estadosDisponibles[2]="No disponible";
	
	
	Definir cantSolicitudes como entero
	Definir cantCanceladas Como Entero;
	cantCanceladas=0;
	cantSolicitudes=0;
	Mientras verdadero hacer// Devuelve mensaje de error 
		valorUsuario = "Incorrecto"
		Mientras valorUsuario == "Incorrecto" Hacer
			inicioSesion(usuario, password);
			valorUsuario <- validaLogin (usuario, password)
			Limpiar Pantalla 
			Escribir "=========================================="
			Escribir "        Bienvenido a SIGAM                "
			Escribir "=========================================="
			Escribir "";
			si valorUsuario == "Incorrecto" Entonces
				Escribir "Error: Usuario o contraseña incorrecta"
			FinSi
			
		FinMientras
		
		
		// Al iniciar sesión, limpiará la pantalla de la consola para mostrar correctamente los menús
		Limpiar Pantalla;
		
		loginActivo <- Verdadero;
		
		Mientras loginActivo Hacer
			Segun valorUsuario Hacer
				"Chofer" :
					menuChofer(opcionUsuario)
					Segun opcionUsuario Hacer
						1:
						2:
						3:
						4:
						5:
						6:
						7: 
						8:
						9: loginActivo <- Falso	
						De Otro Modo:
							escribir "La opcion ingresada no es valida.Por favor intente nuevamente"
							esperar 1.5 segundo 
							Limpiar Pantalla
					FinSegun
				"Cliente" :
					menuCliente(opcionUsuario)
					Segun opcionUsuario Hacer
						1:si cantSolicitudes < 10 Entonces
							solicitudConfirmada <- solicitarAuxilio(solicitudUbicaciones,solicitudTipoVehiculos,solicitudSituaciones,cantSolicitudes,cantCanceladas, ubicaciones, tipovehiculos,situaciones,patentes)
							
							mostrarSolicitudConfirmada(solicitudConfirmada, solicitudUbicaciones, solicitudTipoVehiculos, solicitudSituaciones, cantSolicitudes,cantCanceladas, patentes)
							
							si solicitudConfirmada= Verdadero Entonces
								choferEncontrado<- MotorDeBusqueda(solicitudUbicaciones,cantSolicitudes,localidadesChoferes, estadosChoferes)
								motorDeAsignacion(choferEncontrado,nombresChoferes,choferesAsignados,estadosChoferes,cantSolicitudes)
							FinSi
						SiNo
							Escribir "No se pueden registrar mas solicitudes. Se alcanzo el limite diario de 10 solicitudes."
						FinSi
						esperar 5 segundo 
						Limpiar Pantalla
					2:
					3:
					4:
					5:
					6:loginActivo <- Falso
					De Otro Modo:
						escribir "La opcion ingresada no es valida.Por favor intente nuevamente"
						esperar 1.5 segundo 
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
						escribir "La opcion ingresada no es valida.Por favor intente nuevamente"
						esperar 1.5 segundo 
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
						escribir "La opcion ingresada no es valida.Por favor intente nuevamente"
						esperar 1.5 segundo 
						Limpiar Pantalla
				FinSegun
		FinSegun
	Fin Mientras	 
	escribir "Cerrando sesion..."
	Esperar 1.5 segundos
	Limpiar Pantalla
	Escribir "=========================================="
	Escribir "        Bienvenido a SIGAM                "
	Escribir "=========================================="
	Escribir "";
FinMientras

FinAlgoritmo

SubAlgoritmo menuChofer(opcionUsuario Por Referencia)
	Escribir "=========================================="
	Escribir "               Menu Chofer                "
	Escribir "=========================================="
	Escribir "";
	Escribir "1) Ver estado actual";
	Escribir "2) Cambiar estado";
	Escribir "3) Ver informacion de mi grua";
	Escribir "4) Ver servicio asignado";
	Escribir "5) Iniciar viaje";
	Escribir "6) Reportar incidencia";
	Escribir "7) Finalizar viaje";
	Escribir "8) Ver historial de ganancias";
	Escribir "9) Cerrar sesión";
	Escribir "";
	Escribir Sin Saltar "Ingrese una opcion: ";
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
	Escribir "6) Cerrar sesión";
	Escribir "";
	Escribir Sin Saltar "Ingrese una opcion: ";
	Leer opcionUsuario;
FinSubAlgoritmo

SubAlgoritmo  menuAdmin(opcionUsuario Por Referencia)
	Escribir "=========================================="
	Escribir "               Menu Admin                 "
	Escribir "=========================================="
	Escribir "";
	Escribir "1) Gestionar Choferes";
	Escribir "2) Gestionar gruas";
	Escribir "3) Gestionar localidades";
	Escribir "4) Configurar distancias";
	Escribir "5) Consultar estadisticas";
	Escribir "6) Cerrar sesión";
	Escribir "";
	Escribir Sin Saltar "Ingrese una opcion: ";
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
	Escribir "4) Cerrar sesión";
	Escribir "";
	Escribir Sin Saltar "Ingrese una opcion: ";
	Leer opcionUsuario;
FinSubAlgoritmo

//Inicio de sesión
SubAlgoritmo  inicioSesion(user Por Referencia, pasw Por Referencia)
	Escribir " ";
	Escribir "Ingrese su usuario:";
	leer user
	Escribir "Ingrese su contraseña:";
	Leer pasw
FinSubAlgoritmo

//Función que valida el acceso de las credenciales hardcodeadas y devuelve el valor del menú
Funcion tipoUsuario <- validaLogin (usu, psw) 
	
	Definir chofer1, claveChofer1 Como Caracter; 	     // Variables Chofer
	Definir cliente1, claveCliente1 Como Caracter;    // Variables Cliente 
	Definir admin1, claveAdmin1 Como Caracter;       // Variables Administrador
	Definir soporte1, claveSoporte1 Como Caracter   // Variables Soporte	
	Definir tipoUsuario Como Caracter;             // Variable para el tipo de usuario
	
	//Credenciales hardcodeadas de los diferentes usuarios
	chofer1 = "chofer1";
	claveChofer1= "chofer123";
	
	cliente1 = "cliente1";
	claveCliente1 = "cliente123";
	
	admin1 = "admin1";
	claveAdmin1 = "admin123";
	
	soporte1 = "soporte1";
	claveSoporte1 = "soporte123";
	
	tipoUsuario = "Incorrecto"
	
	Si usu == chofer1 y psw == claveChofer1 Entonces
		tipoUsuario = "Chofer"
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
FinFuncion

Funcion confirmada <- solicitarAuxilio(solicitudUbicaciones Por Referencia, solicitudTipoVehiculos Por Referencia, solicitudSituaciones Por Referencia, cantSolicitudes Por Referencia,cantCanceladas Por Referencia,ubicaciones Por Referencia, tipovehiculos Por Referencia,situaciones Por Referencia, patentes Por Referencia)
	Definir confirmar como entero; 
	Definir confirmada Como Logico
	Definir opcionUbicaciones Como Entero
	Definir opcionSituaciones Como Entero
	Definir opcionVehiculos Como Entero
	Limpiar Pantalla;
	Escribir "==================SOLICITAR AUXILIO====================";
	Escribir " ";
	Escribir "-----Por favor complete las siguientes solicitudes-----";
	Escribir " ";
	
	Repetir
		Escribir "Ingrese la ubicación: ";
		Escribir "1) Merlo"
		Escribir "2) Ituzaingo"
		Escribir "3) Moron"
		leer opcionUbicaciones;
		si opcionUbicaciones < 1 o opcionUbicaciones > 3 Entonces
			Limpiar Pantalla
			Escribir "Por favor ingrese una opcion correcta: "
		FinSi
	Hasta Que opcionUbicaciones >= 1 y opcionUbicaciones <= 3
	solicitudUbicaciones[cantSolicitudes]=ubicaciones[opcionUbicaciones-1];
	
	Repetir
		Escribir "Seleccione el tipo de vehiculo que necesita auxilio: ";
		Escribir "1) Moto"
		Escribir "2) Auto"
		Escribir "3) Camioneta"
		leer opcionVehiculos;
		si opcionVehiculos < 1 o opcionVehiculos > 3 Entonces
			Limpiar Pantalla
			Escribir "Por favor ingrese una opcion correcta: "
		FinSi
	Hasta Que opcionVehiculos >= 1 y opcionVehiculos <= 3 
	solicitudTipoVehiculos[cantSolicitudes]=tipoVehiculos[opcionVehiculos-1];
	
	Repetir
		Escribir "Seleccione la situación: ";
		Escribir "1) Pinchadura"
		Escribir "2) Falla mecanica"
		Escribir "3) Accidente/Choque"
		Leer opcionSituaciones;
		si opcionSituaciones < 1 o opcionSituaciones > 3 Entonces
			Limpiar Pantalla
			Escribir "Por favor ingrese una opcion correcta: "
		FinSi
	Hasta Que opcionSituaciones >= 1 y opcionSituaciones <= 3 
	solicitudSituaciones[cantSolicitudes]=situaciones[opcionSituaciones-1];
	
	Escribir "Ingrese su patente, ejemplo: AB-123-CD ";
	Leer patentes[cantSolicitudes]
	
	Limpiar Pantalla
	Escribir "Ubicacion: ", ubicaciones[opcionUbicaciones-1]; 
	Escribir "Datos del vehiculo: ", tipoVehiculos[opcionVehiculos-1];
	Escribir "Situacion : ", situaciones[opcionSituaciones-1];
	Escribir "Patente: ", patentes[cantsolicitudes]
	Escribir "---------------------------";
	Escribir "Ingrese 1) Para confimar la solicitud"
	Escribir "Ingrese 2) Para cancelar la misma"
	Leer confirmar;
	
	Mientras  confirmar <> 1 y confirmar <> 2 Hacer
		Escribir "Por favor ingrese una opcion correcta: ";
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
		Escribir "Cantidad de Solicitudes canceladas: ", cantCanceladas; 
	SiNo
		Escribir "Solicitud confirmada. Aguarde la asignacion.";
		Escribir "Ubicacion guardada: ", solicitudUbicaciones[cantSolicitudes - 1];
		Escribir "Tipo de vehiculo: ", solicitudTipoVehiculos[cantSolicitudes - 1];
		Escribir "Patente: ", patentes[cantSolicitudes-1]
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

SubAlgoritmo motorDeAsignacion(choferEncontrado,nombresChoferes,choferesAsignados Por Referencia,estadosChoferes Por Referencia,cantSolicitudes)
	si choferEncontrado <> -1
		escribir "Se encontro un chofer en la zona"
		Escribir "Sele asignó el chofer : ",nombresChoferes[choferEncontrado];
		choferesAsignados[cantSolicitudes-1]=choferEncontrado;
		estadosChoferes[choferEncontrado]= "Ocupado"
	SiNo
		escribir "No hay choferes disponibles en la zona, por favor aguarde"
	FinSi
FinSubAlgoritmo
	