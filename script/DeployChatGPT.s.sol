//SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {Script} from "../lib/forge-std/src/Script.sol";
import {chatGPT} from "../src/chatGPT.sol";
import {console} from "../lib/forge-std/src/console.sol";

contract DeployChatGPT is Script {
    uint256 public DEFAULT_ANVIL_PRIVATE_KEY =
        0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80;
    uint256 public deployerKey;

    function run() external returns (chatGPT) {
        if (block.chainid == 31337) {
            deployerKey = DEFAULT_ANVIL_PRIVATE_KEY;
        } else {
            deployerKey = vm.envUint("PRIVATE_KEY");
        }
        vm.startBroadcast(deployerKey);
        chatGPT chat = new chatGPT();
        vm.stopBroadcast();
        return chat;
    }
}
