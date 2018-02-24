 pragma solidity ^0.4.8;
/** @title simple multiply .
    for writing comment 

 */
contract Multiply7 {
   event Print(uint);
    uint aaa = 1000 ;
   /** @dev sample from solidity doc.
      * @param input Width of the rectangle.
      * @param h Height of the rectangle.
      * @return s The calculated input * 7.
      * @return p return the second argument .
      */
   function multiply(uint input,uint h) public returns (uint s, uint p) {
       //
        aaa -= 10;

      Print(input / 0);
      // reentrant vulnability ?
        aaa += 10;
      return ( input * 7,h );
   }
}
