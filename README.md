# Repl.it audio bindings bundle.

This package includes the go bindings and static library files needed for audio at repl.it.

Credits go to:

- [libsamplerate](https://github.com/erikd/libsamplerate) for the C library.
- [opus](https://github.com/xiph/opus) for opus support
- [opusfile](https://github.com/xiph/opusfile) For opus file decoding
- [libogg](https://github.com/xiph/ogg) Required to build opus and used in the go bindings.
- [OpenSSL](https://github.com/openssl/openssl) Not included but is used to build opus.
- [gosamplerate](https://github.com/dh1tw/gosamplerate) go bindings for libsamplerate. (modified to use CFLAGS and LDFLAGS instead of pkg-config)
- [opus](https://github.com/hraban/opus) (the go bindings, not opus itself): Bindings for libopus. (Same with gosamplerate, modified to use CFLAGS and LDFLAGS in place of pkg-config)
- [this](https://stackoverflow.com/questions/56415996/linking-error-selective-static-linking-of-libm-a-in-gcc) stackoverflow answer which includes a short c script used to static link libm.a without libc. They borrowed it from [here](https://git.amper.me/open-source/glibc/commit/e2e4f56056adddc3c1efe676b40a4b4f2453103b)
