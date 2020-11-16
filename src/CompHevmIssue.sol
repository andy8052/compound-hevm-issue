pragma solidity ^0.6.7;

interface IWETH {
    function deposit() external payable;

    function withdraw(uint256 wad) external;
}

interface CEth {
    function mint() external payable;

    function exchangeRateCurrent() external returns (uint256);

    function supplyRatePerBlock() external returns (uint256);

    function redeem(uint) external returns (uint);

    function redeemUnderlying(uint) external returns (uint);
}

contract CompHevmIssue {
    function supplyEthToCompound()
        public
    {
        IWETH(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2).withdraw(1 ether);
        // Create a reference to the corresponding cToken contract
        CEth cToken = CEth(0x4Ddc2D193948926D02f9B1fE9e1daa0718270ED5);

        cToken.mint.value(1 ether)();
    }
        
    // This is needed to receive ETH when calling `redeemCEth`
    receive() external payable {}
}
