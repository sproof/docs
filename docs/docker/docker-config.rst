========
Config
========


This is an example config file of the sproof docker client:

.. code-block:: javascript

    {
      api:{
        port: 6001
      },
      commit: {
        //time: '13:13',
        interval: 10
      },

      showOnlyConfirmedIssuers: true,

      sproof: {
        uri: 'https://api.sproof.io/',
        credentials: {
          sproofCode: 'YOUR SPROOF CODE'
        },

        chainId: '3',
        chain: 'ethereum',
        version: '0.42',
      },
    };


- ``port`` - ``Number``: The used port for your api.
- ``time`` - ``HH:MM``: Time to commit your documents to the blockchain. (transaction)
- ``interval`` - ``Number``: Interval for commiting your documents to the blockchain.
- ``showOnlyConfirmedIssuers`` - ``Boolean``: If this is ``false``, your locally hosted web ui will validate all documents registered in the sproof network. In the other case only document which are issued by yourself or from an sproof profile which you confirmed.
- ``sproofCode`` - ``String``: Enter your sproof code.
- ``chainId`` - ``String``: The chainId == 3 is for the testnet, 1 is used for the mainnet.
