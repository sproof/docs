========
sproof API client
========

The sproof API client is a docker-container which encapsulates the ``js-sproof-client`` and can be access with standard API calls. Currently this module supports the registration and the revocation of arbitrary files.

After the setup phase the API can be access only with a valid access token, which is generated locally.

Register file
=====================


.. code-block:: bash

    POST: https://{{yourDomain}}/api/v1/file/register?public=true&name=NameOfYourDocument&accessCode={yourAccessCode}

The body must contain a file embedded into a ```form-data``` the name of the document must be ```file```.

Returns the hash and the id of the document. Additionally if the parameter public is set to true, it will also return the location hash (IPFS reference, which can be accessed via https://ipfs.io/ipfs/{locationHash}.


----------
Parameters
----------

1. ``accessCode`` - Needed for authorization.
2. ``public`` - If the file should be publicly access able, set public to true. Default is false.
3. ``name`` - Optional a name for the file, this files could also be used as a tag.


-------
Returns
-------


  - ``hash`` - ``String``: The hash of the document.
  - ``location`` - ``String``: If the parameter public is set to true, it will return the IPFS location hash.
  - ``id`` - ``String``: The id of the file, calculated with the issuers address and the document hash.

------------------------------------------------------------------------------

Revoke file
=====================


.. code-block:: bash

    POST: https://{{yourDomain}}/api/v1/file/revoke?accessCode={yourAccessCode}

The body must contain a file embedded into a ```form-data``` the name of the document must be ```file```.

----------
Parameters
----------

1. ``accessCode`` - Needed for authorization.


------------------------------------------------------------------------------

Verify file
=====================


.. code-block:: bash

    POST: https://{{yourDomain}}/api/v1/file/verify

The body must contain a file embedded into a ```form-data``` the name of the document must be ```file```.

-------
Returns
-------

returns ``List`` - A list of registration objects, or an error when no registration was found:

  - ``validation`` - ``Object``: Contains boolean values which indicates if the registration or the profile was revoked or not.
  - ``registration`` - ``Object``: Registration event.
  - ``profile`` - ``Object``: Issuer payload



------------------------------------------------------------------------------

Commit
=====================

The commit to the sproof platform is performed according the defined schedule. If a irregular commit is necessary this call can be used.

.. code-block:: bash

    GET: https://{{yourDomain}}/api/v1/commit?accessCode={yourAccessCode}

----------
Parameters
----------

1. ``accessCode`` - Needed for authorization.

-------
Returns
-------
returns ``Object`` - A object of all information which is send to the sproof platform. This includes all events and attached data.

------------------------------------------------------------------------------

State
=====================

Returns the current state of the client api. This includes also information about transaction and events including ids.

.. code-block:: bash

    GET: https://{{yourDomain}}/api/v1/state?accessCode={yourAccessCode}

----------
Parameters
----------

1. ``accessCode`` - Needed for authorization.

-------
Returns
-------
returns ``Object`` - A object of all information which is stored of the premium users.

------------------------------------------------------------------------------
