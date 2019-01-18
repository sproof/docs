========
API
========

Transaction
=====================


.. code-block:: javascript

    sproof.getTransactions(params, callback)

Returns the transaction object.

.. note:: If the id property in params is set, this call returns the specified transaction, otherwise it returns a list of the last 10 entries.


----------
Parameters
----------

1. ``Object`` - params for call.
2. ``Function`` - Callback, returns an error object as first parameter and the result as second.


-------
Returns
-------


returns ``Object`` - A transaction object, or an error  when no transaction was found:

  - ``_id`` - ``String``: Transaction hash.
  - ``blockNumber`` - ``Number``: Blocknumber of the block.
  - ``blockHash`` 32 Bytes - ``String``: Hash of the block where this transaction was in.
  - ``timestamp`` - ``Number``: Unix timestamp of the block creation time.
  - ``dhtHash`` 32 Bytes - ``String``: IPFS hash of the content.
  - ``events``- ``List``: List of all events included in this transaction.
  - ``from`` - ``String``: Address of the sender.
  - ``publicKey`` - ``String``: PublicKey of the sender.

-------
Example
-------

.. code-block:: javascript

    sproof.getTransactions({id: '0x9fc76417374aa880d4449a1f7f31ec597f00b1f6f3dd2d66f4c9c6c445836d8b'} , (err, res) => {
        console.log(res);
    });

    > {
        "_id":"0xa8218f351a22c3660aeb4bdf1c94a6747bedf565f7b404c39060234a173a8234",
        "blockNumber":10031049,
        "timestamp":1547217372,
        "blockHash":"0x0a3513ed8cd714b199766b97de95845633e3a6b18189ac2de3d7d32183456cfe",
        "from":"0x683b44a82722d5cfd62e61c678ed2bfeb1f83cbb",
        "publicKey":"0x2ab25035b3d357215c7d7656c9f3fa2d37a25e26dd0c75169dadb5b9292dfed3004b3094c8b4a5ba56e4550d77fabc1cc6d678b38e2ab33dfae96daaae3d0c8e",
        "dhtHash":"Qmau18iJEcPA7qYwgk2WijS4spB3gAsDz3DTk9ptJZH8dc",
        "events":[
            "0x45c979da81c169057ac18d006ab3a0669aa6cd992bdb521b4a75d1779ba49486",
            "0xc5dd1d587d7f4cb83c75089f52a5d1e95c1faac044adca6d7d1adaa225434e16"
        ]
    }

------------------------------------------------------------------------------

Event
=====================


.. code-block:: javascript

    sproof.getEvents(params, callback)

Returns the event object.

.. note:: If the id property in params is set, this call returns the specified event, otherwise it returns a list of the last 10 entries.


----------
Parameters
----------

1. ``Object`` - params for call.
2. ``Function`` - Callback, returns an error object as first parameter and the result as second.


-------
Returns
-------


returns ``Object`` - A event object, or an error  when no event was found:

  - ``_id`` - ``String``: Event hash.
  - ``eventType`` - ``String``: Type of the event.
  - ``data`` - ``Object``: Events payload.
  - ``transaction`` - ``String``: Corresponding transaction hash of the event.
  - ``from`` - ``String``: Address of the sender.
  - ``timestamp`` - ``Number``: Unix timestamp of the block creation time.

-------
Example
-------

.. code-block:: javascript

    sproof.getEvents({id: '0xac56a7953982dc8b066cfdcfd59a6b7d380c632aafd272a7da1863bfd49b3496'} , (err, res) => {
        console.log(res);
    });

    > {
        _id: '0x6f3c8113823f070b62905e979a9317e73dc218ed8d9b6d256190fe4e1144bfa8',
        eventType: 'DOCUMENT_REGISTER',
        data: { ... },
        transaction: '0x918ad9f8dd13bf3a309b0d10235bdb1fb7e9f7febd789b052c73fc6c97e442e5',
        from: '0x3b80e8e6756c26cae3062e7e07977403ced346e0',
        blockNumber: 9980757,
        timestamp: 1546855032
    }

------------------------------------------------------------------------------

Profile
--------

Registration
--------

Receiver
--------



