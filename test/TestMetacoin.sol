pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "contracts/Migrations.sol";

contract TestMetacoin {

  string public bee = "2345";

  uint[][] public cells = new uint[][](10);

  function testInitialBalanceUsingDeployedContract () public {


    cells[0] = new uint[](10);
    cells[0][0] = 1;
    
    Migrations migrations = new Migrations();

    uint a = migrations.getCells(0,0);
    Assert.equal(cells[0][0],1,"");

    Assert.equal(a,0,"");

  }


  function testBalance() public {
    bee = "0x2345";
    Assert.equal(bee, "0x2345","hogehoge");


    

  }



}