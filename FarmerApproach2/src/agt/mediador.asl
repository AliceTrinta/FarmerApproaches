/* Initial beliefs and rules */

/* Initial goals */

!start.

/* Plans */

+!start : true <- 
	percepts;
	.wait(1000);
	!start.

+light(T) <-
	.send(communicator, tell, light(T));
	if (T = "luzSem"){
		if(jia.dayTime("Hey")){
			.print("Algo errado, sem luz ao dia");
		}
	}.

+humidity(T) <-
	.send(communicator, tell, humidity(T));
	if(T = "soloUmido"){
		if(jia.irrigation("hey")){
			!on
		}	
	}
	if (T = "soloSeco"){
		if(jia.chuvas("hey")){
			!off
		}
		!on
	}.

+temperature(T) <-
	.send(communicator, tell, temperature(T));
	if (T <= 10){
		.print("Algo errado, muito frio pode prejudicar a planta");
	}
	if (T >= 35){
		.print("Algo errado, muito calor pode prejudicar a planta");
	}.
	
+pH(T) <-
	.print("Enviando ao communicador");
	.send(communicator, tell, pH(T)).

+!on : true <-
	.print("Pedindo ao artefato físico para ligar o irrigador.");
	act(on).
	
+!off : true <-
	.print("Pedindo ao artefato físico para desligar o irrigador.");
	act(off).

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }
