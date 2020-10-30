# README

* Ruby version:　2.6.3

* Rails version: 5.2.3

* DB: PostgreSQL 12.3

### docker

```zsh
$ docker-compose exec app /bin/bash

$ docker-compose exec postgres /bash
```

### Import Test Data

```zsh
$ rails runner "CreateTestData.import"
```

### tunnelto起動方法

```zsh
$ tunnelto --port 3000
```
