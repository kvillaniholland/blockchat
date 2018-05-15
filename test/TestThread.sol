pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Thread.sol";

contract TestThread {
  Thread thread = Thread(DeployedAddresses.Thread());

  function testCanMakePost() public {
    uint expectedId = 0;
    uint returnedId = thread.makePost('Test', 'Test Comment');

    Assert.equal(returnedId, expectedId, "New post should have ID 0");
  }

  function testCanRetrievePost() public {
    string memory expectedName = 'Test';
    string memory expectedContent = 'Test Comment';
    var (returnedPoster, returnedName, returnedContent, returnedId) = thread.getPost(1);

    Assert.equal(expectedName, returnedName, "Post 1 should have name Test");
  }

}
