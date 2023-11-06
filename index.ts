export interface IDeployment extends IDeploymentUnit {
  units: { [unit: string]: IDeploymentUnit };
}

export interface IDeploymentUnit {
  name: string;
  contract?: string;
  slug?: string;
  chainId?: number;
  address?: string;
  tx?: string;
  version?: number;
  deployer?: any; // Signer
  provider?: any; // Wallet
  local?: boolean;
  args?: unknown;
  verify?: boolean;
  verified?: boolean;
  libraries?: Record<string, string>;
}

export interface IInputAbi {
  name: string;
  type: string;
  indexed?: boolean;
  internalType: string;
}

export interface IOutputAbi {
  name: string;
  type: string;
  internalType: string;
}

export interface IFunctionAbi {
  name: string;
  type?: string; // constructor / function / error / event...
  inputs?: IInputAbi[];
  outputs?: IOutputAbi[];
  stateMutability?: string; // payable / nonpayable / view
}

export type ContractAbi = IFunctionAbi[];
