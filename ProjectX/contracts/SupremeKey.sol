//Key with permissions of the regulator

pragma solidity ^0.4.11;

contract SupremeKey {
	mapping (address => bool) public approvedBankKeys; 

	function execute(address _to, uint _value, bytes _data) returns (bytes32 _id){

	}

	function confirm(bytes32 _id) returns (bool _success){
		
	}
}