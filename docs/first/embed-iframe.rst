========================================
How to quickly embed the sproof verifier
========================================

The sproof verifier can be used to let anyone verify your documents on your website. If you confirmed others in the sproof network, their documents can also be verified this way.

The verifer is usually shipped with a docker container that provides an embeddable iframe. If you prefer a quicker way for testing and/or deploying, this description of the quick setup also provides a customizeable iframe in the end, albeit without the need to set up the docker container yourself.


Configuration
----------------------------------------

The source of the iframe to embed can be specified by a verifier URL with URL parameters. Depending on the URL and its parameters, you can customize the verifier. The full URL with parameters is:

``{verificationUrl}/#/verify/{lang}?color={color}&btnFontColor={btnFontColor}&profile={profileAddress}&font='{font}'``

The URL (``verificationUrl``) can either be ``https://verify.sproof.io/`` for the mainnet or ``https://ropsten.sproof.io/`` for the testnet. Please refer to :doc:`network-sproof` for a more detailed description about the sproof networks.

The following URL parameters may be specified:

- ``lang`` - ``String``: The verifier page is available in English (value ``en``) and German (``de``). The default language is English (``en``).
- ``color`` - ``String``: Enter the main color of the verifier UI in hexadecimal encoding without #, e.g. ``ffffff`` for white. The default color is ``sproof color``.
- ``btnFontColor`` - ``String``: The font color for the Upload button. The default value is white.
- ``profile`` - ``String`` (strongly recommended): Enter your sproof profile address here (you can find it at the bottom of your Settings page at https://app.sproof.io/#/settings/). This address ensures that only documents registered by your profile or those of friends you confirmed in the sproof network are shown als valid. If no ``profile`` is specified, sproof's profile is used. This fallback behavior is not recommended.
- ``font`` - ``String``: The font used for the verifier UI. If the browser displaying the verifier does not support it, a browser-dependent default font may be used. If no ``font`` is specified, the default font ``Catamaran`` is used.

An example URL is ``https://verify.sproof.io/#/verify/de?color=000000&btnFontColor=ffffff&profile=0x711d88f76c98a023a7ecf27e167df3f533661626&font='sans-serif'``. A full example for embedding can be found below.

Full example
----------------------------------------

The following example creates an embeddable iframe with a verifier in the mainnet.

.. code-block:: html
  
  <iframe src="https://verify.sproof.io/#/verify/de?color=000000&btnFontColor=ffffff&profile=0x711d88f76c98a023a7ecf27e167df3f533661626&font='sans-serif'" style="width: 100%;height: 300px;border: none;"></iframe>
