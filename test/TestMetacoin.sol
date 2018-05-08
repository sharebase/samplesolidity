pragma solidity ^0.4.17;

import "truffle/Assert.sol";

contract TestMetacoin {

  string public bee = "2345";

  uint[][] public cells = new uint[][](10);

  function testInitialBalanceUsingDeployedContract () public {


    cells[0] = new uint[](10);
    cells[0][0] = 1;
    

    Assert.equal(cells[0][0],1,"");



  }


  function testBalance() public {
    bee = "0x2345";
    Assert.equal(bee, "0x2345","hogehoge");


    

  }



}