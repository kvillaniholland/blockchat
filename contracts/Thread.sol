pragma solidity ^0.4.17;

contract Thread {
  struct Post {
      address poster;
      string name;
      string comment;
      uint id;
  }
  Post[] posts;
  uint postNumber;

  function makePost(string name, string comment) public returns (uint) {
    uint id = postNumber;
    Post memory thePost = Post(msg.sender, name, comment, id);

    posts.push(thePost);
    postNumber++;
    return id;
  }

  function getPost(uint index) public view returns (address, string, string, uint) {
    return (posts[index].poster, posts[index].name, posts[index].comment, posts[index].id);
  }
}
