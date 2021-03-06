pragma solidity >= 0.6;
import "./MultipleEntity.sol";

contract MultipleEntityFactory {
    struct Account {
        address entity;
        address[] source;
        string description;
    }
    
    Account[] public Array;

    function create(string memory description, address[] memory entities) public {
        Account memory toCreate;
        toCreate.description = description;
        MultipleEntity me = new MultipleEntity(entities);
        toCreate.source = entities;
        toCreate.entity = address(me);

        Array.push(toCreate);
    }
    function entityLength() public view returns(uint256){
        return Array.length;
    }

    function loadSource(uint index) public view returns(address[] memory){
        return Array[index].source;
    }

}