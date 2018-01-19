pragma solidity ^0.4.18;

contract SimpleContract{
    string fName;
    uint age;
    address owner;

    function SimpleContract() public{
        owner = msg.sender;
    }

    modifier onlyOwner{
        require(msg.sender == owner);
        _;
    }

    event Details(string name, uint age);

    function setDetails(string _fName, uint _age) onlyOwner public{
        fName = _fName;
        age = _age;
        Details(_fName, _age);
    }

    function getDetails() view public returns (string, uint){
        return (fName, age);
    }

}