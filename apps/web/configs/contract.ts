import { getContract } from "wagmi/actions";

// types
// import type { Sudoku, SudokuVerifier } from "@repo/contracts/typechain-types";
// abi
import { abi as SudokuABI } from "@repo/contracts/artifacts/src/Sudoku.sol/Sudoku.json";
import { abi as SudokuVerifierABI } from "@repo/contracts/artifacts/src/SudokuVerifier.sol/SudokuVerifier.json";
import { useContractRead, usePrepareContractWrite } from "wagmi";

export const contractsAddress = {
  sudoku: "0xd784bdc2920e1c3d26e6d3e50d61ebb1c22fdc97",
  verifier: "0x7dc853fb44e04ba6d885434c1a0db80aeae5b8d4",
};

export const sudoku = getContract({
  address: `0x${contractsAddress.sudoku}`,
  abi: SudokuABI,
});

export const verifier = getContract({
  address: `0x${contractsAddress.verifier}`,
  abi: SudokuVerifierABI,
});

export const sudokuRead = (func: string, args?: unknown[]): any =>
  useContractRead({
    address: `0x${contractsAddress.sudoku}`,
    abi: SudokuABI,
    functionName: func,
    args,
  });

export const sudokuWrite = (func: string, args?: unknown[]): any =>
  usePrepareContractWrite({
    address: `0x${contractsAddress.sudoku}`,
    abi: SudokuABI,
    functionName: func,
    args,
  });
