package grails220;


class PnrData {
	long responseCode;
	long pnr;
	String trainNo;
	String trainName;
	String doj;
	List<Passengers> passengers;
	String cls;
	String fromStation;
	String fromCode;
	String toStation;
	String toCode;
	String resupCode;
	String resupName;
	String boardCode;
	String error;
	String chartPrepared;
	
	
	
	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

	public String getCls() {
		return cls;
	}

	public void setCls(String cls) {
		this.cls = cls;
	}

	public String getFromStation() {
		return fromStation;
	}

	public void setFromStation(String fromStation) {
		this.fromStation = fromStation;
	}

	public String getFromCode() {
		return fromCode;
	}

	public void setFromCode(String fromCode) {
		this.fromCode = fromCode;
	}

	public String getToStation() {
		return toStation;
	}

	public void setToStation(String toStation) {
		this.toStation = toStation;
	}

	public String getToCode() {
		return toCode;
	}

	public void setToCode(String toCode) {
		this.toCode = toCode;
	}

	public String getrUpToCode() {
		return resupCode;
	}

	public void setrUpToCode(String rUpToCode) {
		this.resupCode = rUpToCode;
	}

	public String getrUPToName() {
		return resupName;
	}

	public void setrUPToName(String rUPToName) {
		this.resupName = rUPToName;
	}

	public String getBoardCode() {
		return boardCode;
	}

	public void setBoardCode(String boardCode) {
		this.boardCode = boardCode;
	}

	public String getBoardName() {
		return boardName;
	}

	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}



	String boardName;

	public long getResponseCode() {
		return responseCode;
	}

	public void setResponseCode(long responseCode) {
		this.responseCode = responseCode;
	}

	public long getPnr() {
		return pnr;
	}

	public void setPnr(long pnr) {
		this.pnr = pnr;
	}

	public String getTrainNo() {
		return trainNo;
	}

	public void setTrainNo(String trainNo) {
		this.trainNo = trainNo;
	}

	public String getTrainName() {
		return trainName;
	}

	public void setTrainName(String trainName) {
		this.trainName = trainName;
	}

	public String getDoj() {
		return doj;
	}

	public void setDoj(String doj) {
		this.doj = doj;
	}

	public List<Passengers> getPassengers() {
		return passengers;
	}

	public void setPassengers(List<Passengers> passengers) {
		this.passengers = passengers;
	}
	
	
	
	public String toString(){
		String pass="";
		for(int i = 0;i<this.passengers.size();i++){
			Passengers p = new Passengers();
			p = passengers.get(i);
			
			pass+="Sr NO "+p.sr+" BookingStatus"+p.bStatus+" CurrentStatus"+p.cStatus+"\n";
		}
		
		return "Response code is"+responseCode+" PnrNo"+pnr+"\n TrainNo"+trainNo+"\nTrainName"+trainName+"\nDoj"+doj+"\nPassengersList"+pass+"\nError"+error;
	}

}
