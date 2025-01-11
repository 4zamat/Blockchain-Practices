pragma solidity ^0.8.15;

contract Auction {
    address public highestBidder;
    uint256 public highestBid;

    function placeBid() public payable {
        require(msg.value > highestBid, "Bid too low");

        highestBidder = msg.sender;
        highestBid = msg.value;
    }

    function getHighestBid() public view returns (address, uint256) {
        return (highestBidder, highestBid);
    }
}
