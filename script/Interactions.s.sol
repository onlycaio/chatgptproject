//SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {Script, console} from "../lib/forge-std/src/Script.sol";
import {DevOpsTools} from "../lib/foundry-devops/src/DevOpsTools.sol";
import {chatGPT} from "../src/chatGPT.sol";

contract Interactions is Script {
    string public constant image1 =
        "ipfs://QmXgfDPahQepCATzKHUJyvNqoQRhNT2J3qoFqmjD32W89A";
    string public constant image2 =
        "ipfs://QmZa5dC1rov9FurSQcXg83NiheqNEZc5pWdLaXHx24jmi7";
    string public constant image3 =
        "ipfs://QmU1MYa1zaDwtfj2BAWnjK5DsowKD2UKLRKmUgEpitCnLv";
    string public constant image4 =
        "ipfs://QmVR5DXE2kuHvUG1E6bKh9UAtPJ6kKgF773Bhmrxt6aNfA";
    string public constant image5 =
        "ipfs://QmNsw86aZ7KD6E8BxR9f4xThiYWEY3sWj3NAayU6gM7ipo";
    string public constant image6 =
        "ipfs://QmPkTN9yzsQeZphiADXFp1834udJCoQAiKtkd3suVtddMP";

    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment(
            "chatGPT",
            block.chainid
        );
        mintNFTOnContract(mostRecentlyDeployed);
    }

    function mintNFTOnContract(address contractAddress) public {
        vm.startBroadcast();
        chatGPT(contractAddress).mintNft(image1);
        vm.stopBroadcast();
    }
}
