// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface SafeProxyFactory {
    event ProxyCreation(address indexed proxy, address singleton);

    function proxyCreationCode() external pure returns (bytes memory);
    function createProxyWithNonce(address _singleton, bytes memory initializer, uint256 saltNonce)
        external
        returns (address);
    function createChainSpecificProxyWithNonce(address _singleton, bytes memory initializer, uint256 saltNonce)
        external
        returns (address);
    function createProxyWithCallback(
        address _singleton,
        bytes memory initializer,
        uint256 saltNonce,
        IProxyCreationCallback callback
    ) external returns (address);
    function getChainId() external view returns (uint256);
}

interface IProxyCreationCallback {
    function proxyCreated(address proxy, address singleton, bytes memory initializer, uint256 saltNonce) external;
}
