# 20 Получение информации о домене. Работа с DNS

**Команда `nslookup` используется для резолюции DNS-запросов и получения информации о доменном имени.**

```bash
     nslookup [example.com](http://example.com/)
```

Вывод

```bash
   Server:         8.8.8.8
   Address:        8.8.8.8#53

   Non-authoritative answer:
   Name:   example.com
   Address: 93.184.216.34
```

**Команда `dig` (Domain Information Groper) используется для получения детализированной информации о DNS-записях.**

```bash
     dig [example.com](http://example.com/)
```

Вывод

```bash
   ; <<>> DiG 9.11.3-1ubuntu1.11-Ubuntu <<>> example.com
   ;; global options: +cmd
   ;; Got answer:
   ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 55441
   ;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

   ;; ANSWER SECTION:
   example.com.   299 IN A 93.184.216.34

   ;; Query time: 12 msec
   ;; SERVER: 8.8.8.8#53(8.8.8.8)
   ;; WHEN: Tue Mar 10 10:23:54 UTC 2020
   ;; MSG SIZE  rcvd: 54
```

**Команда `host` простая утилита для резолюции DNS-имен.**

```bash
            host example.com
```

Вывод

```bash
       [example.com](http://example.com/) has address 93.184.216.34
```

**Работа с DNS-записями**

**Основные типы DNS-записей:**

**A-запись (Address Record):
    ◦ Разрешает доменное имя в IPv4-адрес.
    ◦ Пример записи: `www IN A 192.0.2.4`.**

**AAAA-запись:
    ◦ Разрешает доменное имя в IPv6-адрес.
    ◦ Пример записи: `www IN AAAA 2001:db8::1`.**

**CNAME-запись (Canonical Name Record):
    ◦ Синоним для доменного имени.
    ◦ Пример записи: `ftp IN CNAME www.example.com.`.**

**MX-запись (Mail Exchange Record):
    ◦ Указывает почтовые серверы для домена.
    ◦ Пример записи: `mail IN MX 10 mail.example.com.`.**

**NS-запись (Name Server Record):
    ◦ Указывает сервера имен для домена.
    ◦ Пример записи: `example.com. IN NS ns1.example.com.`.**

**TXT-запись (Text Record):
    ◦ Хранит текстовую информацию, часто используется для SPF-записей.
    ◦ Пример записи: `example.com. IN TXT "v=spf1 include:_spf.example.com ~all"`.**