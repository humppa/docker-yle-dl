
# docker-yle-dl

Dockerization for [yle-dl](https://aajanki.github.io/yle-dl).

## usage

Build docker image and call it `yle-dl`:

    docker build -t yle-dl .

Run image and save downloads to directory `./dl`:

    docker run -ti --rm -v $(pwd)/dl:/yle yle-dl <OPTIONS | URL...>
