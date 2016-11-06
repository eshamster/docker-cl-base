# Dockerfile: cl-base

A Dockerfile to configure Common Lisp execution environment.

## Installation

```bash
$ docker pull eshamster/cl-base
$ docker run -v <a host folder>:/home/dev/work/lisp -it eshamster/cl-base /bin/bash
```

Note: `/home/dev/work/lisp` is a sym-link to `/home/dev/.roswell/local-projects`

## Description

This mainly consists of ...

- CentOS 7.0
- Roswell
  - The following CL implementations are installed in default
    - sbcl-bin

---------

## Author

eshamster (hamgoostar@gmail.com)

## Copyright

Copyright (c) 2016 eshamster (hamgoostar@gmail.com)

## License

Distributed under the MIT License
