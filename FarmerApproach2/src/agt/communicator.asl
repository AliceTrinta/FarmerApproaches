/* Initial beliefs and rules */

/* Initial goals */
!start.

/* Plans */
+!start : true <- 
	.print("Connecting to RML");
	.connectToRml('127.0.0.1', 5500);
	!iotObjectCycle.
	
+!iotObjectCycle : true <-
	.print("Mandando para a RML");
	.sendToRml;
	.wait(1000);
	!iotObjectCycle.

+!on : true <-
	.print("Running the command 1.");
	.send(mediator, achieve, on).
	
+!off : true <-
	.print("Running the command 2.");
	.send(mediator, achieve, off).

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }
