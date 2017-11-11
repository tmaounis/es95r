contract KeyRegistry{
	enum type {Supreme, Bank, Funder}
	struct RegistryEntry{
		type keytype;
		address owner;
		bytes32 content;
	}

	mapping (address => RegistryEntry) public entries;

	event Register(type keytype, address owner, bytes32 content);


	//constructor
	function registry(){

	}

	function getKeyType(address addr){
		return entries[addr].keytype
	}

	function registerKey(type keytype, bytes32 msgHash, uint8 v, bytes32 r, bytes32 s) returns (bool _success){
		//Msg sender must be key owner proved by signature
		if(ecrecover(msgHash, v, r, s) != msg.sender){ //Not sure if should pass addr as input
			_success = false;
		}
		else{
			//Should we instantiate new contracts for register like SupremeKey, etc?

			//evaluate registering key type
			if (keytype == type.Supreme){
				//Creates a new network for keys under a new Supreme leadership
			} else if (keytype == type.Bank){
				//Goes to a vote
			} else if (keytype == type.Funder){
				//Funder must request Bank approval to register under
			}
		}
	}

}