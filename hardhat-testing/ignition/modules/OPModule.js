const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

const OWNER = "0x0977De4FbF977Db858A1dC27d588f9F661263d86"

module.exports = buildModule("OPModule", (m) => {

    const owner = m.getParameter("initialOwner", OWNER);

    const opModule = m.contract("OPModule", [owner]);

    return { opModule };

});