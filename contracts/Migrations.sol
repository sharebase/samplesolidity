pragma solidity ^0.4.17;

contract Migrations {
  address public owner;
  uint public last_completed_migration;

  uint[][] public cells = new uint[][](10);

  modifier restricted() {
    if (msg.sender == owner) _;
  }

  function Migrations() public {
    owner = msg.sender;

    for(uint i = 0 ; i < 10 ; ++i){
      cells[i] = new uint[](10);
    }

  }

  function setCompleted(uint completed) public restricted {
    last_completed_migration = completed;
  }

  function upgrade(address newAddress) public restricted {
    Migrations upgraded = Migrations(newAddress);
    upgraded.setCompleted(last_completed_migration);
  }

  function getCells(uint a,uint b) public view returns (uint r) {
    return cells[a][b];
  }

}
