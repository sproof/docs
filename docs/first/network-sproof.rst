===============
sproof networks
===============

sproof currently runs on two networks. One is for production and one is for testing purposes. They are distinguished by their `chainID`. Do not use any other `chainID` value than the ones listed below. Using other `chainID` values results in undefined behavior.

Ethereum main chain
-------------------
:guilabel:`chainId=1`

sproof runs on the Ethereum main chain for use in prodution. This `chainId` is also used in the provided configuration files. Please note that you need to select a plan on the sproof Website (https://app.sproof.io) in order to interact with the main chain. You can choose a plan on the Settings page (https://app.sproof.io/#/settings/).

Ethereum Ropsten Testnet
------------------------
:guilabel:`chainId=3`

The Ropsten testnet is an Ethereum blockchain designed to test decentralized applications before deploying them. You can use this testnet to submit transactions and to interact with the sproof network for free. This allows you to implement and test your integration of the sproof API without additional costs.

Note that using the testnet does not give you any of the guarantees of the Ethereum main chain, which you would normally expect from a blockchain. In particular, there is no mining and no support, meaning that data may be changed or lost without prior notice. Do **not** ever use the testnet in production.
