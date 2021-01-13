pragma solidity ^0.5.0;

contract Owned{
    address owner;
    
    constructor() public {
        owner = msg.sender;
    }
    
    modifier onlyOwner {
        require(
            msg.sender == owner,
            "You must be the owner."
        );
        _;
    }
    
}

contract Ijazahstmik is Owned{
    struct Holder{
        bytes32 nama;
        uint nik;
        uint nim;
        string tglulus;
        uint nirl;
        uint noijazah;
        string noseri;
    }
    
    mapping (address => Holder) holders;
    address[] public holderAccts;
    
    event HolderInfo(
        bytes32 nama,
        uint nik,
        uint nim,
        string tglulus,
        uint nirl,
        uint noijazah,
        string noseri
    );
    
    
    
    function setHolder(address _address, bytes32 _nama, uint _nik,uint _nim,string memory _tglulus,uint _nirl, uint _noijazah, string memory _noseri) public{
        holders[_address].nama = _nama;
        holders[_address].nik = _nik;
        holders[_address].nim = _nim;
        holders[_address].tglulus = _tglulus;
        holders[_address].nirl = _nirl;
        holders[_address].noijazah = _noijazah;
        holders[_address].noseri = _noseri;
        holderAccts.push(_address);
        emit HolderInfo(_nama, _nik, _nim, _tglulus, _nirl, _noijazah, _noseri);
    }
    
    function getHolders() view public returns(address[] memory) {
        return holderAccts; 
    }
    
    function getHolder(address _address) view public returns(bytes32, uint, uint, string memory, uint, uint, string memory){
        return (holders[_address].nama, holders[_address].nik, holders[_address].nim, holders[_address].tglulus, holders[_address].nirl, holders[_address].noijazah, holders[_address].noseri);
    }
    
    function countHolders() view public returns(uint) {
        return holderAccts.length;
    }
}