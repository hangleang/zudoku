import fs from "fs";
import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import "@nomiclabs/hardhat-solhint";
import "hardhat-preprocessor";
import "hardhat-contract-sizer";

const DUMP_MNEMONIC = "test test test test test test test test test test test junk";
const MNEMONIC = process.env.MNEMONIC || DUMP_MNEMONIC;
const API_KEY_INFURA = process.env.API_KEY_INFURA;

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
      url: `https://sepolia.infura.io/v3/${API_KEY_INFURA}`,
      accounts: {
        mnemonic: MNEMONIC,
      },
    },
    goerli: {
      url: `https://goerli.infura.io/v3/${API_KEY_INFURA}`,
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
