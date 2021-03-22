# MOON-GENESIS-NFT

`ERC1155`

## start

```
npm install
```

## 更换NFT资产

- Genesis.sol

```
constructor( address _devAddr, string memory _baseMetadataURI)
    CRCN("any NFT", "xxNFT")
```

## 编译合约

```
truffle compile
```

## 脚本说明

`testnet 表示测试网  tethys表示主网 注意env的配置`

- 部署合约

```
node scripts/testnet/gs.deploy.js

```

- 空投NFT

```
node script/testnet/gs.create.js
```


## 发布Mainnet

`按testnet的脚本复制下`
