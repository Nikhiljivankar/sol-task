// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

error UnderflowError();

contract Splite {
    address public constant addr1 = 0x047425f8d784dcc6d73df12bc6eeca3aa51f4fb2; 
    address public constant addr2 = 0x522eb82b8394f1abc499be2b986b79feaf7e451e;

    struct userInfo {
    address  addr;
    uint256 value;
    }

    mapping(uint256 => userInfo) users;
    uint256[] public userIds;

      function registerUser(address addr, uint256 value, uint256 id) public {
        userInfo storage newUser = users[id];
        newUser.addr = addr;
        newUser.value = value;
        userIds.push(id);
    }

    // Function to get the user
    function getUser(uint256 id) public view returns (address , uint256){
        userInfo storage u = userIds[id];
        return (u.addr,u.value);
    }

    // function splite(uint _num) public {
    function splite(address[] memory _addrs, uint _num) public {
        // userInfo storage u1 = userIds[0];
        // userInfo storage u2 = userIds[1];
        userIds = uint256(_addrs);
        
        if(userIds[0] == addr1){ 
            // u1.value = u1.value + ((_num * 30)/100);
            userIds[0].transfer((_num * 30)/100);
        }
        else if(userIds[1].addr == addr2){
            // u2.value = u2.value + ((_num * 70)/100);
            userIds[1].transfer((_num * 30)/100);

        }
    }
}