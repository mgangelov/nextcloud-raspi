# nextcloud-raspi

** Nextcloud 12 Docker image for Raspberry Pi **

<table border=0>
  <tr>
    <td>
      <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/6/60/Nextcloud_Logo.svg/320px-Nextcloud_Logo.svg.png">
    </td>
    <td>
      <img src="https://www.raspberrypi.org/app/uploads/2012/03/raspberry-pi-logo.png" width="250">
    </td>
  </tr>
</table>

### Important information
* Uses the `armv7/php:7-apache` [official Docker image](https://hub.docker.com/r/arm32v7/php/).
* By default accessible at `http://localhost/nextcloud`.
* By default the data folder is in `nextcloud\data`, it's a good idea to be changed.

### Usage

To build the image when in the directory execute:

`docker build -t *name of image* .`

To spawn the basic default version execute:

`docker run -d --name *name for the container* -p 80:80 *name of image*`

For example, if we want our image to be called `nextcloud` and our container `nextcloud-rpi`, then we do:

`docker build -t nextcloud .`
`docker run -d --name nextcloud-rpi -p 80:80 nextcloud`

*To be continued...*
