# nextcloud-raspi

** Nextcloud 12 Docker image for Raspberry Pi **

*Made using [this](http://unixetc.co.uk/2016/11/20/simple-nextcloud-installation-on-raspberry-pi/) very helpful guide.*

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
`docker run -d --name nextcloud-rpi -p 80:80 --restart unless-stopped nextcloud`
* `-d` option runs the container detached.
* `--name nextcloud-rpi` sets the container name to nextcloud-rpi.
* `-p 80:80` publishes port 80 of the container to port 80 of the host.
* `--restart unless-stopped` sets the restart policy of the container to be "Always running, unless explicitly stopped".

### Change default data directory

By default all files are stored in the directory `/var/www/html/nextcloud/data` on the created Docker container. It's a good idea (almost necessary if you want any certainty that the files would be preserved in case some error in the container) change the default location for the files. That way persistence is achieved in case you want to reload the container, etc.

There are 2 ways to do that:
* *(My preferred way, since it's easier)*  Bind mount a directory from the host (the system running Docker) to the container and all files to be stored there. This is done by adding `-v *host_dir*:*dir_in_container` to the command which spawns the container. So if the host directory is `/host/dir/data/` and it is to be mounted to the location `/container/dir/data/` the spawn command becomes:

  `docker run -d --name nextcloud-rpi -p 80:80 --restart unless-stopped -v /host/dir/data/:/container/dir/data/ nextcloud`

  When starting Nextcloud for the first time and setting username and password there is an option to set the data folder. Modify this setting to point to the location of the mounted folder on the container (i.e., "/container/dir/data/").

* The data folder can be changed after initialising the Nextcloud instance (after setting username and passwd and the application expanding its files within the container). It involves modifying config files and the sqlite database, I haven't tried it yet. A guide how to do it can be seen [here](http://unixetc.co.uk/2016/11/20/simple-nextcloud-installation-on-raspberry-pi/).

*To be continued...*
