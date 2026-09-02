Algoritmo SIGAM
	
	Escribir "=========================================="
	Escribir "        Bienvenido a SIGAM                "
	Escribir "=========================================="
	Escribir "";
	
	//Variables generales
	Definir usuario, password  Como Caracter; 
	Definir opcionUsuario Como Entero;
	Definir loginActivo Como Logico;
	
	// Devuelve mensaje de error 
	Usuario = "Incorrecto"
	Mientras Usuario == "Incorrecto" Hacer
		InicioSesion(usuario, password);
		Usuario <- ValidaLogin (usuario, password)
		
		si Usuario == "Incorrecto" Entonces
			Escribir "Error: Usuario o contraseña incorrecta"
		FinSi
		
	FinMientras
	
	
	// Al iniciar sesión, limpiará la pantalla de la consola para mostrar correctamente los menús
	Limpiar Pantalla;
	
	loginActivo <- Verdadero;
	
	Mientras loginActivo Hacer
		Segun Usuario Hacer
			"Chofer" :
				MenuChofer(opcionUsuario)
				
				Si opcionUsuario == 9 Entonces
					loginActivo <- Falso
				FinSi
			"Cliente" :
				MenuCliente(opcionUsuario)
				
				Si opcionUsuario == 6 Entonces
					loginActivo <- Falso
				FinSi
			"Admin" :
				MenuAdmin(opcionUsuario)
				
				Si opcionUsuario == 6 Entonces
					loginActivo <- Falso
				FinSi
			"Soporte" :
				MenuSoporte(opcionUsuario)
				
				Si opcionUsuario == 4 Entonces
					loginActivo <- Falso
				FinSi
		FinSegun
	Fin Mientras	 
FinAlgoritmo

SubAlgoritmo MenuChofer(opcionUsuario Por Referencia)
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

SubAlgoritmo  MenuCliente(opcionUsuario Por Referencia)
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

SubAlgoritmo  MenuAdmin(opcionUsuario Por Referencia)
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

SubAlgoritmo  MenuSoporte(opcionUsuario Por Referencia)
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
SubAlgoritmo  InicioSesion(user Por Referencia, pasw Por Referencia)
	
	Escribir "Ingrese su usuario";
	leer user
	Escribir "Ingrese su contraseña";
	Leer pasw
FinSubAlgoritmo

//Función que valida el acceso de las credenciales hardcodeadas y devuelve el valor del menú
Funcion tipoUsuario <- ValidaLogin (usu, psw) 
	
	Definir Chofer1, ClaveChofer1 Como Caracter; 	     // Variables Chofer
	Definir Cliente1, ClaveCliente1 Como Caracter;    // Variables Cliente 
	Definir Admin1, ClaveAdmin1 Como Caracter;       // Variables Administrador
	Definir soporte1, ClaveSoporte1 Como Caracter   // Variables Soporte	
	Definir tipoUsuario Como Caracter;             // Variable para el tipo de usuario
	
	//Credenciales hardcodeadas de los diferentes usuarios
	Chofer1 = "Chofer1";
	ClaveChofer1= "Chofer123";
	
	Cliente1 = "Cliente1";
	ClaveCliente1 = "Cliente123";
	
	Admin1 = "Admin1";
	ClaveAdmin1 = "Admin123";
	
	Soporte1 = "Soporte1";
	ClaveSoporte1 = "Soporte123";
	
	tipoUsuario = "Incorrecto"
	
	Si usu == Chofer1 y psw == ClaveChofer1 Entonces
		tipoUsuario = "Chofer"
	SiNo
		si usu == Cliente1 y psw == ClaveCliente1 Entonces
			tipoUsuario = "Cliente"
		SiNo 
			si usu == Admin1 y psw == ClaveAdmin1 Entonces
				tipoUsuario = "Admin"
			SiNo 
				si usu == Soporte1 y psw == ClaveSoporte1 Entonces
					tipoUsuario = "Soporte"
				FinSi
			FinSi
		FinSi
	FinSi
FinFuncion
	