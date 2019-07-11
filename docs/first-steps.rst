========
First steps
========

sproof is a decentralized open source protocol for registering data and documents in a public blockchain. To use sproof we provide clients in different programming languages. Currently we support javascript, Java and C are coming soon.


Create a node project
=====================



----------
Install node and npm
----------

You need to create a node project to use the ``js-sproof-client``. Before creating a project you need to install the latest version of ``npm`` and ``nodejs``.

    .. tabs::

       .. tab:: Ubuntu

         Install::

             sudo apt update
             sudo apt install nodejs npm

       .. tab:: Windows

          Coming soon. Feel free to edit the docs on github.

       .. tab:: Mac OS

          Coming soon. Feel free to edit the docs on github.

----------
Create the project structure
----------

Create a new folder for your project and open it with a terminal.
Run ``npm init`` and follow the instructions. After that install the ``js-sproof-client`` with::

    npm install --save js-sproof-client

Create a new file called ``index.js`` and ``config.js`` in your project folder.


Create an account
=====================

We provide two different methods to create your unique sproof account, which is basically a public-private key pair.

----------
Standard
----------

If you want to use your own Ether (Cryptocurrencies) to paid for your transaction you need to create your public-private key pair with the following code::

    const { Sproof, Registration }  = require('js-sproof-client');
    let sproof = new Sproof({
      uri: 'https://api.sproof.io/',
      chainId: '3',
      chain: 'ethereum',
      version: '0.42'
    });
    let credentials = sproof.newAccount();
    console.log(credentials)

After that you need to request Ether. Currently sproof lives in the Ropsten Testnet. To get Ether you need to enter your address on te `website <https://faucet.ropsten.be/>`_.

Once your account has Ether you can register your stuff with the following command::

    sproof.commit(callback)


----------
Premium
----------

If you don't want to request Ether you can use our premium api, where sproof acts as a proxy and forwards your secure data and your locally created signature to the blockchain. To use this service you need to create your account and a sproof profile with your  `webapp <https://app.sproof.io`_.

Once your profile is created you can download your ``sproof-code``, with 10 free uploads attached. If you need more uploads feel free to contact team@sproof.io.

Your sproof code is a mnemonic which contains 12 randomly chosen words.

.. note::
    sproof does not stores your sproof-core. In case that you lose your ``sproof-code`` we cannot recover it.


Create a config
=====================

Add the following code to your ```config.js``` file and replace the ``sproofCode``::

    let config = {
        uri: 'https://api.sproof.io/',
        credentials: {
            sproofCode: 'word1 word2 word3 word4 word5 word6 word7 word8 word9 word10 word11 word12',
        },
        chainId: '3',
        chain: 'ethereum',
        version: '0.42'
    };
    module.exports = config;

Register your first document
=====================

Take a look at the code examples on github or in the examples section.
