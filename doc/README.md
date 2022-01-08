Coinrac Core
==========

This is the official reference wallet for Coinrac digital currency and comprises the backbone of the Coinrac peer-to-peer network. You can [download Coinrac Core](https://www.coinrac.org/downloads/) or [build it yourself](#building) using the guides below.

Running
---------------------
The following are some helpful notes on how to run Coinrac on your native platform.

### Unix

Unpack the files into a directory and run:

- `bin/coinrac-qt` (GUI) or
- `bin/coinracd` (headless)

### Windows

Unpack the files into a directory, and then run coinrac-qt.exe.

### OS X

Drag Coinrac-Qt to your applications folder, and then run Coinrac-Qt.

### Need Help?

* See the [Coinrac documentation](https://docs.coinrac.org)
for help and more information.
* See the [Coinrac Developer Documentation](https://coinrac-docs.github.io/) 
for technical specifications and implementation details.
* Ask for help on [Coinrac Nation Discord](http://coinracchat.org)
* Ask for help on the [Coinrac Forum](https://coinrac.org/forum)

Building
---------------------
The following are developer notes on how to build Coinrac Core on your native platform. They are not complete guides, but include notes on the necessary libraries, compile flags, etc.

- [OS X Build Notes](build-osx.md)
- [Unix Build Notes](build-unix.md)
- [Windows Build Notes](build-windows.md)
- [OpenBSD Build Notes](build-openbsd.md)
- [Gitian Building Guide](gitian-building.md)

Development
---------------------
The Coinrac Core repo's [root README](/README.md) contains relevant information on the development process and automated testing.

- [Developer Notes](developer-notes.md)
- [Release Notes](release-notes.md)
- [Release Process](release-process.md)
- Source Code Documentation ***TODO***
- [Translation Process](translation_process.md)
- [Translation Strings Policy](translation_strings_policy.md)
- [Travis CI](travis-ci.md)
- [Unauthenticated REST Interface](REST-interface.md)
- [Shared Libraries](shared-libraries.md)
- [BIPS](bips.md)
- [Dnsseed Policy](dnsseed-policy.md)
- [Benchmarking](benchmarking.md)

### Resources
* Discuss on the [Coinrac Forum](https://coinrac.org/forum), in the Development & Technical Discussion board.
* Discuss on [Coinrac Nation Discord](http://coinracchat.org)

### Miscellaneous
- [Assets Attribution](assets-attribution.md)
- [Files](files.md)
- [Fuzz-testing](fuzzing.md)
- [Reduce Traffic](reduce-traffic.md)
- [Tor Support](tor.md)
- [Init Scripts (systemd/upstart/openrc)](init.md)
- [ZMQ](zmq.md)

License
---------------------
Distributed under the [MIT software license](/COPYING).
This product includes software developed by the OpenSSL Project for use in the [OpenSSL Toolkit](https://www.openssl.org/). This product includes
cryptographic software written by Eric Young ([eay@cryptsoft.com](mailto:eay@cryptsoft.com)), and UPnP software written by Thomas Bernard.
