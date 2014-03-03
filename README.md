app
===

Minimal template for Cuba applications.

Installation
------------

Execute:

```
$ git clone git@github.com:frodsan/app.git <app_name>
$ cd <app_name>
$ make setup
```

`make setup` creates the `env.sh` file with the configurations required by
the application, and install some basic tools ([gs][gs], [dep][dep] and
[shotgun][shotgun]).

[gs]: https://github.com/soveran/gs
[dep]: https://github.com/cyx/gs
[shotgun]: https://github.com/rtomayko/shotgun
