// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title SafeL2 - An implementation of the Safe contract that emits additional events on transaction executions.
 * @notice For a more complete description of the Safe contract, please refer to the main Safe contract `Safe.sol`.
 * @author Stefan George - @Georgi87
 * @author Richard Meissner - @rmeissner
 */
interface Safe {
    enum Operation {
        Call,
        DelegateCall
    }

    event AddedOwner(address indexed owner);
    event ApproveHash(bytes32 indexed approvedHash, address indexed owner);
    event ChangedFallbackHandler(address indexed handler);
    event ChangedGuard(address indexed guard);
    event ChangedThreshold(uint256 threshold);
    event DisabledModule(address indexed module);
    event EnabledModule(address indexed module);
    event ExecutionFailure(bytes32 indexed txHash, uint256 payment);
    event ExecutionFromModuleFailure(address indexed module);
    event ExecutionFromModuleSuccess(address indexed module);
    event ExecutionSuccess(bytes32 indexed txHash, uint256 payment);
    event RemovedOwner(address indexed owner);

    function addOwnerWithThreshold(address owner, uint256 _threshold) external;
    function approveHash(bytes32 hashToApprove) external;
    function changeThreshold(uint256 _threshold) external;
    function disableModule(address prevModule, address module) external;
    function enableModule(address module) external;
    function execTransaction(
        address to,
        uint256 value,
        bytes calldata data,
        Operation operation,
        uint256 safeTxGas,
        uint256 baseGas,
        uint256 gasPrice,
        address gasToken,
        address payable refundReceiver,
        bytes memory signatures
    ) external returns (bool success);
    function execTransactionFromModule(address to, uint256 value, bytes calldata data, Operation operation)
        external
        returns (bool success);
    function getModules() external view returns (address[] memory);
    function getOwners() external view returns (address[] memory);
    function getThreshold() external view returns (uint256);
    function isModuleEnabled(address module) external view returns (bool);
    function isOwner(address owner) external view returns (bool);
    function removeOwner(address prevOwner, address owner, uint256 _threshold) external;
    function setFallbackHandler(address handler) external;
    function setGuard(address guard) external;
    function setup(
        address[] calldata _owners,
        uint256 _threshold,
        address to,
        bytes calldata data,
        address fallbackHandler,
        address paymentToken,
        uint256 payment
    ) external;
    function swapOwner(address prevOwner, address oldOwner, address newOwner) external;
}
