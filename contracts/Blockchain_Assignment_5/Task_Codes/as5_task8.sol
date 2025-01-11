pragma solidity ^0.8.15;

contract Auction {
    // State variables
    address public highestBidder; // Address of the highest bidder
    uint256 public highestBid;    // Value of the highest bid

    // Function to place a bid
    function placeBid() public payable {
        require(msg.value > highestBid, "Bid too low"); // Ensure the bid is higher than the current highest bid

        // Update the highest bid and highest bidder
        highestBidder = msg.sender;
        highestBid = msg.value;
    }

    // Function to get the current highest bid and bidder (optional for testing purposes)
    function getHighestBid() public view returns (address, uint256) {
        return (highestBidder, highestBid);
    }
}
