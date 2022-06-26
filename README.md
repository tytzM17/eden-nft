# `eden-nft`

NFT public staking with doggo art nft. Stake and earn ethereum!

📄 Clone or fork `eden-nft`:

```sh
git clone https://github.com/tytzM17/eden-nft.git
```

💿 Install all dependencies:

```sh
cd eden-nft
yarn install
```

✏ Rename `.env.example` to `.env` in the main folder and provide your `appId` and `serverUrl` from Moralis ([How to start Moralis Server](https://docs.moralis.io/moralis-server/getting-started/create-a-moralis-server))
Example:

```jsx
REACT_APP_MORALIS_APPLICATION_ID = xxxxxxxxxxxx
REACT_APP_MORALIS_SERVER_URL = https://xxxxxx.grandmoralis.com:2053/server
```

🚴‍♂️ Run your App:

```sh
yarn start
```

# 🧭 Table of contents


# 🏗 Ethereum Contracts (Rinkeby)

```Rinkeby
eden nft staker address -> 0xaB6F4483e1279e37279Fa73009F3971D5D8A471c
eden nft address -> 0x6995cD9890Bb8384504131f5A5AA1264b126BE3D
```

### `useNFTBalances()`

🎨 Gets all NFTs from the current user or address. Supports both ERC721 and ERC1155. Returns an object with the number of NFT objects and the array of NFT objects.

**Options**:

- `chain` (optional): The blockchain to get data from. Valid values are listed on the intro page in the Transactions and Balances section. Default value: current chain (if the chain is not supported it will use the Eth chain).
- `address` (optional): A user address (i.e. 0x1a2b3x...). If specified, the user attached to the query is ignored and the address will be used instead.

**Example**

```jsx
import { useNFTBalances } from "react-moralis";

const { getNFTBalances, data, error, isLoading, isFetching } = useNFTBalances();

const NFTBalances = () => {
  return (
    <div>
      {error && <>{JSON.stringify(error)}</>}
      <button onClick={() => getNFTBalances({ params: { chain: "0x1" } })}>
        Refetch NFTBalances
      </button>
      <pre>{JSON.stringify(data, null, 2)}</pre>
    </div>
  );
};
```

**Example return** (Object)

```json
{
  "total": 1,
  "page": 0,
  "page_size": 500,
  "result": [
    {
      "token_address": "0x057Ec652A4F150f7FF94f089A38008f49a0DF88e",
      "token_id": "15",
      "contract_type": "ERC721",
      "owner_of": "0x057Ec652A4F150f7FF94f089A38008f49a0DF88e",
      "block_number": "88256",
      "block_number_minted": "88256",
      "token_uri": "string",
      "metadata": "string",
      "synced_at": "string",
      "amount": "1",
      "name": "CryptoKitties",
      "symbol": "RARI"
    }
  ]
}
```

### `useNFTTransfers()`

🎨 Gets the NFT transfers. Returns an object with the number of NFT transfers and the array of NFT transfers.

**Options**:

- `chain` (optional): The blockchain to get data from. Valid values are listed on the intro page in the Transactions and Balances section. Default value: current chain (if the chain is not supported it will use the Eth chain).
- `address` (optional): A user address (i.e. 0x1a2b3x...). If specified, the user attached to the query is ignored and the address will be used instead.
- `offset` (optional): Offset.
- `direction` (optional): The transfer direction. Available values : both, to, from . Default value : both.
- `format` (optional): he format of the token id. Available values : decimal, hex. Default value : decimal.
- `limit` (optional): Limit.

**Example**

```jsx
import { useNFTTransfers } from "react-moralis";

const { fetch, data, error, isLoading, isFetching } = useNFTTransfers();

const NFTTransfers = () => {
  return (
    <div>
      {error && <>{JSON.stringify(error)}</>}
      <button onClick={() => fetch({ params: { chain: "0x1" } })}>
        Refetch
      </button>
      <pre>{JSON.stringify(data, null, 2)}</pre>
    </div>
  );
};
```

**Example return** (Object)

```json
{
  "total": 1,
  "page": 0,
  "page_size": 500,
  "result": [
    {
      "token_address": "0x057Ec652A4F150f7FF94f089A38008f49a0DF88e",
      "token_id": "15",
      "from_address": "0x057Ec652A4F150f7FF94f089A38008f49a0DF88e",
      "to_address": "0x057Ec652A4F150f7FF94f089A38008f49a0DF88e",
      "amount": "1",
      "contract_type": "ERC721",
      "block_number": "88256",
      "block_timestamp": "2021-06-04T16:00:15",
      "block_hash": "string",
      "transaction_hash": "0x057Ec652A4F150f7FF94f089A38008f49a0DF88e",
      "transaction_type": "string",
      "transaction_index": "string",
      "log_index": 0
    }
  ]
}
```

