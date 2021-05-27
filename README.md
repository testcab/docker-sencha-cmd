# testcab/sencha-cmd

[![docker build automated](https://img.shields.io/docker/cloud/automated/testcab/sencha-cmd.svg)](https://hub.docker.com/r/testcab/sencha-cmd "testcab/sencha-cmd")
[![](https://images.microbadger.com/badges/image/testcab/sencha-cmd.svg)](https://microbadger.com/images/testcab/sencha-cmd "testcab/sencha-cmd")

Docker image for [Sencha Cmd](https://www.sencha.com/products/extjs/cmd-download/), based on [openjdk:8-jre](https://hub.docker.com/_/openjdk), with Node.js 10 and npm 5 installed to support Fashion extension, and ruby 2.5 installed to support Compass extension.


### Supported Tags

* `7.4.0.39`, `7.4.0`, `7.4`, `7`, `latest`
* `7.3.0.19`, `7.3.0`, `7.3`
* `7.2.0.84`, `7.2.0`, `7.2`
* `7.1.0.15`, `7.1.0`, `7.1`
* `7.0.0.40`, `7.0.0`, `7.0`
* `6.7.0.63`, `6.7.0`, `6.7`, `6`
* `6.6.0.13`, `6.6.0`, `6.6`
* `6.5.3.6`, `6.5.3`, `6.5`


### Run as a container

Shell command:

```
docker run --rm -it testcab/sencha-cmd
```

### Use as a base container

`Dockerfile`:

```
FROM testcab/sencha-cmd
# custom instructions follows
```

## LICENSE

[MIT](LICENSE)
