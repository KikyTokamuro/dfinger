# dfinger
Finger client

### Build
```sh
$ dub
```

### Usage
```sh
./dfinger <user>[@<host>] [<port> default 79]
```

### Examples
```sh
$ ./dfinger kikytokamuro@plan.cat
Login: kikytokamuro                     Name: Daniil Archangelsky
Directory: /kikytokamuro               Shell: /bin/plan.cat
Last login Sun Dec 26 12:56:58 2021 UTC
Mail forwarded to kiky.tokamuro@yandex.ru.
No Plan.
```

```sh
$ ./dfinger @plan.cat | head
Login                Name                 Login Time
robs                 Rob Sheldon          Sun 14:00 UTC
kikytokamuro         Daniil Archangelsky  Sun 12:56 UTC
deepak                                    Sun 06:05 UTC
mgdm                 Michael Maclean      Fri 18:09 UTC
sbranch              Simon Branch         Thu 16:29 UTC
interstateone                             Tue 22:53 UTC
crunxxi                                   Tue 22:07 UTC
suizokukan           Xavier Faure         Tue 17:35 UTC
tj                   Tom Jones            Mon 23:23 UTC
```