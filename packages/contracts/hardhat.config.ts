import fs from "fs";
import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import "@nomiclabs/hardhat-solhint";
import "hardhat-preprocessor";
import "hardhat-contract-sizer";

const DUMP_MNEMONIC = "test test test test test test test test test test test junk";
// eslint-disable-next-line turbo/no-undeclared-env-vars
const MNEMONIC = process.env.MNEMONIC || DUMP_MNEMONIC;

function getRemappings() {
  return fs
    .readFileSync("remappings.txt", "utf8")
    .split("\n")
    .filter(Boolean) // remove empty lines
    .map((line) => line.trim().split("="));
}

const config: HardhatUserConfig = {
  solidity: {
    version: "0.8.4",
    settings: {
      optimizer: {
        enabled: true,
        runs: 10_000,
      },
    },
  },
  networks: {
    sepolia: {
      url: "https://rpc.sepolia.org/",
      accounts: {
        mnemonic: MNEMONIC,
      },
    },
    mumbai: {
      url: "https://rpc-mumbai.maticvigil.com",
      accounts: {
        mnemonic: MNEMONIC,
      },
    },
  },
  preprocess: {
    eachLine: (hre) => ({
      transform: (line: string) => {
        if (line.match(/^\s*import /i)) {
          for (const [from, to] of getRemappings()) {
            if (line.includes(from)) {
              line = line.replace(from, to);
              break;
            }
          }
        }
        return line;
      },
    }),
  },
  paths: {
    sources: "./src",
    cache: "./cache_hardhat",
  },
};

export default config;
