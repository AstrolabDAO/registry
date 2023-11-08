// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

interface IStrategyV5 {
    // Events
    event Harvest(uint256 block);
    event Compound(uint256 newDebt, uint256 block);
    event Deposit(uint256 newDebt, uint256 block);
    event chargedFees(uint256 amount);
    event FeesUpdated(uint256 newFee);
    event RouterUpdated(address indexed newRouter);
    event feeRecipientUpdated(address indexed newFeeRecipient);

    // Functions that need to be exposed
    function liquidate(uint256 _amount, uint256 _minAmountOut, bool _panic) external returns (uint256 assetsRecovered, uint256 newDebt);
    function withdrawRequest(uint256 _amount) external returns (uint256);
    function deposit(uint256 _maxDeposit, uint256 _minTokensOut) external returns (uint256 newDebt, uint256 tokensReceived);
    function harvest(bytes memory _params) external returns (uint256[] memory assetsReceived);
    function compound(uint256 _maxDeposit, bytes memory _params) external returns (uint256 newDebt, bytes memory paramsEstimation);
    function updateFee(uint256 _feeAmount) external;
    function updateFeeRecipient(address _feeRecipient) external;
    function inCaseTokensGetStuck(address _token) external;
    function available() external view returns (uint256);
    function rewardsAvailable() external view returns (uint256[] memory rewardAmounts);
    function investedInPool() external view returns (uint256);
    function totalBalance() external view returns (uint256);
    function updateSwapManager(address _swapManager) external;
    function removeAllowances() external;
}
