# Software Engineering / System Administration / GPG Keys

## Checking for existing keys

```sh
gpg --list-secret-keys --keyid-format LONG
```

## Generating a new key

### Ubuntu 16.04

```sh
gpg --gen-key
# Please select what kind of key you want:
#    (1) RSA and RSA (default)
#    (2) DSA and Elgamal
#    (3) DSA (sign only)
#    (4) RSA (sign only)
# > 1
#
# RSA keys may be between 1024 and 4096 bits long.
# What keysize do you want? (2048)
# > 4096
#
# Requested keysize is 4096 bits
# Please specify how long the key should be valid.
#          0 = key does not expire
#       <n>  = key expires in n days
#       <n>w = key expires in n weeks
#       <n>m = key expires in n months
#       <n>y = key expires in n years
# > 1y
#
# You need a user ID to identify your key; the software constructs the user ID
# from the Real Name, Comment and Email Address in this form:
#     "Heinrich Heine (Der Dichter) <heinrichh@duesseldorf.de>"
# 
# Real name: Joseph Matthias Goh
# Email address: zephinzer@users.noreply.github.com
# Comment: @zephinzer
```

## Exporting public key

```sh
gpg --list-secret-keys --keyid-format LONG | grep -A1 sec
# example assuming the above command returns:
#   sec   4096R/F4CC39BBD49A12D8 2020-01-07 [expires: 2021-01-07]
gpg --armor --export F4CC39BBD49A12D8
# -----BEGIN PGP PUBLIC KEY BLOCK-----
# ...
# -----END PGP PUBLIC KEY BLOCK-----
```