//SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {DeployChatGPT} from "../script/DeployChatGPT.s.sol";
import {chatGPT} from "../src/chatGPT.sol";
import {Test, console} from "../lib/forge-std/src/Test.sol";
import {StdCheats} from "../lib/forge-std/src/StdCheats.sol";
import {Interactions} from "../script/Interactions.s.sol";

contract ChatGPTTest is StdCheats, Test {
    string constant NFT_NAME = "chatGPT";
    string constant NFT_SYMBOL = "GPT";
    chatGPT public CHATGPT;
    DeployChatGPT public deployer;
    address public deployerAddress;

    string public constant image1 =
        "ipfs://QmXgfDPahQepCATzKHUJyvNqoQRhNT2J3qoFqmjD32W89A";

    address public constant USER = address(1);

    function setUp() public {
        deployer = new DeployChatGPT();
        CHATGPT = deployer.run();
    }

    function testInitializedCorrectly() public view {
        assert(
            keccak256(abi.encodePacked(CHATGPT.name())) ==
                keccak256(abi.encodePacked((NFT_NAME)))
        );
    }

    function testCanMintAndHaveABalance() public {
        vm.prank(USER);
        CHATGPT.mintNft(image1);
        assert(CHATGPT.balanceOf(USER) == 1);
    }
}
