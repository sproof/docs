
========
Examples
========

In the following you will find some examples to integrate and use sproof.

Profiles
=====================

Create a sproof profile

.. code-block:: javascript

    const { Sproof }  = require('js-sproof-client');

    let sproof = new Sproof({
      uri: 'https://sproof.it/',
    });

    let credentials = sproof.newAccount();

    let registerProfileEvent = sproof.registerProfile({
      name: 'new sproof account',
      profileText: 'Sproof Test Account',
      image: 'Qma34dB4B4N4eS5ibBkwtjTSTNCRdJrVY6E25DFuFuU8Sd'
    });

    sproof.commitPremium((err, res) => {
      if (err) console.error(err);
      else console.log(res);
    });

------------------------------------------------------------------------------

Document
=====================

Create a profile and register a document

.. code-block:: javascript

    const { Sproof, Registration }  = require('js-sproof-client');

    let sproof = new Sproof({
      uri: 'https://sproof.it/',
    });

    let credentials = sproof.newAccount();

    let registerProfileEvent = sproof.registerProfile({
      name: 'new sproof account 1',
      profileText: 'Sproof Test Account',
      image: 'Qma34dB4B4N4eS5ibBkwtjTSTNCRdJrVY6E25DFuFuU8Sd',
      homepage: 'www.test.at'
    });

    let documentHash = '0xf1b1c24a69c4c726c8b1ec42ed924b7305f3eb53949fc2f64dd1ef7d0ee9b0e5';
    // documentHash = sproof.getHash(>>string or buffer <<<);

    let registration  = new Registration({
      documentHash,
      validFrom: undefined, //unix timestamp
      validUntil: undefined, //unix timestamp
    });

    sproof.registerDocument(registration);


    sproof.commitPremium((err, res) => {
      if (err) console.error(err);
      else console.log(res);
    });

Publish and register a local Pdf File
=====================

Create a profile and register a document

.. code-block:: javascript

    const { Sproof, Registration }  = require('../index.js');
    const config = require ('./config/config_issuer');
    const fs = require('fs');

    let sproof = new Sproof(config)


    let data = fs.readFileSync('./example.pdf');

    sproof.uploadFile(data, (err,res) => { //upload file to ipfs
      if (res) {
        let documentHash = sproof.getHash(data); //calculate hash of the file

        let registration  = new Registration({
          documentHash,
          name: 'mytestpdf',
          locationHash: res.hash, //add ipfs location hash
          validFrom: undefined, //unix timestamp
          validUntil: undefined, //unix timestamp
        });

        sproof.registerDocument(registration);

        sproof.commitPremium((err, res) => {
          if (err) console.error(err);
          else console.log(res);
        });
      }else
        console.error(err)
    });
