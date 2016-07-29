[![Build Status](https://travis-ci.org/mrloop/garmin_connect_onebox.svg?branch=master)](https://travis-ci.org/mrloop/garmin_connect_onebox)

# Garmin Connect Onebox

[Garmin Connect](https://connect.garmin.com) [Onebox](https://github.com/discourse/onebox) for embedding garmin courses and activities in [Discourse](discourse.org)

Course example at http://elgin.cc/t/sun-19th-oct-14-spey-moor/77

### Supported URLs for embeds

 - http(s)://connect.garmin.com/course/ID
 - http(s)://connect.garmin.com/course/embed/ID
 - http(s)://connect.garmin.com/modern/course/ID
 - http(s)://connect.garmin.com/modern/activity/ID
 - http(s)://connect.garmin.com/modern/embed/ID

## Installation

```yml

    hooks:
      after_code:
        - exec:
            cd: $home/plugins
            cmd:
              - mkdir -p plugins
              - git clone https://github.com/discourse/docker_manager.git
              - git clone https://github.com/mrloop/garmin_connect_onebox.git

```

* Rebuild the container and restart the application

```sh

    cd /var/docker
    ./launcher rebuild app
    ./launcher restart app

```

### Update existing posts

```sh

    ./launcher ssh app
    cd /var/www/discourse
    rake posts:refresh_oneboxes

```

## To run tests

```sh

    ruby -Ilib:test plugin_test.rb

```
