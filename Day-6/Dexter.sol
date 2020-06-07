pragma solidity >=0.4.22 <0.7.0;


contract Dexter {
    address public creator;
    mapping (address => uint) public balances;
    
    
    event Sent(address from, address to, uint amount);

    function dexter() public {
        creator = msg.sender;
    }

    function create(address receiver, uint amount) public {
        if(msg.sender != creator) return;
        balances[receiver]+=amount;
    }

    function transfer(address receiver, uint amount) public {
        if(balances[msg.sender] < amount) return;
        balances[msg.sender]-=amount;
        balances[receiver]+=amount;
        emit Sent(msg.sender, receiver, amount);
    }

}