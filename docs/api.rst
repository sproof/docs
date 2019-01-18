========
API
========

Transaction
=====================


.. code-block:: javascript

    sproof.getTransactions(params, callback)

Returns the transaction object of a transaction.

.. note:: If the id property in params is set, this call returns the specified transaction.


----------
Parameters
----------

1. ``Object`` - params for call.
2. ``Function`` - Callback, returns an error object as first parameter and the result as second.


-------
Returns
-------


returns ``Object`` - A transaction object, or ``null`` when no transaction was found:

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
        "result":
            {
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
            },
        "error":null
    }

------------------------------------------------------------------------------

Event
--------

Profile
--------

Registration
--------

Receiver
--------



