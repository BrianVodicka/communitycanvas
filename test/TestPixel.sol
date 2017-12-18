pragma solidity ^0.4.11;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/CommunityCanvas.sol";

contract TestPixel {
  CommunityCanvas cc = CommunityCanvas(DeployedAddresses.CommunityCanvas());
  
  function testChangePixelColor() {
    cc.changePixel(0, 1);
    uint8 color;
    address addr;
    (color, addr) = cc.getSpecificPixel(0);
  
    Assert.equal(uint(color), 1, "Pixel 0 should be color 1");

  }

  function testUserTimeout() {
      
    cc.changePixel(1, 1);    
    cc.changePixel(1, 2);    

    uint8 color;
    address addr;
    (color, addr) = cc.getSpecificPixel(0);

    Assert.equal(uint(color), 1, "Second change should not have worked");

  }

}
