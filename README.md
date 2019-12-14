# `wiki.joeir.net`

Check it out at: [https://wiki.joeir.net](https://wiki.joeir.net).

# Development Runbook

## Installing `mkdocs`

```sh
pip3 install --upgrade --no-cache-dir mkdocs;
```

## Running locally

Use the `run` recipe in the Makefile to start the Wiki locally:

```sh
make run;
# or simply
make;
```

## Deploying the site

The `deploy` recipe in the Makefile handles this:

```sh
make deploy;
```

Note that you may have to `git checkout gh-pages` first and do a `git pull` before it will work.
