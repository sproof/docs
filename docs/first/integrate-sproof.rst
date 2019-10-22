============
Integrate sproof into an existing application
============

This page is written for developers, how want to integrate sproof into an existing application with signing and timestamping digital data, e.g. certificates or diplomas.


.. Hint:: We also provide a separate network for testing. >> :doc:`network-sproof` <<


In order to fully integrate sproof to your software application four steps are needed:

1. Create a sproof profile
===============================

Please visit :doc:`create-profile` for instructions to create a profile. You will need your sproof-code in order to configure your docker client.


2. Install the docker-client
===============================

Please visit https://github.com/sproof/sproof-api-client for install instruction of the docker client.

At the end you should have your access code. For production mode, we recommend to host this service on a public domain over TLS.


3. Integrate the client-api
===============================

Please visit :doc:`../docker/docker-api` for examples and instruction how to use the docker api. In the best case you only need one POST request.


4. Embed IFrame on your website
===============================

If everything works correctly you are now able to embed the webpage of the docker-client into your application, by using an iframe.

On http://localhost:6001 you should see now our small verification page.
