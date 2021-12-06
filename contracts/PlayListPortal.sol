pragma solidity ^0.8.0;
import "hardhat/console.sol";

contract PlayListPortal {
    uint256 public totalList;

    struct SpotifyPlayList {
        address sender;
        string name;
        string description;
        string url;
        uint256 timestamp;
    }

    SpotifyPlayList[] lists;
    event NewPlayList(
        address sender,
        string name,
        string description,
        string url,
        uint256 timestamp
    );

    constructor() {
        console.log("PlayListPortal contract is deployed");
    }

    function createPlayList(
        string memory _name,
        string memory _description,
        string memory _url
    ) public {
        totalList += 1;

        lists.push(
            SpotifyPlayList(
                msg.sender,
                _name,
                _description,
                _url,
                block.timestamp
            )
        );
        emit NewPlayList(
            msg.sender,
            _name,
            _description,
            _url,
            block.timestamp
        );
    }

    function getPlayListItems() public view returns (SpotifyPlayList[] memory) {
        return lists;
    }

    function getPlayListCount() public view returns (uint256 count) {
        return totalList;
    }
}
