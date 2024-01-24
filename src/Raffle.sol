// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
import {VRFCoordinatorV2Interface} from "@chainlink/contracts/src/v0.8/interfaces/VRFCoordinatorV2Interface.sol";


// import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
// import "@chainlink/contracts/src/v0.8/VRFConsumerBase.sol";
// import "@chainlink/contracts/src/v0.8/Chainlink.sol";
// import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";

/**
 * @title Raffle Smart Contract
 * @author AQ
 * @notice This contract creates a raffle
 * @dev A decentralized lottery smart contract with provably random draws.
 *      Users can enter the lottery by purchasing tickets, and the winner is
 *      automatically drawn after a specified period using Chainlink VRF and
 *      Chainlink Automation.
 */

contract Raffle {
    //errors
    error Raffle_NotEnoughEntranceFee();
    uint256 private constant REQUEST_CONFIRMATIONS = 3;
    uint256 private constant NUM_WORDS=1;
    // Contract state variables and events
    uint256 private immutable i_entranceFee;
    //@dev Duration of the lottery in seconds
    uint256 private immutable i_interval;
    address private immutable i_vrfCoordinator;
    bytes32 private immutable i_gasLane;
    uint64 private immutable i_subscriptionId;
    uint32 private immutable i_callbackGasLimit;

    address payable[] s_players;
    uint256 private s_lastTimeStamp;
    
    /**Events*/
    event EnteredRaffle(address indexed player);


    constructor(uint256 entranceFee, uint256 interval, address vrfCoordinator, bytes32 gasLane,uint64 subscriptionId, uint32 callbackGasLimit) {
        // Constructor logic goes here
        i_entranceFee = entranceFee;
        i_interval=interval;
        i_vrfCoordinator=vrfCoordinator;
        i_gasLane=gasLane;
        i_subscriptionId=subscriptionId;
        i_callbackGasLimit = callbackGasLimit;
        s_lastTimeStamp=block.timestamp;
    }

    // Function and modifier definitions
    function enterRaffle() external payable {
        if(msg.value<i_entranceFee){
            revert Raffle_NotEnoughEntranceFee();
        }
        s_players.push(payable(msg.sender));
        emit EnteredRaffle(msg.sender);
    }

    function pickWinner() external view {
        //check to see if enough time has passed
        if(block.timestamp - s_lastTimeStamp > i_interval){
            revert();
        }
        uint256 requestId = i_vrfCoordinator.requestRandomWords(
            i_gasLane,//gasLane
            i_subscriptionId,
            REQUEST_CONFIRMATIONS,
            i_callbackGasLimit,
            NUM_WORDS
        );
    }

    /**Getter functions */
    function getEntraceFee() external view returns(uint256){

    }
}
