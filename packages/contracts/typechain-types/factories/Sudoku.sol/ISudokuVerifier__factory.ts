/* Autogenerated file. Do not edit manually. */
/* tslint:disable */
/* eslint-disable */

import { Contract, Interface, type ContractRunner } from "ethers";
import type {
  ISudokuVerifier,
  ISudokuVerifierInterface,
} from "../../Sudoku.sol/ISudokuVerifier";

const _abi = [
  {
    inputs: [
      {
        internalType: "uint256[2]",
        name: "_pA",
        type: "uint256[2]",
      },
      {
        internalType: "uint256[2][2]",
        name: "_pB",
        type: "uint256[2][2]",
      },
      {
        internalType: "uint256[2]",
        name: "_pC",
        type: "uint256[2]",
      },
      {
        internalType: "uint256[81]",
        name: "_pubSignals",
        type: "uint256[81]",
      },
    ],
    name: "verifyProof",
    outputs: [
      {
        internalType: "bool",
        name: "",
        type: "bool",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
] as const;

export class ISudokuVerifier__factory {
  static readonly abi = _abi;
  static createInterface(): ISudokuVerifierInterface {
    return new Interface(_abi) as ISudokuVerifierInterface;
  }
  static connect(
    address: string,
    runner?: ContractRunner | null
  ): ISudokuVerifier {
    return new Contract(address, _abi, runner) as unknown as ISudokuVerifier;
  }
}
