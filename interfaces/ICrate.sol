// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

interface ICrate {
    // Events
    event Deposit(address indexed sender, address indexed owner, uint256 assets, uint256 shares);
    event Withdraw(
        address indexed sender, address indexed receiver, address indexed owner, uint256 assets, uint256 shares
    );
    event ChainDebtUpdated(uint256 newChainDebt, uint256 oldChainDebt, uint256 chainId);
    event SharePriceUpdated(uint256 shareprice, uint256 timestamp);
    event TakeFees(
        uint256 gain,
        uint256 totalAssets,
        uint256 managementFee,
        uint256 performanceFee,
        uint256 sharesMinted,
        address indexed receiver
    );
    event NewFees(uint256 performance, uint256 management, uint256 withdraw);
    event LiquidityRebalanced(uint256 recovered, uint256 earned);
    event PoolMigrated(address indexed newPool, uint256 seedAmount);
    event LiquidityChanged(uint256 oldLiquidity, uint256 newLiquidity);
    event LiquidityPoolEnabled(bool enabled);
    event MigrationFailed();
    event ChainAdded(uint256 chainId, address bridge);
    event MaxDepositForChainSet(uint256 chainId, uint256 maxDeposit);
    event MaxTotalAssetsSet(uint256 maxTotalAssets);

    // Functions
    function safeDeposit(uint256 _amount, address _receiver, uint256 _minShareAmount, uint256 _deadline)
        external
        returns (uint256 shares);
    function deposit(uint256 _amount, address _receiver) external returns (uint256 shares);
    function mint(uint256 _shares, address _receiver) external returns (uint256 assets);
    function withdraw(uint256 _amount, address _receiver, address _owner) external returns (uint256 shares);
    function safeWithdraw(uint256 _amount, uint256 _minAmount, uint256 _deadline, address _receiver, address _owner)
        external
        returns (uint256 shares);
    function redeem(uint256 _shares, address _receiver, address _owner) external returns (uint256 assets);
    function safeRedeem(uint256 _shares, uint256 _minAmountOut, uint256 _deadline, address _receiver, address _owner)
        external
        returns (uint256 assets);
    function rebalanceLiquidityPool() external returns (uint256 earned);
    function dispatchAssets(
        uint256[] calldata _amounts,
        uint256[] calldata _minAmounts,
        uint256[] calldata _chainIds,
        uint256[] calldata _msgValues,
        bytes[] calldata _bridgeData
    ) external payable;
    function migrateLiquidityPool(address _newPool, uint256 _seedAmount) external;
    function increaseLiquidity(uint256 _liquidityAdded) external;
    function decreaseLiquidity(uint256 _liquidityRemoved) external;
    function unrealizedGains() external view returns (uint256);
    function totalAssets() external view returns (uint256);
    function decimals() external view returns (uint8);
    function sharePrice() external view returns (uint256);
    function convertToShares(uint256 _assets) external view returns (uint256);
    function convertToAssets(uint256 _shares) external view returns (uint256);
    function previewDeposit(uint256 _assets) external view returns (uint256 shares);
    function previewMint(uint256 _shares) external view returns (uint256);
    function previewWithdraw(uint256 _assets) external view returns (uint256);
    function previewRedeem(uint256 shares) external view returns (uint256);
    function receiveBridgedFunds(uint256 _chainId, uint256 _amount) external;
    function updateChainDebt(uint256 _chainId, uint256 _newDebt) external;
    function maxDeposit(address) external view returns (uint256);
    function maxMint(address) external view returns (uint256);
    function maxWithdraw(address _owner) external view returns (uint256);
    function maxRedeem(address _owner) external view returns (uint256);
    function takeFees() external;
    function computeFees()
        external
        view
        returns (uint256 performanceFeeAmount, uint256 managementFeeAmount, uint256 gain);
    function addChain(
        uint256 _chainId,
        uint256 _maxDeposit,
        address _bridgeAddress,
        address _allocator,
        address _remoteConnector,
        bytes calldata _params
    ) external;
    function enableLiquidityPool(bool _liquidityPoolEnabled) external;
    function setMaxDepositForChain(uint256 _maxDeposit, uint256 _chainId) external;
    function setMaxTotalAssets(uint256 _amount) external;
    function setFees(uint256 _performanceFee, uint256 _managementFee, uint256 _withdrawFee) external;
    function pause() external;
    function unpause() external;
    function snapshot() external returns (uint256 id);
    function rescueToken(address _token, bool _onlyETH) external;
    function estimateDispatchCost(uint256[] calldata _chainIds, uint256[] calldata _amounts)
        external
        view
        returns (uint256[] memory nativeCost);

    // Public State Variables
    function maxTotalAssets() external view returns (uint256);
    function totalRemoteAssets() external view returns (uint256);
    function performanceFee() external view returns (uint256);
    function managementFee() external view returns (uint256);
    function withdrawFee() external view returns (uint256);
    function anticipatedProfits() external view returns (uint256);
    function lastUpdate() external view returns (uint256);
    function chainList() external view returns (uint256[] memory);
    function chainData(uint256) external view returns (uint256 debt, uint256 maxDeposit, address bridge);
    function checkpoint() external view returns (uint256 timestamp, uint256 sharePrice);
    function liquidityPool() external view returns (uint256 debt, uint256 liquidity, address swap);
    function tokenDecimals() external view returns (uint8);
    function liquidityPoolEnabled() external view returns (bool);
    function bridgeWhitelist(address) external view returns (bool);
    function asset() external view returns (address);
}
