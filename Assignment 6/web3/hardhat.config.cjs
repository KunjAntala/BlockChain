require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-ethers")
require("dotenv").config();

const POLYGON_URL = process.env.POLYGON_URL;
const PRIVATE_KEY = process.env.PRIVATE_KEY;

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.24",
  networks: {
    polygon: {
      url: POLYGON_URL,
      accounts: [PRIVATE_KEY],
    }
  }
};
