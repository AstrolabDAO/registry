// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

/// @title ISwapper
/// @dev Interface for Swapper contract to proxy erc20 token swaps through a specified router
interface ISwapper {
    function swap(
        address _input,
        address _output,
        uint256 _amountIn,
        uint256 _minAmountOut,
        address _targetRouter,
        bytes calldata _callData
    ) external payable returns (uint256 received, uint256 spent);

    function decodeAndSwap(
        address _input,
        address _output,
        uint256 _amount,
        bytes calldata _params
    ) external returns (uint256 received, uint256 spent);

    function multiSwap(
        address[] calldata _inputs,
        address[] calldata _outputs,
        uint256[] calldata _amountsIn,
        uint256[] calldata _minAmountsOut,
        address[] calldata _targetRouters,
        bytes[] calldata _params
    ) external returns (uint256[] memory received, uint256[] memory spent);

    function decodeAndMultiSwap(
        address[] calldata _inputs,
        address[] calldata _outputs,
        uint256[] calldata _amountsIn,
        bytes[] calldata _params
    ) external returns (uint256[] memory received, uint256[] memory spent);

    function setCallerRestriction(bool _restrictCaller) external;
    function setRouterRestriction(bool _restrictRouter) external;
    function setInputRestriction(bool _inputRestiction) external;
    function setOutputRestriction(bool _outputRestiction) external;
    function setApproveMax(bool _approveMax) external;
    function setAutoRevoke(bool _autoRevoke) external;
    function addToWhitelist(address _address) external;
    function removeFromWhitelist(address _address) external;
    function isWhitelisted(address _address) external view returns (bool);
    function isCallerRestricted(address _caller) external view returns (bool);
    function isRouterRestricted(address _router) external view returns (bool);
    function isInputRestricted(address _input) external view returns (bool);
    function isOutputRestricted(address _output) external view returns (bool);
    function isApproveMax() external view returns (bool);
    function isAutoRevoke() external view returns (bool);
}
