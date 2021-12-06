const main = async () => {
    const [deployer] = await hre.ethers.getSigners();
    const accountBalance = await deployer.getBalance();

    console.log(`Deployer account balance: ${accountBalance}`);
    console.log(`Deployer address: ${deployer.address}`);

    const Token = await hre.ethers.getContractFactory("PlayListPortal");

    const portal = await Token.deploy();
    await portal.deployed();

    console.log(`Deployed PlayListPortal at ${portal.address}`);


}

const runMain = async () => {
    try {
        await main();
        process.exit(0);
    } catch (error) {
        console.log(error);
        process.exit(1);
    }
}

runMain();

