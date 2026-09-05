Algoritmo SIGAM
	
	Escribir "=========================================="
	Escribir "        Bienvenido a SIGAM                "
	Escribir "=========================================="
	Escribir "";
	
	//Variables generales
	Definir usuario, password,ubicacion,tipoVehiculo,situacion Como Caracter; 
	Definir opcionUsuario Como Entero;
	Definir loginActivo, solicitudConfirmada Como Logico;
	Definir valorUsuario Como Caracter;  //valorUsuario, es la variable que guarda la info de validalogin
	
	Mientras verdadero hacer// Devuelve mensaje de error 
		valorUsuario = "Incorrecto"
		Mientras valorUsuario == "Incorrecto" Hacer
			inicioSesion(usuario, password);
			valorUsuario <- validaLogin (usuario, password)
			
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
						1:solicitudConfirmada <- solicitarAuxilio(ubicacion,tipoVehiculo,situacion);
							Si solicitudConfirmada Entonces
								Escribir "Solicitud confirmada. Aguarde la asignacion.";
								Escribir "Ubicacion guardada: ", ubicacion;
								Escribir "Tipo de vehiculo: ", tipoVehiculo;
							SiNo
								Escribir "La solicitud fue cancelada"; 
							FinSi
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
	Escribir Sin Saltar "Ingrese una opcion: ";
	Leer opcionUsuario;
FinSubAlgoritmo

//Inicio de sesión
SubAlgoritmo  inicioSesion(user Por Referencia, pasw Por Referencia)
	
	Escribir "Ingrese su usuario";
	leer user
	Escribir "Ingrese su contraseña";
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

Funcion confirmada <- solicitarAuxilio(ubicacion Por Referencia, tipoVehiculo Por Referencia, situacion Por Referencia)
	Definir confirmar como entero; 
	Definir confirmada Como Logico
	Limpiar Pantalla;
	Escribir "==========SOLICITAR AUXILIO==========";
	Escribir " ";
	Escribir "-----Por favor complete las siguientes solicitudes-----";
	Escribir " ";
	Escribir "Ingrese la ubicación: ";
	Leer ubicacion;
	Escribir "Ingese el tipo de vehiculo: ";
	Leer tipoVehiculo;
	Escribir "Describa (de manera objetiva) la situación: ";
	Leer situacion;
	Escribir "Ubicacion: ", ubicacion; 
	Escribir "Datos del vehiculo: ", tipoVehiculo;
	Escribir "Situacion : ", situacion;
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
	SiNo
		confirmada=Falso; 
	FinSi
	Limpiar Pantalla
FinFuncion