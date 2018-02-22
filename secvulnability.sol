 pragma solidity ^0.4.8;
/** @title simple multiply .
    for writing comment 

 */
contract Multiply7 {
   event Print(uint);

   /** @dev sample from solidity doc.
      * @param input Width of the rectangle.
      * @param h Height of the rectangle.
      * @return s The calculated input * 7.
      * @return p return the second argument .
      */
   function multiply(uint input,uint h) public returns (uint s, uint p) {
       //
      Print(input * 7);
      // c
      return ( input * 7,h );
   }
}
