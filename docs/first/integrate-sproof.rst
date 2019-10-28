============
Integrate sproof into an existing application
============

This page is written for developers who want to integrate sproof into an existing application for signing and timestamping digital data, e.g., certificates or diplomas.


.. Hint:: We also provide a separate network for testing. >> :doc:`network-sproof` <<


In order to fully integrate sproof into your software application, four steps are needed:

1. Create a sproof profile
===============================

Please visit :doc:`create-profile` for instructions on how to create a profile. You will need your ``sproof-code`` in order to configure your docker client.


2. Install the docker client
===============================

Please visit https://github.com/sproof/sproof-api-client for installation instructions for the docker client.

At the end of this step you get your access code. For production mode, we recommend to host this service on a public domain over TLS.


3. Integrate the client API
===============================

Please visit :doc:`../docker/docker-api` for examples and instructions how to use the docker API. In the best case, you only need one POST request.


4. Embed an iframe into your Website
===============================

If everything works correctly, you can now embed the Webpage of the docker client into your application by using an iframe.

On http://localhost:6001, you can see a small verification page.
