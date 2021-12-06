pragma solidity ^0.8.0;
import "hardhat/console.sol";

contract PlayListPortal {
    uint256 public totalList;

    struct SpotifyPlayList {
        string name;
        string description;
        uint256 totalSong;
        uint256 totalArtist;
        uint256 totalAlbum;
        string url;
    }

    mapping(uint256 => SpotifyPlayList) public SpotifyPlayLists;
    uint256[] public playListIds;

    constructor() {
        console.log("PlayListPortal contract is deployed");
    }

    function createPlayList(
        string memory _name,
        string memory _description,
        uint256 _totalSong,
        uint256 _totalArtist,
        uint256 _totalAlbum,
        string memory _url,
        uint256 id
    ) public {
        SpotifyPlayList storage newPlayList = SpotifyPlayLists[id];
        newPlayList.name = _name;
        newPlayList.description = _description;
        newPlayList.url = _url;
        newPlayList.totalSong = _totalSong;
        newPlayList.totalArtist = _totalArtist;
        newPlayList.totalAlbum = _totalAlbum;
        playListIds.push(id);
    }

    function getPlayList(uint256 id)
        public
        view
        returns (
            string memory name,
            string memory description,
            uint256 totalSong,
            uint256 totalArtist,
            uint256 totalAlbum,
            string memory url
        )
    {
        SpotifyPlayList storage playList = SpotifyPlayLists[id];
        return (
            playList.name,
            playList.description,
            playList.totalSong,
            playList.totalArtist,
            playList.totalAlbum,
            playList.url
        );
    }

    function getPlayListCount() public view returns (uint256 count) {
        return playListIds.length;
    }
}
