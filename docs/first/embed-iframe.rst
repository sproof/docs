==========================
Quickly embed the sproof verifier
==========================

The sproof verifier can be used to let other verify your (and your sproof-friends) documents on your website. The verifer is also shipped with the docker container, but for an quick setup we also provide a customize able iframe.




Mainnet
--------------------

The sproof-verifier on the mainnet is hosted on:

VerificationUrl: ``https://verify.sproof.io/``

Testnet
--------------------

The sproof-verifier on the test is hosted on:

VerificationUrl: ``https://ropsten.sproof.io/``


Configuration
---------------------------------

``{verificationUrl}/#/verify/{lang}?color={color}&btnFontColor={btnFontColor}&profile={profileAddress}&font='{font}'``



- ``verificationUrl`` - ``String``: Enter the verificationUrl. There is one for the testnet and one for the mainnet.
- ``lang`` - ``String``: The verifier page is available in english and german. Use ``de`` or ``en`` here.
- ``color`` - ``String``: Enter the main color of the verifier ui in hex encoding without #, e.g. ffffff for white.
- ``btnFontColor`` - ``String``: Color for the Button font. Standard is black.
- ``profileAddress`` - ``String``: Enter your sproof address here. This will ensure that only document of your profile or your friends are shown als valid on your domain.
- ``font`` - ``String``: Enter a common font name. If the browser does not support it, it wont work.
