contract IInformation {

	address sourceAddress;
	
	event FieldChanged(int field, bytes newValue, address sourceAddress, uint requestId);

	function setField(int field, bytes value, uint requestId) onlySource returns (bool ok);

	modifier onlySource() {
		require(msg.sender == sourceAddress);
		_;
	}
}