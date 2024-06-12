// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

interface IAllocator {
    // Events
    event Withdraw(uint256 request, uint256 recovered, address receiver);
    event ChainDebtUpdate(uint256 newDebt);
    event StrategyAdded(address entryPoint, uint256 maxDeposit, string strategyName);
    event MaxDepositUpdated(address strategyAddress, uint256 maxDeposit);
    event StratPositionUpdated(uint256 currentIndex, uint256 newIndex, address stratAddress);
    event BridgeSuccess(uint256 amount, uint256 crateChainId);
    event StrategyUpdate(address strategy, uint256 newDebt);
    event DepositInStrategy(uint256 amount, address strategy);
    event Losses(address strategy, uint256 loss, uint256 amountMoved);
    event BridgeUpdated(address newBridge);
    event PanicLiquidate(address strategy);
    event PanicSet(address strategy, bool panicked);

    // Errors
    error CantUpdateCrate();
    error NotWhitelisted();
    error MaxDepositReached(address strategy);
    error StrategyAlreadyExists();
    error AddressIsZero();
    error AddressIsNotContract();
    error IncorrectArrayLengths();
    error StrategyPanicked(address strategy);

    // Functions
    function initialize(address _asset, uint256 _crateChainId) external;
    function bridgeBackFunds(uint256 _amount, uint256 _minAmount) external payable;
    function liquidateStrategy(uint256 _amount, uint256 _minAmountOut, address _strategy) external;
    function panicLiquidateStrategy(address _strategy) external;
    function retireStrategy(address _strategy) external;
    function dispatchAssets(uint256[] calldata _amounts, address[] calldata _strategies) external;
    function updateStrategyDebt(uint256 _newDebt) external;

    // View functions to be included if they are part of the public interface
    function strategiesList(uint256 index) external view returns (address);
    function strategiesData(address)
        external
        view
        returns (string memory strategyName, bool whitelisted, bool panicked, uint256 maxDeposit, uint256 debt);
    function bridgeConnector() external view returns (address);
    function crateChainId() external view returns (uint256);
    function asset() external view returns (address);
    function totalStrategysDebt() external view returns (uint256);
}
