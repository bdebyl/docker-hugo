# Hugo Docker
Dockerized [Hugo](http://gohugo.io/) in [Alpine](https://www.alpinelinux.org/).

Usage of this image assumes basic understanding
of [**running Docker images**](https://docs.docker.com/engine/reference/run/).

[![pipeline](https://img.shields.io/gitlab/pipeline/bdebyl/docker-hugo.svg)](https://gitlab.com/bdebyl/docker-hugo/pipelines)
[![docker pulls](https://img.shields.io/docker/pulls/bdebyl/hugo.svg)](http://hub.docker.com/r/bdebyl/hugo/)


# Usage
The basic entrypoint of the docker image is the `hugo` binary. This means it's
as simple as running the following command (*for help*):
```
docker run bdebyl/hugo help
```
**Note:** _It is recommended to append the `--rm` option after `docker run` to
keep things clean, or naming your container appropriately for re-use._

## Example
The following example should be used for reference when running the server with
all necessary options:
```
docker run -it --rm --user $(id -u $USER):$(id -g $USER) -v /home/bastian/src/bdebyl-site:/src -p 1313:1313/tcp bdebyl/hugo server --bind=0.0.0.0
```

# Server
To run the server, it's key to
recall [Hugo's bind interface](https://gohugo.io/commands/hugo_server/#options)
and specify it appropriately.

Example:
```
docker run bdebyl/hugo server --bind=0.0.0.0
```

# Ports
The image only exposes Hugo's default port of `1313`. Make sure to expose it
during runtime.

# Volume
The image expects source code for a Hugo site, including a theme, to be mounted
to the containers `/src` directory. This could be done via:
```
docker run -v /absolute/path/to/source:/src bdebyl/hugo
```

Example Source Directory Structure:
```
.
├── config.toml
├── content
│   └── post
└── themes
    └── theme_name
```
