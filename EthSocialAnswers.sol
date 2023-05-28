// SPDX-License-Identifier: MIT


//TASK 1
//SET VERSION TO ^0.8.17;
pragma solidity ^0.8.17;


contract SocialETH {

    struct UserStruct {
        string username;
        uint age;
        bool isUser;

    }

// TASK 2
//CREETE A STRUCT THAT HAS AS ATTRIBUTES: title, body, time
    struct Post {
     string title;
     string body;
     uint time;

    }

//TASK 3
//CRAETE A MAPPING called "users" that has keys of type "address", and values of type "UserStruct"


    mapping (address => Post[]) posts;
    mapping (address => UserStruct) users;
    uint userCount;


//TASK 4
//COMPLETE THE RETURN STATEMENT
    function getUser (address _userAddress) public view returns (UserStruct memory){
    //    require(users[_userAddress].isUser == true, "User does not exist");
       require(users[_userAddress].isUser == true, "User does not exist");
       return users[_userAddress];
    }

//TASK 5
//INSTANTIATE username, age, isUser
    function craeteUser (address _userAddress, string memory _username, uint _age) public returns (bool success){

        UserStruct memory user;

        user.age = _age;
        user.username = _username;
        user.isUser = true;

        users[_userAddress] = user;
        userCount ++;
        return true;
    }

//TASK 6
//RETURN THE TOTAL NUMBER OF USERS (userCount)
    function getTotalUsers () public view returns (uint) {
    return userCount;
    }


    function craetePost (
        address _userAddress,
        string memory _title,
        string memory _body
    ) 
    public returns (bool) {
        

        require(users[_userAddress].isUser == true, "User not registered");

        require (_userAddress == msg.sender, "You can only post on your behalf");

        
        Post memory newPost;
//TASK 7
//INTSANTIATE title, body, and time (Hint: for time you can use the property'timestamp' from 'block')
       newPost.title = _title;
       newPost.body = _body;
       newPost.time = block.timestamp;



        posts[_userAddress].push(newPost);
        return true;
    }
//TASK 8
//RETURN THE POSTS CORRESPONDING TO A GIVEN ADDRESS
    function getPosts(address _userAddress) public view returns (Post[] memory) {
      return posts[_userAddress];
    }

//TASK 9
// In getUser(): check if the user exists, otherwise throw "User does not exist"

require(users[_userAddress].isUser == true, "User does not exist");

//TASK 10
// In createPost(): check if user is registered, otherwise throw "User not registered"

require(users[_userAddress].isUser == true, "User not registered");

//TASK 11
// In createPost(): check if user only posts on their behalf, otherwise throw "You can only post on your behalf"
require(_userAddress == msg.sender,  "You can only post on your behalf");

}