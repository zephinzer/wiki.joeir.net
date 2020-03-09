# Software Engineering / System Administration / GPG Keys

- [Software Engineering / System Administration / GPG Keys](#software-engineering--system-administration--gpg-keys)
  - [Checking for existing keys](#checking-for-existing-keys)
  - [Generating a new key](#generating-a-new-key)
    - [Generating a new key with Ubuntu](#generating-a-new-key-with-ubuntu)
  - [Exporting public key](#exporting-public-key)
  - [Adding GPG keys to platforms](#adding-gpg-keys-to-platforms)
    - [Adding GPG keys to Gitlab](#adding-gpg-keys-to-gitlab)
    - [Adding GPG keys to Github](#adding-gpg-keys-to-github)

## Checking for existing keys

```sh
gpg --list-secret-keys --keyid-format LONG
```

## Generating a new key

### Generating a new key with Ubuntu

```sh
# on 18.04
gpg --full-gen-key;

# on 16.04
gpg --gen-key;
```

## Exporting public key

Use cases:
1. [Adding GPG keys to platforms](#adding-gpg-keys-to-platforms)

```sh
gpg --list-secret-keys --keyid-format LONG | grep -A1 sec
# example assuming the above command returns:
#   sec   4096R/C4CC3911D49AB2D8 2020-01-07 [expires: 2021-01-07]
gpg --armor --export C4CC3911D49AB2D8
# -----BEGIN PGP PUBLIC KEY BLOCK-----
# ...
# -----END PGP PUBLIC KEY BLOCK-----
```

## Adding GPG keys to platforms

### Adding GPG keys to Gitlab

Login to Gitlab and visit [https://gitlab.com/profile/gpg_keys](https://gitlab.com/profile/gpg_keys). Run the steps in [Exporting public key](#exporting-public-key) and paste the exported public key block in.

### Adding GPG keys to Github

Login to Github and visit [https://github.com/settings/keys](https://github.com/settings/keys). Run the steps in [Exporting public key](#exporting-public-key) and paste the exported public key block in.