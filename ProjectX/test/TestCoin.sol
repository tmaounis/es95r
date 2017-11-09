pragma solidity ^0.4.11;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Coin.sol";

contract TestCoin {
	Coin coin = Coin(DeployedAddresses.Coin());

	function testMinter{
		// Expected owner is this contract
	  	address expected = this;

	  	//Not sure if how we should test ownershio
	  	Assert.equal(expected, coin.minter, "Owner of contract should be this contract")
	}

	function testMint(){
		
	}

	function testInitialBalanceUsingDeployedContract() {

		uint expected = 10000;

		Assert.equal(coin.getBalance(tx.origin), expected, "Owner should have 10000 Coin initially");
	}

	function testInitialBalanceWithNewMetaCoin() {
		Coin meta = new Coin();

		uint expected = 10000;

		Assert.equal(meta.getBalance(tx.origin), expected, "Owner should have 10000 Coin initially");
	}

}