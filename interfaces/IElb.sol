// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

interface IElb {
    // Events
    event RampA(uint256 oldA, uint256 newA, uint256 initialTime, uint256 futureTime);
    event StopRampA(uint256 currentA, uint256 time);
    event RewardsConfigSet(address controller, address manager);
    event MigrationWithdrawFailed(uint256 aTokenBalance);

    // Errors
    error WrongLength();
    error WrongToken();
    error WrongIndex();
    error WrongDecimals(uint8 decimals, uint256 index);
    error WrongAFactor(uint256 a);
    error DeadlineCheck(uint256 deadline, uint256 blockTimestamp);
    error OnlyCrate();
    error WrongBalance(uint256 balance, uint256 expected);
    error MigrationError();
    error ZeroAmount();

    // View functions
    function getA() external view returns (uint256);
    function getAPrecise() external view returns (uint256);
    function getPooledToken(uint8 index) external view returns (address);
    function getPooledTokenIndex(address tokenAddress) external view returns (uint8);
    function getTokenBalance(uint8 index) external view returns (uint256);
    function getAssetBalance() external view returns (uint256);
    function getVirtualPrice() external view returns (uint256);
    function calculateSwap(uint8 tokenIndexFrom, uint8 tokenIndexTo, uint256 dx) external view returns (uint256);
    function calculateAssetToVirtual(uint256 dx) external view returns (uint256);
    function calculateVirtualToAsset(uint256 dx) external view returns (uint256);
    function getReturnsBalance() external view returns (uint256);
    function getVirtualLpBalance() external view returns (uint256);

    // State modifying functions
    function swapVirtualToAsset(uint256 _dx, uint256 _minDy, uint256 _deadline, address _receiver)
        external
        returns (uint256 dy);
    function swapAssetToVirtual(uint256 _dx, uint256 _deadline) external returns (uint256);
    function addLiquidity(uint256 amount, uint256 deadline) external returns (uint256);
    function removeLiquidity(uint256 amount, uint256 deadline) external returns (uint256 recovered);
    function withdrawUnderlyingReturns() external;
    function claimRewards() external returns (uint256);
    function setRewardsConfig(address _controller, address _manager) external;
    function rampA(uint256 futureA, uint256 futureTime) external;
    function stopRampA() external;
    function migrate() external;
    function recoverAssets(uint256 _amount) external;

    // Public State Variables
    function CRATE() external view returns (address);
    function UNDERLYING_TOKENS() external view returns (address[] memory);
    function LENDING_POOL() external view returns (address); // ILendingPool
    function incentivesController() external view returns (address); // IAaveIncentivesController
    function rewardsManager() external view returns (address);
    function migrated() external view returns (bool);
}
