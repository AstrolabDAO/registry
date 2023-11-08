// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

/// @title ISwapper
/// @dev Interface for Swapper contract to proxy erc20 token swaps through a specified router
interface ISwapper {
    // Events
    event Swapped(
        address indexed user,
        address indexed assetIn,
        address indexed assetOut,
        uint256 amountIn,
        uint256 amountOut
    );
    event Whitelisted(address indexed account); // caller/asset/router whitelist
    event RemovedFromWhitelist(address indexed account);

    // Functions to manage restrictions and approvals
    function setCallerRestriction(bool _restrictCaller) external;
    function setRouterRestriction(bool _restrictRouter) external;
    function setApproveMax(bool _approveMax) external;
    function setAutoRevoke(bool _autoRevoke) external;

    // Functions to manage the whitelist
    function addToWhitelist(address _address) external;
    function removeFromWhitelist(address _address) external;
    function isWhitelisted(address _address) external view returns (bool);

    // Swap functions
    function swap(
        address _input,
        address _output,
        uint256 _amountIn,
        uint256 _minAmountOut,
        address _targetRouter,
        bytes calldata _callData
    ) external payable returns (uint256 received);

    // Multi-swap function
    function multiSwap(
        address[] calldata _inputs,
        address[] calldata _outputs,
        uint256[] calldata _amountsIn,
        uint256[] calldata _minAmountsOut,
        address[] calldata _targetRouters,
        bytes[] calldata _callDataList
    ) external returns (uint256[] memory received);
}
