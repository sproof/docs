========
Schema
========

The sproof-core module is a state machine which lives on top of a blockchain. The state transitions is triggered by socalled events. An issuer can add the hash reference of a list of events in a transaction to the blockchain, the raw-data is stored in IPFS. In this section we describe all currently available events.

Profile
=====================

A profile schema has the following form:

.. code-block:: javascript

    {
      "$schema": "http://json-schema.org/draft-06/schema#",
      "title": "Profile",
      "description": "A sproof profile",
      "type": "object",
      "properties": {
        "name": {
          "description": "The name of a user",
          "type": "string",
          "minLength" : 3,
        },
        profileText: {
          description: "Additional text for the profile",
          type: "string",
          "title": "Add your profile text",
          "maxLength": 500,
          "validationMessage": "Don't be greedy!"
        },
        "image": {
          "description": "A base64 encoded string of a image",
          "type": "string",
          "minLength": 1
        },
        website: {
          description: "The website of the user. To increase the trust, the user has to upload a file on rootdomain/sproof.html",
          type: "string",
          pattern : "^((http\\:\\/\\/|https\\:\\/\\/)([a-z0-9][a-z0-9\\-]*\\.)+[a-z0-9][a-z0-9\\-]*$)?$"
        },
        "socialMedia": {
          "type": "array",
          "description": "Array of social media post and user account. This is to increase the trust of the users account",
          "items": {
            "type": "object",
            "properties": {
              "userId": {
                "description": 'The unique userid of a social media account.',
                "type": "string"
              },
              "messageId": {
                "description": "The unique message_id which contrains the public key of the user",
                "type": "string"
              },
              "platform": {
                "type": "string",
                "description": "Name of the social media platform"
              }
            },
            "required": ["userId", "messageId", "platform"]
          },
          "minItems": 0,
          "uniqueItems": true
        },
      },
      "required" : ["name"]
    };

----------
Register
----------

To register a profile (issuer) the ``PROFILE_REGISTER`` event is needed.


.. code-block:: javascript

    {
      "$schema": "http://json-schema.org/draft-06/schema#",
      "title": "Profile register",
      "description": "Register sproof profile event",
      "type": "object",
      properties : {
        "eventType" : {
          "type" : "string",
          "enum" : ["PROFILE_REGISTER"]
        },
        data: $ProfileSchema
      },
      "required" : ['eventType', 'data']
    }

----------
Update
----------

To update a profile (issuer) the ``PROFILE_UPDATE`` event is needed.


.. code-block:: javascript

    {
      "$schema": "http://json-schema.org/draft-06/schema#",
      "title": "Update Profile",
      "description": "Update profile sproof event",
      "type": "object",
      properties : {
        "eventType" : {
          "type" : "string",
          "enum" : ["PROFILE_UPDATE"]
        },
        data: $ProfileSchema
      },
      "required" : ['eventType', 'data']
    }

----------
Revoke
----------

To revoke a profile (issuer) the ``PROFILE_REVOKE`` event is needed.


.. code-block:: javascript

    {
      "$schema": "http://json-schema.org/draft-06/schema#",
      "title": "Profile revoke",
      "description": "Revoke a profile sproof event",
      "type": "object",
      properties : {
        "eventType" : {
          "type" : "string",
          "enum" : ["PROFILE_REVOKE"]
        },
        data: {
          type : 'object',
          properties: {
            reason: {
              description: "Description for revokation",
              type: "string",
              maxLength: 512,
            }
          }
        }
      },
      "required" : ['eventType', 'data']
    }


----------
UpdateKey
----------

To update a profile's key  the ``PROFILE_UPDATE_KEY`` event is needed.


.. code-block:: javascript

    {
      "$schema": "http://json-schema.org/draft-06/schema#",
      "title": "Update Profile Key",
      "description": "Update profile key sproof event",
      "type": "object",
      properties : {
        "eventType" : {
          "type" : "string",
          "enum" : ["PROFILE_UPDATE_KEY"]
        },
        data: {
          type : 'object',
          properties: {
            : {
              description: "Description for revocation",
              type: "string",
              maxLength: 512,
              minLength: 512,
            }
          }
        }
      },
      "required" : ['eventType', 'data']
    }

Document
=====================

A document can be any file with a hash reference. It is up to the user if the content of this file is publicly available or not. A document can have ``0`` to ``n`` receivers.

----------
Register
----------

To register a document the ``DOCUMENT_REGISTER`` event is needed.


.. code-block:: javascript

    {
      "$schema": "http://json-schema.org/draft-06/schema#",
      "title": "Register a document",
      "description": "Register a document sproof event",
      "type": "object",
      properties : {
        "eventType" : {
          "type" : "string",
          "enum" : ["DOCUMENT_REGISTER"]
        },
        data:  {
          type : 'object',
          properties: {
            validFrom: {
              description: "Unix timestamp",
              type: "number",
            },
            validUntil: {
              description: "Unix timestamp",
              type: "number",
            },
            documentHash : {
              description: "Hash of document to register",
              type: "string",
            },
            data: {
              type:'object',
            },
            dependencies: {
              type: 'array',
              items: {
                type: 'string',
                description: 'Hashes of registration or receivers'
              },
            },
            receivers : {
              type: 'array',
              items: {
                type: 'string',
                description: 'Hashes of registration or receivers'
              }
            }
          },
          required: ['documentHash']
        }
      },
      "required" : ['eventType', 'data']
    }

----------
Revoke
----------

To revoke a document the ``DOCUMENT_REVOKE`` event is needed.


.. code-block:: javascript

    {
      "$schema": "http://json-schema.org/draft-06/schema#",
      "title": "Document revoke",
      "description": "Revoke a sproof document event",
      "type": "object",
      properties : {
        "eventType" : {
          "type" : "string",
          "enum" : ["DOCUMENT_REVOKE"]
        },
        data: {
          type : 'object',
          properties: {
            documentHash: {
              description: "Hash of the registered document",
              type: "string"
            },
            reason: {
              description: "Description for revokation",
              type: "string",
              maxLength: 512,
            }
          }
        },
        required : ['eventId']
      },
      required : ['eventType', 'data']
    }

Receiver
=====================

Documents can be issued to receivers. The receivers public representation is a pseudonous hash reference of its ID containing all attributes, and a timerange which defined the validity period.

----------
Add
----------

To add a receiver to a document the ``DOCUMENT_RECEIVER_ADD`` event is needed.

.. code-block:: javascript
    {
      "$schema": "http://json-schema.org/draft-06/schema#",
      "title": "Document receiver add",
      "description": "Add a receiver to a sproof document event",
      "type": "object",
      properties : {
        "eventType" : {
          "type" : "string",
          "enum" : ["DOCUMENT_RECEIVER_ADD"]
        },
        data: {
          type : 'object',
          properties: {
            receiverId: {
              description: "Id of the receivers hash",
              type: "string"
            },
            documentHash: {
              description: "Hash of the registered document",
              type: "string"
            }
          }
        },
        required : ['receiverId', 'documentHash'],
      },
      required : ['eventType', 'data']
    }


----------
Revoke
----------

To revoke a receiver of a document the ``DOCUMENT_RECEIVER_REVOKE`` event is needed.

.. code-block:: javascript
    {
      "$schema": "http://json-schema.org/draft-06/schema#",
      "title": "Document receiver revoke",
      "description": "Revoke a sproof document receiver event",
      "type": "object",
      properties : {
        "eventType" : {
          "type" : "string",
          "enum" : ["DOCUMENT_RECEIVER_REVOKE"]
        },
        data: {
          type : 'object',
          properties: {
            receiverId: {
              description: "Id of the receivers hash",
              type: "string"
            },
            reason: {
              description: "Description for revokation",
              type: "string",
              maxLength: 512,
            }
          }
        },
        required : ['receiverId']
      },
      required : ['eventType', 'data']
    }