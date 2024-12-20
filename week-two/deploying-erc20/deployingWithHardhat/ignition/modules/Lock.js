const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("DeployOurToken", (m) => {
  const initialSupply = BigInt("1000000000000000000000000"); // 1 million tokens with 18 decimal places
  const ourToken = m.contract("OurToken", [initialSupply]);

  return { ourToken };
});
