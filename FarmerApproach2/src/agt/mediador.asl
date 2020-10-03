/* Initial beliefs and rules */

/* Initial goals */

!start.

/* Plans */

+!start : true <- 
	percepts;
	.wait(1000);
	!start.

+light(T) <-
	.send(communicator, tell, light(T)).

+humidity(T) <-
	.send(communicator, tell, humidity(T)).

+temperature(T) <-
	.send(communicator, tell, temperature(T)).
	
+pH(T) <-
	.send(communicator, tell, pH(T)).


+!light : light == "noLight" & jia.dayTime("Hey")  <-
	.send(communicator, tell, light(WithoutLighDuringTheDay));
	!light.

+!light : light == "withLight" & jia.dayTime("Hey") == false <-
	.send(communicator, tell, light(LightDuringTheNight));
	!light.

+!humidity : humidity == "wet" & jia.irrigation("Hey") | T == "Dry" & jia.isRaining("Hey") == false <-	
	!on;
	!humidity.

+!humidity : humidity == "dry" & jia.isRaining("Hey") <-
	.send(communicator, tell, humidity(humi));
	!off;
	!humidity.

+!temperature : temperature <= 10 <-
	.send(communicator, tell, temperature(Too_cold_for_plants));
	!temperature.
	
+!temperature(temp) : temperature >= 35 <-
	.send(communicator, tell, temperature(Too_hot_for_plants));
	!temperature.

+!pH : ph < 5 <-
	.send(communicator, tell, pH(ph_level_too_Low));
	!pH.

+!pH : ph > 5.8 <-
	.send(communicator, tell, pH(ph_level_too_High))
	!pH.

+!on : true <-
	.print("Asking physical artifact to turn on the irrigator.");
	act(on).
	
+!off : true <-
	.print("Asking physical artifact to turn off the irrigator.");
	act(off).

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have an agent compliant with its organisation
//{ include("$moiseJar/asl/org-obedient.asl") }
