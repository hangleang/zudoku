import { ethers } from "hardhat";

async function main() {
  // deploy verifier contract
  const sudokuVerifier = await ethers.deployContract("SudokuVerifier");
  await sudokuVerifier.waitForDeployment();

  // deploy sudoku contract
  const sudoku = await ethers.deployContract("Sudoku", [sudokuVerifier.target]);
  await sudoku.waitForDeployment();

  console.log(`deploy Sudoku contract at address:${sudoku.target} with verifier:${sudokuVerifier.target}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
