const { Conflux } = require("js-conflux-sdk");
let env = require('./env.json');
let json_rpc_url = env.json_rpc;
let PRIVATE_KEY = env.adminPrivateKey;
let chainId = env.chainId;

let devAddr = '0x1AB7113404867b5F294113FE4959D9eC2eCAaA12';
let baseUri = 'https://nft.moonswap.fi/genesis/meta/';
const sourceContract = require('../../build/contracts/Genesis.json');

const cfx = new Conflux({ url: json_rpc_url,
    logger: console,
    networkId:env['chainId']
  });
const account = cfx.wallet.addPrivateKey(PRIVATE_KEY);

const contract = cfx.Contract({
    bytecode: sourceContract.bytecode,
    abi: sourceContract.abi
});

async function main()
{
  await contract.constructor(devAddr, baseUri)
  .sendTransaction({ from: account , chainId: chainId})
  .confirmed()
  .then((receipt) => {
      console.log("nft_genesis_addr:", receipt.contractCreated)
  })
  .catch(error => {console.log(error); process.exit(1)});

}

main().catch(e => console.error(e));
