# docker-couchpotato-arm32v7

Dockerfile to build [CouchPotato](https://couchpota.to) for the ARM architecture. Based on Alpine Linux for small image size.

## Boards Tested
* Raspberry Pi 3
* Asus Tinkerboard

## Usage
You can pull the built image with

```bash
docker pull bradcordeiro/couchpotato-arm32v7
```

The image uses at least two volume mounts, one to a  store CouchPotato's settings and library to persist CouchPotato's settings and library between deployments, and one to a folder of media files.

### Run Script Example

```bash
docker run -dit \
  -v /path/to/settings:/root/.config/NzbDrone \
  -v /path/to/media:/media/Downloads \
  -p 6789:6789
  couchpotato-image-name
```

### Docker-compose example

```yml
version: '3'
services:
  couchpotato:
    image: bradcordeiro/couchpotato-arm32v7
    restart: unless-stopped
    ports: 
      - "5050:5050"
    volumes:
      - /home/path/to/movies:/media/Movies
      - couchpotato_storage:/root/.couchpotato
```