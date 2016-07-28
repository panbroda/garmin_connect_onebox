# Garmin Connect Onebox

Garmin connect Onebox for embedding garmin courses and activities.

Example at http://elgin.cc/t/sun-19th-oct-14-spey-moor/77

## Install in Discourse 1.x

```sh
cd /var/discourse
./launcher ssh app
cd /var/www/discourse
rake plugin:install repo='https://github.com/mrloop/garmin_connect_onebox.git'
exit
./launcher restart app
./launcher ssh app
cd /var/www/discourse
rake posts:refresh_oneboxes
```


## To run tests

```sh
ruby -Ilib:test plugin_test.rb
```
