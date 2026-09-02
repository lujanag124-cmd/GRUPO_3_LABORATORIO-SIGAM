Algoritmo SIGAM
	Definir Chofer1 Como Caracter;
	Definir ClaveChofer1 Como Caracter;
	Definir Cliente1 Como Caracter;
	Definir ClaveCLiente1 Como Caracter;
	Definir Admin1 Como Caracter;
	Definir ClaveAdmin1 Como Caracter;
	Definir Soporte1 Como Caracter;
	Definir ClaveSoporte1 Como Caracter;
	Definir usuario Como Caracter
	definir contraseña como caracter
	
	
	Usuario = "Incorrecto"
	Mientras Usuario == "Incorrecto" Hacer
		InicioSesion(usuario, contraseña);
		Usuario <-ValidaLogin (usuario, contraseña)
		
		si Usuario == "Incorrecto" Entonces
			Escribir "Usuario o contraseña incorrectos"
		FinSi
		
	FinMientras
	
	Segun Usuario Hacer
		"Chofer" :
			MenuChofer
		"Cliente" :
			MenuCliente
		"Admin" :
			MenuAdmin
		"Soporte" :
			MenuSoporte
	FinSegun
	
	
	
FinAlgoritmo

SubAlgoritmo  MenuChofer
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
FinSubAlgoritmo

SubAlgoritmo  MenuCliente
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
FinSubAlgoritmo

SubAlgoritmo  MenuAdmin
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
FinSubAlgoritmo


SubAlgoritmo  MenuSoporte 
	Escribir "=========================================="
	Escribir "               Menu Soporte               "
	Escribir "=========================================="
	Escribir "";
	Escribir "1) Ver incidencias pendientes";
	Escribir "2) Gestionar incidencia";
	Escribir "3) Ver historial de incidencias";
	Escribir "4) Cerrar sesión";
	Escribir Sin Saltar "Ingrese una opcion: ";
FinSubAlgoritmo

//subalgotirmo que solamente solicita el login correspondiente//
SubAlgoritmo  InicioSesion(user Por Referencia, pasw Por Referencia)
	Escribir "=========================================="
	Escribir "        Bienvenido a SIGAM                "
	Escribir "=========================================="
	Escribir "";
	Escribir "Ingrese su usuario";
	leer user
	Escribir "Ingrese su contraseña";
	Leer pasw
FinSubAlgoritmo
//funcion que valida las credenciales hardcodeadas para acceder a los menus//
Funcion Usuario <-ValidaLogin (usu, psw)
	
	//Credenciales hardcodeadas de los usuarios//
	Chofer1 = "Chofer1";
	ClaveChofer1= "Chofer123";
	
	Cliente1 = "Cliente1";
	ClaveCliente1 = "Cliente123";
	
	Admin1 = "Admin1";
	ClaveAdmin1 = "Admin123";
	
	Soporte1 = "Soporte1";
	ClaveSoporte1 = "Soporte123";
	
	si usu == Chofer1 y psw == ClaveChofer1 Entonces
		Usuario = "Chofer"
	sino
		si usu == Cliente1 y psw == ClaveCliente1 Entonces
			Usuario = "Cliente"
		sino 
			si usu == Admin1 y psw == ClaveAdmin1 Entonces
				Usuario = "Admin"
			sino 
				si usu == Soporte1 y psw == ClaveSoporte1 Entonces
					Usuario = "Soporte"
				SiNo
						Usuario = "Incorrecto"
						
				FinSi
			FinSi
		FinSi
	FinSi
FinFuncion
	