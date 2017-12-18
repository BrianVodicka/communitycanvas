pragma solidity ^0.4.4;

contract CommunityCanvas {

  uint8[786432] public pixels;
  mapping(uint24 => uint64) pixelToEditMap;
  mapping(address => uint64) personToLastEdit;

  function changePixel(uint24 pixel, uint8 color) public returns(uint8) {
    require(personToLastEdit[msg.sender] <= uint64(now) + 300);
    require(pixel >= 0 && pixel <= 786431);
    require(color >= 0 && color <= 15);

    personToLastEdit[msg.sender] = uint64(now);

    pixels[pixel] = color;
    pixelToEditMap[pixel] = uint64(now);

    return 0;
  }

  function getPixels() public view returns (uint8[786432]) {
    return pixels;
  }

  function getSpecificPixel(uint24 target) public view returns (uint8, uint64) {
    return (pixels[target], pixelToEditMap[target]);
  }

  function () public payable {}

}
