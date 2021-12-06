const main = async () => {
    const [owner, randomPrerson] = await hre.ethers.getSigners();
    const PlayListContractFactory = await hre.ethers.getContractFactory("PlayListPortal");
    const PlayListContract = await PlayListContractFactory.deploy();
    await PlayListContract.deployed();
    console.log(`contract deployed to : ${PlayListContract.address}`);
    console.log(`ownder address : ${owner.address}`)

    let addPlayList = await PlayListContract.connect(randomPrerson).createPlayList(
        'name',
        'description',
        'url',
    );
    addPlayList.wait();
    let getPlayList = await PlayListContract.getPlayListItems();
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

