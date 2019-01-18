========
Schema
========

The sproof-core module is a state machine which lives on top of a blockchain. The state transitions is triggered by socalled events. An issuer can add the hash reference of a list of events in a transaction to the blockchain, the raw-data is stored in IPFS. In this section we describe all currently available events.

Profile Register
=====================

To register a profile (issuer) the ``PROFILE_REGISTER`` event is needed.

.. raw:: javascript

    <iframe src="https://raw.githubusercontent.com/sproof/sproof-schema/master/events/profileRegister.js" height="345px" width="100%"></iframe>


