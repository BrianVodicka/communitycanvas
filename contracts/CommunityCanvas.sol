pragma solidity ^0.4.4;

contract CommunityCanvas {

  uint32[786432] public pixels;
  mapping(address => uint64) lastEdit;

  function changePixel(pixel, color) public view {
    require(lastEdit[msg.sender] <= uint64(now) + 300);
    require(0 <= pixel <= 786432);
    require(0 <= color <= 15);
    pixels[pixel] = color;
  }

}
