========
Configuration of the docker image
========

The `sproof API client <https://github.com/sproof/sproof-api-client>`_ can be configured based on your needs. The configuration must be specified in the `data/config.js` file before the docker image is run. An example file as well as an explanation of all configuration parameters are provided below.

Example configuration file
=========

The following is an example configuration file (also available in the `sproof-api-client respository <https://github.com/sproof/sproof-api-client/blob/master/data/exampleConfig.js>`_). It contains a sample configuration which requires only setting your sproof code (see below) and can be readily used without further changes in most common setups. The parameters are explained  below.

.. code-block:: javascript

    {
      api:{
        port: 6001
      },
      commit: {
        //time: '13:13',
        interval: 10
      },

      validateOnlyConfirmedIssuers: true,

      sproof: {
        sproofPremium: true,
        uri: 'https://api.sproof.io/',
        credentials: {
          sproofCode: 'YOUR SPROOF CODE'
        },

        chainId: '3',
        chain: 'ethereum',
        version: '0.42',
      },
    };

Parameters
=========

There are three types of parameters - mandatory profile-related parameters, network-related parameters and blockchain-related parameters.

Profile-related parameters
---------

- ``sproofCode`` - ``String``: Enter your sproof code here. Without a valid sproof code, the client API will not work.
- ``sproofPremium`` - ``Boolean``: If this parameter is set to ``true``, your locally hosted client will synchronize pending events with the `Web app <https://app.sproof.io/>`_. The client will also send keep-alive messages to the sproof servers so that you can see the status of your docker client in the Web app.

Network-related parameters
----------

- ``port`` - ``Number``: The *internal* (docker-side) HTTP port used to expose the API. If you want to change the HTTP port used to expose the API externally, you need to change the port mapping in the `docker-compose.yml` file.
- ``uri`` - ``String``: The address where the backend (``sproof-core``) is running. At the moment, only the official sproof backend (https://api.sproof.io/) can be used.

Blockchain-related parameters
----------

- ``time`` - ``HH:MM``: The time of day when to commit your documents to the blockchain through a transaction. If this parameter is set, the ``interval`` parameter must not be set at the same time.
- ``interval`` - ``Number``: The time interval in minutes for commiting your documents to the blockchain. For example, a value of 10 means that committing happens every ten minutes. If this parameter is set, the ``time`` parameter must not be set at the same time.
- ``validateOnlyConfirmedIssuers`` - ``Boolean``:  If this is ``true``, only documents which are issued by yourself or from a sproof profile which you confirmed can be validated. Otherwise, your locally hosted Web UI will validate all documents registered in the sproof network.
- ``chainId`` - ``String``: The network to be used for all operations. For details about sproof networks, see :doc:`../first/network-sproof`.
