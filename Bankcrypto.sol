//Bank crypto contract 

pragma solidity ^0.4.0;

//address public bank;

contract Coin {

	address public minter; 
	mapping (address => uint256) public balances; 
	
	//logging of sending activity 
	event Sent(address from, address to, uint amount);

	function Coin() {
		minter = msg.sender;
	}

	function mint(address receiver, uint amount) {
		if (msg.sender != minter) return;
		balances[receiver] += amount; 
	}

	function destroy(address receiver, uint amount) {
		if(msg.sender != minter) return; 
		balances[receiver] -= amount; 
	}

	function send(address receiver, uint amount) {
		if (balances[msg.sender] < amount) return;
		balances[msg.sender] -= amount; 
		balances[receiver] += amount; 
		Sent(msg.sender, receiver, amount); 
	}

}