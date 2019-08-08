/*******************************************************************************

    D language bindings for libsodium's crypto_auth_hmacsha256.h

    License: ISC (see LICENSE.txt)

*******************************************************************************/

module libsodium.crypto_auth_hmacsha256;

@nogc nothrow:

import libsodium;

extern (C):

enum crypto_auth_hmacsha256_BYTES = 32U;
size_t crypto_auth_hmacsha256_bytes ();

enum crypto_auth_hmacsha256_KEYBYTES = 32U;
size_t crypto_auth_hmacsha256_keybytes ();

int crypto_auth_hmacsha256 (
    ubyte* out_,
    const(ubyte)* in_,
    ulong inlen,
    const(ubyte)* k);

int crypto_auth_hmacsha256_verify (
    const(ubyte)* h,
    const(ubyte)* in_,
    ulong inlen,
    const(ubyte)* k);

/* ------------------------------------------------------------------------- */

struct crypto_auth_hmacsha256_state
{
    crypto_hash_sha256_state ictx;
    crypto_hash_sha256_state octx;
}

size_t crypto_auth_hmacsha256_statebytes ();

int crypto_auth_hmacsha256_init (
    crypto_auth_hmacsha256_state* state,
    const(ubyte)* key,
    size_t keylen);

int crypto_auth_hmacsha256_update (
    crypto_auth_hmacsha256_state* state,
    const(ubyte)* in_,
    ulong inlen);

int crypto_auth_hmacsha256_final (
    crypto_auth_hmacsha256_state* state,
    ubyte* out_);

void crypto_auth_hmacsha256_keygen (
    ref ubyte[crypto_auth_hmacsha256_KEYBYTES] k);

