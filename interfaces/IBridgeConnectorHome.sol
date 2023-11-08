// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

interface IBridgeConnectorHome {
    // Events
    event BridgeSuccess(
        uint256 indexed amount,
        uint256 indexed chainId,
        uint256 fees,
        address indexed destination
    );

    event RequestReceived(uint256 indexed chainId, uint256 amount);

    // Custom errors
    error PoolNotSet(uint256 chainId);
    error NotAuthorized();

    // Functions
    function updateCrate(uint256 _chainId) external;
    function bridgeFunds(
        uint256 _amount,
        uint256 _chainId,
        uint256 _minAmount,
        bytes calldata _bridgeData
    ) external payable;
    function returnTokens() external;
    function addChain(
        uint256 _chainId,
        address _allocator,
        address _remoteConnector,
        bytes calldata _params
    ) external;
    function estimateBridgeCost(
        uint256 _chainId,
        uint256 _amount
    ) external view returns (uint256 gasEstimation);
    function recoverNative() external;

    // View/Pure functions
    function allocatorsMap(uint256 _chainId) external view returns (address);
    function updateRequests(uint256 _chainId) external view returns (uint256);
    function crate() external view returns (address);
    function asset() external view returns (address);
    function bridgeEndpoint() external view returns (address);
}
