## Клиент

### Файлы

- ~/.ssh/config - настройки подключений к хостам
- ~/.ssh/authorized_keys - список публичных ключей, кому разрешено подключение
- ~/.ssh/known_hosts - отпечатки серверов, куда раньше заходили

Socks proxy:
`ssh user@host -D 1080`

Перенаправление портов:
`ssh -L [bind_address:]port:host:hostport user@host` (`ssh -L 127.0.0.1:5433:host:5432 user@host`)

Добавить ключ на сервер:
`ssh-copy-id -i ~/.ssh/id_ed25519 user@host`

Шаблон конфига подключения:
```
Host prod
    Hostname 10.66.66.1
    Port 22
    IdentityFile ~/.ssh/prod
    IdentitiesOnly yes
```

## Сервер

Файлы в `/etc/ssh/sshd_config.d/*`. Чтобы не было конфликтов при обновлении.

```
PubkeyAuthentication yes
PasswordAuthentication no
PermitRootLogin no
KbdInteractiveAuthentication no
PermitEmptyPasswords no
```