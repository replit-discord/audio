# Repl.it audio bindings bundle.

This package includes the go bindings and static library files needed for audio at repl.it.

Credits go to:

- [libsamplerate](https://github.com/erikd/libsamplerate) for the C library.
- [opus](https://github.com/xiph/opus) for opus support
- [opusfile](https://github.com/xiph/opusfile) For opus file decoding
- [libogg](https://github.com/xiph/ogg) Required to build opus and used in the go bindings.
- [OpenSSL](https://github.com/openssl/openssl) Not included but is used to build opus.
- [gosamplerate](https://github.com/dh1tw/gosamplerate) go bindings for libsamplerate. (modified to use CFLAGS and LDFLAGS instead of pkg-config, and to take the output buffer size as an argument to NewSource rather than setting it to the input buffer size)
- [opus](https://github.com/hraban/opus) (the go bindings, not opus itself): Bindings for libopus. (modified to use CFLAGS and LDFLAGS in place of pkg-config)
- [this](https://stackoverflow.com/questions/56415996/linking-error-selective-static-linking-of-libm-a-in-gcc) stackoverflow answer which includes a short c script used to static link libm.a without libc. They borrowed it from [here](https://git.amper.me/open-source/glibc/commit/e2e4f56056adddc3c1efe676b40a4b4f2453103b)

## Contributing

For new file support, we need the following:
+ Abillity to find file/decoder samplerate (or a static samplerate).
+ Abillity to get channel count of the decoder (or a static channel count).
+ Abillity to read into a pcm buffer (Format can be whatever, we just need to know what the format is).
+ Go bindings for the library.
+ Static .a library, not .so files.
+ Sources must be cited.
+ If there is a pure-go version of the library just send a request for that file format over at https://repl.it/feedback, this is just for bundling c libraries with go bindings.

Note that this is not where you should report issues for audio at repl.it, instead report at https://repl.it/bugs/
