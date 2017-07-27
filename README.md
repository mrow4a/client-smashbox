# ownCloud: Smashbox Docker Runner

## Usage

```bash
docker run -ti \
  --name client-smashbox \
  owncloud/client-smashbox:latest
```


## Build locally

The available versions should be already pushed to the Docker Hub, but in case you want to try a change locally you can always execute the following command to get this image built locally:

```
IMAGE_NAME=owncloud/client-smashbox ./hooks/build
```

## Available environment variables

```
SMASHBOX_ACCOUNT_PASSWORD
SMASHBOX_ROOT
SMASHBOX_URL
SMASHBOX_USERNAME
SMASHBOX_PASSWORD
SMASHBOX_TIMEOUT 3600
SMASHBOX_WAIT false
SMASHBOX_SSL_ENABLED false
```

## Issues, Feedback and Ideas

Open an [Issue](https://github.com/owncloud-docker/smashbox/issues)

## Contributing

Fork -> Patch -> Push -> Pull Request

## Authors

* [Piotr Mrowczynski](https://github.com/mrow4a)


## License

MIT


## Copyright

```
Copyright (c) 2017 Piotr Mrowczynski <piotr@owncloud.com>
```
