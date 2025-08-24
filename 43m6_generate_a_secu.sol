Solidity
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/access/Roles.sol";

contract SecureWebAppController {
    address private owner;
    mapping (address => bool) private authorizedUsers;

    event AddUser(address indexed user);
    event RemoveUser(address indexed user);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    constructor() public {
        owner = msg.sender;
    }

    function addUser(address user) public onlyOwner {
        authorizedUsers[user] = true;
        emit AddUser(user);
    }

    function removeUser(address user) public onlyOwner {
        authorizedUsers[user] = false;
        emit RemoveUser(user);
    }

    function isAuthorized(address user) public view returns (bool) {
        return authorizedUsers[user];
    }

    function authenticate(bytes32 _username, bytes32 _password) public view returns (bool) {
        // TO DO: implement authentication logic using a secure hashing algorithm
        // For demonstration purposes, we'll use a simple equality check
        return _username == "admin" && _password == "password123";
    }
}