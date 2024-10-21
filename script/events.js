const { ethers } = require("ethers");

async function main() {
    const token = await ethers.getContractFactory("MatematessaTokenERC20");

    const contractAddress = "0x8bfb4E185a58bBB4F1D5e6Be4F1da699e701Da2b";
    const contract = await token.attach(contractAddress);

    console.log(await contract.queryFilter("TransferSingle"));  // например, TransferSingle
}

main()
