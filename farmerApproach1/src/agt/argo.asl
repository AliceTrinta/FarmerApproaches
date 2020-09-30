// Agent sample_agent in project farmerSMA

/* Initial beliefs and rules */

/* Initial goals */

!start.

/* Plans */

+!start : true <- 
	.port(COM3);
	.percepts(open).

+light(T) <-
	.send(mediator, tell, light(T)).
+humidity(T) <-
	.send(mediator, tell, humidity(T)).
+temperature(T) <-
	.send(mediator, tell, temperature(T)).
+pH(T) <-
	.send(mediator, tell, pH(T)).

+!on : true <-
	.print("Turning irrigator ON.");
	.act(ON);
	.wait(1000);
	!off.
	
+!off : true <-
	.print("Turning irrigator OFF.");
	.act(OFF).

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }
