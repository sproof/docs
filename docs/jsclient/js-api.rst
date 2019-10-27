========
API
========

The sproof API can be accessed through the domain https://api.sproof.io/api/v1/profiles. To enable a fast integration into a node application, we provide a JavaScript client for sproof named ``js-sproof-client``.

.. code-block:: javascript

    const {Sproof}  = require('js-sproof-client');
    let sproof = new Sproof ({
        uri: 'https://api.sproof.io/',
        chainId: '3',
        chain: 'ethereum',
        version: '0.42'
    });
    sproof.newAccount();

In the following, we describe the API calls for the sproof objects.

.. note::
The ``params`` object provides fields to adjust the
        - items per page : ``per_page`` : ``Number``
        - request page: ``page`` : ``Number``
        - entry : If you need only one specific entry, use ``id``:``String``


Transaction
=====================


.. code-block:: javascript

    sproof.getTransactions(params, callback)

Returns the transaction object.

.. note:: If the ``id`` property in ``params`` is set, this call returns the specified transaction. Otherwise, it returns a list of the last 10 entries.


----------
Parameters
----------

1. ``Object`` - Parameters for the call.
2. ``Function`` - Callback which returns an error object as its first parameter and the result as its second.


-------
Returns
-------


Returns ``Object`` - a transaction object, or an error when no transaction was found:

  - ``_id`` - ``String``: Transaction hash.
  - ``blockNumber`` - ``Number``: The number of the block.
  - ``blockHash`` 32 Bytes - ``String``: Hash of the block where this transaction is contained in.
  - ``timestamp`` - ``Number``: Unix timestamp of the block creation time.
  - ``dhtHash`` 32 Bytes - ``String``: IPFS hash of the content.
  - ``events``- ``List``: List of all events included in this transaction.
  - ``from`` - ``String``: Address of the sender.
  - ``publicKey`` - ``String``: Public key of the sender.

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

.. note:: If the ``id`` property in ``params`` is set, this call returns the specified event. Otherwise, it returns a list of the last 10 entries.


----------
Parameters
----------

1. ``Object`` - Parameters for the call.
2. ``Function`` - Callback which returns an error object as its first parameter and the result as its second.


-------
Returns
-------


Returns ``Object`` - an event object, or an error when no event was found:

  - ``_id`` - ``String``: Event hash.
  - ``eventType`` - ``String``: Type of the event.
  - ``data`` - ``Object``: Event payload.
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
=====================


.. code-block:: javascript

    sproof.getProfiles(params, callback)

Returns the profile object.

.. note:: If the ``id`` property in ``params`` is set, this call returns the specified profile. Otherwise it returns a list of the last 10 entries.


----------
Parameters
----------

1. ``Object`` - Parameters for the call.
2. ``Function`` - Callback which returns an error object as its first parameter and the result as its second.


-------
Returns
-------


Returns ``Object`` - a profile object, or an error when no profile was found:

  - ``_id`` - ``String``: Address of the profile owner.
  - ``data`` - ``Object``: Profile payload.
  - ``publicKey`` - ``String``: The profile's public key.
  - ``lastUpdate`` - ``Number``: Unix timestamp of the last interaction of this profile.
  - ``timestamp`` - ``Number``: Unix timestamp of the creation date.
  - ``valid`` - ``Boolean``: ``TRUE`` if any only if the profile was not revoked.
  - ``registrations`` - ``Object``: List of registration events.
  - ``events`` - ``Object``: List of all events.
  - ``confirmations`` - ``Object``: Collection of all confirmations

-------
Example
-------

.. code-block:: javascript

    sproof.getProfiles({id: '0x86ec4f0b4e8ecc2f13f8ad86d9f6c2db30648b96'} , (err, res) => {
        console.log(res);
    });

    > {
        _id: '0x86ec4f0b4e8ecc2f13f8ad86d9f6c2db30648b96',
        data: { ... },
        publicKey: '0x2ab25035b3d357215c7d7656c9f3fa2d37a25e26dd0c75169dadb5b9292dfed3004b3094c8b4a5ba56e4550d77fabc1cc6d678b38e2ab33dfae96daaae3d0c8e',
        lastUpdate: 1545231020,
        timestamp: 1545231020,
        valid: true,
        registrations: [],
        events:
        [
            '0xfe0bbd902a699a4d6546e20c2c199398f6f454354df9e93f17e780904ce794e9'
        ],
        confirmations: [ ... ]
    }

------------------------------------------------------------------------------

Registrations
=====================


.. code-block:: javascript

    sproof.getRegistrations(params, callback)

Returns the registration object.

.. note:: If the ``id`` property in ``params`` is set, this call returns the specified registration. Otherwise, it returns a list of the last 10 entries.


----------
Parameters
----------

1. ``Object`` - Parameters for the call.
2. ``Function`` - Callback which returns an error object as its first parameter and the result as its second.


-------
Returns
-------


Returns ``Object`` - a registration object, or an error when no registration was found:

  - ``_id`` - ``String``: Hash of the registration.
  - ``issuer`` - ``Object``: Address of the issuer.
  - ``event`` - ``String``: Corresponding event registration hash.
  - ``validFrom`` - ``Number``: Unix timestamp for the start of the validity period.
  - ``validUntil`` - ``Number``: Unix timestamp for the end of the validity period.
  - ``documentHash`` - ``String``: Hash of the registered document.
  - ``valid`` - ``Boolean``: ``TRUE`` if any only if the registration was not revoked.
  - ``dependencies`` - ``Object``: List of dependencies.

-------
Example
-------

.. code-block:: javascript

    sproof.getRegistrations({id: '0xb4af7c7b9d4ab6dbe222d4f1c5f8837159d3efbacfe34d1fb5e186ec59fafaec'} , (err, res) => {
        console.log(res);
    });

    > {
        _id: '0xb4af7c7b9d4ab6dbe222d4f1c5f8837159d3efbacfe34d1fb5e186ec59fafaec',
        issuer: '0x86ec4f0b4e8ecc2f13f8ad86d9f6c2db30648b96',
        event: '0x74ff215595298423dd1569356e9c30540cd85ad941c17dce762fe52326a08c43',
        validFrom: null,
        validUntil: null,
        documentHash: '0xb4af7c7b9d4ab6dbe222d4f1c5f8837159d3efbacfe34d1fb5e186ec59fafaec',
        valid: true,
        dependencies: []
    }

------------------------------------------------------------------------------

Validation
=====================


.. code-block:: javascript

    sproof.getValidation(id, callback)

Returns the validation object.


----------
Parameters
----------

1. ``String`` - Hash to verify.
2. ``Function`` - Callback which returns an error object as its first parameter and the result as its second.


-------
Returns
-------


Returns ``Object`` - a registration object, or an error when no registration was found:

  - ``validation`` - ``Object``: Contains boolean values which indicate whether or not the registration or the profile were revoked.
  - ``registration`` - ``Object``: Registration event.
  - ``profile`` - ``Object``: Issuer payload

-------
Example
-------

.. code-block:: javascript

    sproof.getValidation('0x5d7a02fda80aa4f70032c180ec3aa4a4f3f3075ae7abeb514186be1f104dd271' , (err, res) => {
        console.log(res);
    });

    > "validation": {
            "registration":true,
            "profile":true
        },
        "registration":{ ... }
        "profile" : { ...  }
    }

