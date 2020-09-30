// CArtAgO artifact code for project approach2

package approach2;

import cartago.*;

public class Device extends PhysicalArtifact {
	void init() {
		defineObsProperty("light", "");
		defineObsProperty("humidity", "");
		defineObsProperty("temperature", 0);
		defineObsProperty("ph", 0);
	}
	
	@Override
	protected int defineAttemptsAfterFailure() {
		return 3;
	}

	@Override
	protected String definePort() {
		// TODO Auto-generated method stub
		return "COM3";
	}

	@Override
	protected int defineWaitTimeout() {
		return 1000;
	}

	@Override
	public void onIoTAction(String arg0) {
		// TODO Auto-generated method stub
		
	}
}

