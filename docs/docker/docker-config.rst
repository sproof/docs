========
Configuration of docker
========


This is an example configuration file for the sproof docker client:

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


- ``port`` - ``Number``: The used port for your API.
- ``time`` - ``HH:MM``: The time of day when to commit your documents to the blockchain through a transaction.
- ``interval`` - ``Number``: The  time interval for commiting your documents to the blockchain.
- ``showOnlyConfirmedIssuers`` - ``Boolean``: If this is ``false``, your locally hosted Web UI will validate all documents registered in the sproof network. Otherwise, only document which are issued by yourself or from a sproof profile which you confirmed can be registered.
- ``sproofCode`` - ``String``: Enter your sproof code.
- ``chainId`` - ``String``: When set to 3, the testnet is used. When set to 1, the mainnet is used.
