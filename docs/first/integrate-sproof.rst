=============================================
Integrate sproof into an existing application
=============================================

This page is targeted at developers who want to integrate sproof into an existing application for signing and timestamping digital data, e.g., certificates or diplomas.

For testing and production, two separate networks are available, see :doc:`network-sproof`.


.. Hint:: Using the test network is free and allows for easy testing and integration.


In order to fully integrate sproof into your software application, four steps are needed:

1. Create a sproof profile
==========================

If you have not done so already, please create a sproof profile first. Visit :doc:`create-profile` for more detailed instructions. You will need your ``sproof-code`` in order to configure your docker client in the next step.


2. Install the docker client
============================

In order to make use of the sproof API, the sproof API client needs to be set up on a physical or virtual machine. The client is available as a ready-to-use docker image. Please see :doc:`../docker/docker-setup` for setup instructions.


.. Hint:: If you plan to use the docker client in production, we recommend to host this service on a public domain over TLS.


After the docker client setup, you get your access code for use in the next step.

3. Integrate the client API
===========================

You can now access the sproof API through the docker client that has been set up in the previous step. Examples and instructions on how to use the client API are provided in the docker API documentation (:doc:`../docker/docker-api`). You need your access code from the previous steps for most of the API calls.

.. Hint:: Depending on your use case, it may be sufficient to only use the `verify` API call, which is one POST request. Fully ready-to-use examples are provided in multiple common programming languages.


Note that, for testing and production, two separate networks are available, see :doc:`network-sproof`.


.. Hint:: Using the test network is free and allows for easy testing and integration.
 

4. Embed an iframe into your Website
====================================

After you have finished integrating the API and everything works as desired, you can embed the Webpage of the docker client into your application, e.g., by using an iframe.

Port 6001 of the machine on which you set up the docker client (step 2) features a HTTP server with a small verification page. Use, http://localhost:6001 or http://<your-machine-domain>:6001, respectively, to display this verification page. Alternatively, you can embed it into another page as described above.

If you are looking for an easier option for providing for verification that does not require managing certificates or performing other maintenance of Docker client, please refer to :doc:`../first/embed-iframe`.
