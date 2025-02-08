// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Auction {
    address public owner;
    uint256 public startTime;
    uint256 public endTime;
    uint256 public highestBid;
    address public highestBidder;
    mapping(address => uint256) public bids;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _; // This allows the function to continue executing after the modifier check
    }


    modifier auctionActive() {
        require(block.timestamp >= startTime && block.timestamp <= endTime, "Auction is not active");
        _;
    }

    modifier auctionEnded() {
        require(block.timestamp > endTime, "Auction has not ended yet");
        _;
    }

    constructor() {
        owner = msg.sender;
    }
    
    address[] public bidders;

    function startAuction(uint256 duration) public onlyOwner {
        startTime = block.timestamp;
        endTime = startTime + duration;
    }

    function placeBid() public payable auctionActive {
        require(msg.value > highestBid, "Bid must be higher than the current highest bid");

        if (bids[msg.sender] == 0) { // Add to bidders list only if it's a new bidder
            bidders.push(msg.sender);
        }

        if (highestBidder != address(0)) {
            bids[highestBidder] += highestBid;
        }

        highestBid = msg.value;
        highestBidder = msg.sender;
        bids[msg.sender] += msg.value;
    }


    function endAuction() public onlyOwner auctionEnded {
        require(highestBidder != address(0), "No bids placed");

        // Transfer the highest bid to the owner
        payable(owner).transfer(highestBid);

        // Refund non-winning bidders
        for (uint256 i = 0; i < bidders.length; i++) {
            address bidder = bidders[i];
            if (bidder != highestBidder && bids[bidder] > 0) {
                uint256 amount = bids[bidder];
                bids[bidder] = 0;
                payable(bidder).transfer(amount);
            }
        }
    }


    function withdraw() public auctionEnded {
        require(msg.sender != highestBidder, "Winner cannot withdraw");
        uint256 amount = bids[msg.sender];
        require(amount > 0, "No funds to withdraw");

        bids[msg.sender] = 0;
        payable(msg.sender).transfer(amount);
    }
}