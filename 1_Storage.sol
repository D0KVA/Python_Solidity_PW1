// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.7 <0.9.0;

contract Money {

    struct Chelik {
        address userAddress;
        uint256 balance;
    }

    Chelik [] public chels;

    event proverka(address _from, uint256 _amount);
    event addBalance(address _user, uint256 _amount);

    function Nachislenie_Money() external payable{
        emit addBalance(msg.sender, msg.value);
        emit proverka(msg.sender, msg.value);
    }

    function getBalance(address user) public view returns (uint256){
        return address(user).balance;
    }
    
    event op(address _to, uint256 _amount);

    function Otpravit(uint256 _amount) public {
        require(_amount <= address(this).balance, "Nedostatok sredstv");
        require(_amount > 0, "Vvedite znachenie bolshe 0");
        payable (msg.sender).transfer(_amount);
        emit op(msg.sender, _amount);
    }
}