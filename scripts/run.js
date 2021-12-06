const main = async () => {
    const [owner, randomPrerson] = await hre.ethers.getSigners();
    const PlayListContractFactory = await hre.ethers.getContractFactory("PlayListPortal");
    const PlayListContract = await PlayListContractFactory.deploy();
    await PlayListContract.deployed();
    console.log(`contract deployed to : ${PlayListContract.address}`);
    console.log(`ownder address : ${owner.address}`)

    let addPlayList = await PlayListContract.connect(randomPrerson).createPlayList(
        'test',
        'test',
        1,
        0,
        0,
        'test',
        1,
    );
    addPlayList.wait();
    let getPlayList = await PlayListContract.getPlayList(1);
    console.log(getPlayList);
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

