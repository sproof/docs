========================================
How to quickly embed the sproof verifier
========================================

The sproof verifier can be used to let anyone verify your documents on your website. If you confirmed others in the sproof network, their documents can also be verified this way.

The verifer is usually shipped with a docker container that provides an embeddable iframe. If you prefer a quicker way for testing and/or deploying, this description of the quick setup also provides a customizeable iframe in the end, albeit without the need to set up the docker container yourself.


Configuration
----------------------------------------

The source of the iframe to embed can be specified by a verifier URL with URL parameters. Depending on the URL and its parameters, you can customize the verifier. The fully URL with parameters is:

``{verificationUrl}/#/verify/{lang}?color={color}&btnFontColor={btnFontColor}&profile={profileAddress}&font='{font}'``

The URL (``verificationUrl``) can either be ``https://verify.sproof.io/`` for the mainnet or ``https://ropsten.sproof.io/`` for the testnet. Please refer to :doc:`network-sproof` for a more detailed description about the sproof networks.

The following URL parameters must be specified:

- ``lang`` - ``String`` (mandatory): The verifier page is available in English (value ``en``) and German (``de``).
- ``color`` - ``String`` (mandatory): Enter the main color of the verifier UI in hexadecimal encoding without #, e.g. ``ffffff`` for white.
- ``btnFontColor`` - ``String`` (optional): The font color for the Upload button. The default value is black.
- ``profileAddress`` - ``String`` (mandatory): Enter your sproof profile address here. This ensures that only documents registered by your profile or those of friends you confirmed in the sproof network are shown als valid.
- ``font`` - ``String`` (mandatory): The font used for the verifier UI. If the browser displaying the verifier does not support it, a browser-dependent default font may be used.
