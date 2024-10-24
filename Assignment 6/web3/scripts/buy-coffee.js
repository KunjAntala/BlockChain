const hre = require("hardhat");

async function getBalance(address) {
    const balanceBigInt = await hre.waffle.provider.getBalance(address);
    return hre.ethers.utils.formatEther(balanceBigInt);
}

async function printBalances(addresses) {
    let ide = 0;
    for (const address of addresses) {
        console.log(`Address ${ide} balance: `, await getBalance(address));
        ide++;
    }
}
async function printMemos(memos) {
    for (const memo of memos) {
        const timestamp = memo.timestamp;
        const tipper = memo.name;
        const tipperAddress = memo.from;
        const message = memo.message;
        console.log(`At ${timestamp}, ${tipper} (${tipperAddress}) said "${message}"`);
    }
}

async function main() {
    // get some exmaple accounts.
    const [owner, tipper, tipper2, tipper3] = await hre.ethers.getSigners();

    // Get the contract to deploy and deploy.
    const buyMeACoffee = await hre.ethers.deployContract("BuyMeACoffee");
    console.log(typeof (buyMeACoffee));
    await buyMeACoffee.deployTransaction.wait();
    console.log("BuyMeACoffee deployed to: ", buyMeACoffee.target);


    // Check balances before the coffee purchase.
    const addresses = [owner.address, tipper.address];
    console.log("== start ==");
    await printBalances(addresses);

    // Buy the owner a few coffees.
    const tip = { value: hre.ethers.utils.parseEther("1") };
    await buyMeACoffee.connect(tipper).buyACoffee("Caroline", "You're the Best", tip);
    await buyMeACoffee.connect(tipper2).buyACoffee("Harshil", "You are amazing ", tip);
    await buyMeACoffee.connect(tipper3).buyACoffee("Harsh", "You are my best friend ", tip);

    // Cheak balance after coffe purchase.
    console.log("== bought coffee ==");
    await printBalances(addresses);

    // withdraw funds.
    await buyMeACoffee.connect(owner).withdrawTips();

    // Cheak balance after withdraw.
    console.log("== After withdrawtips ==");
    await printBalances(addresses);

    // Read all the memos left for the owner
    console.log("== memos ==");
    const memos = await buyMeACoffee.getMemos();
    printMemos(memos);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });