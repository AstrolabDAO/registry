// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

interface IBridgeConnectorRemote {
    // Events
    // Include events that are emitted by the functions of the contract

    // Errors
    error NotAuthorized();
    error AllocatorAlreadySet();

    // View/Public State Variables
    function asset() external view returns (address);
    function homeChainId() external view returns (uint16);
    function brigeGasAmount() external view returns (uint256);
    function updateGasAmount() external view returns (uint256);
    function homeBridge() external view returns (address);
    function bridgeEndpoint() external view returns (address);
    function allocator() external view returns (address);

    // Functions
    function bridgeFunds(uint256 _amount, uint256 _minAmount) external payable;
    function updateChainDebt(uint256 _chainId, uint256 _amount) external payable;
    function estimateBridgeCost() external view returns (uint256 cost);
    function estimateUpdateCost() external view returns (uint256 cost);
    function recoverNative() external;
    function setAllocator(address _allocator) external;
    function setUpdateGasCost(uint256 _updateGasAmount) external;
}
