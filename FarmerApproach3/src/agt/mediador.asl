/* Initial beliefs and rules */

/* Initial goals */
!start.

/* Plans */

+!start : true <- 
	percepts;
	//.wait(1000);
	!start.

+light(T) <-
	.print("peguei luz").
	/*if (T = "luzSem"){
		if(jia.dayTime("Hey")){
			.print("Algo errado, sem luz ao dia");
		}
	}.*/

+humidity(T) <-
	.print("Peguei humidade").
	/*if(T = "soloUmido"){
		if(jia.irrigation("hey")){
			!on
		}	
	}
	if (T = "soloSeco"){
		if(jia.chuvas("hey")){
			!off
		}
		!on
	}.*/

+temperature(T) <-
	.print("Peguei temp")
	if (T <= 10){
		.print("Algo errado, muito frio pode prejudicar a planta");
	}
	if (T >= 35){
		.print("Algo errado, muito calor pode prejudicar a planta");
	}.
	
+pH(T) <-
	.print("Peguei Ph").

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
