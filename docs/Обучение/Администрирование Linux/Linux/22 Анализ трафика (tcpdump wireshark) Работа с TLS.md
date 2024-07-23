# 22 Анализ трафика (tcpdump/wireshark). Работа с TLS

**Анализ трафика необходим для диагностики сетевых проблем, обеспечения безопасности, оптимизации сетевой производительности и других задач. `tcpdump` и `Wireshark` — два самых популярных инструмента для анализа сетевого трафика в Linux.**

**`tcpdump` — это командный инструмент для захвата и анализа сетевых пакетов. Он позволяет просматривать данные, проходящие через сетевой интерфейс.**

**Функции:**

- **Захват трафика на определенном интерфейсе.**
- **Сохранение захваченного трафика в файл для последующего анализа.**
- **Фильтрация трафика по порту или IP-адресу.**
- **Вывод захваченных пакетов в читаемом формате. Фильтры BPF (Berkeley Packet Filter):**
- **Использование фильтров позволяет захватывать только интересующий трафик.**
- **Примеры фильтров: захват всех TCP-пакетов, UDP-пакетов, трафика на определенный порт, трафика от конкретного IP-адреса.**

**Wireshark**

**`Wireshark` — это мощный графический анализатор сетевых протоколов, который позволяет захватывать и анализировать сетевой трафик.**

Установка 

```
sudo apt-get install wireshark  # для систем на базе Debian/Ubuntu
sudo yum install wireshark      # для систем на базе Red Hat/CentOS
```

**Функции:**

- **Захват и визуализация пакетов в реальном времени.**
- **Фильтрация и декодирование протоколов.**
- **Анализ пакетов с использованием графического интерфейса.**
- **Возможность экспорта захваченных данных в различные форматы.Основные шаги работы с Wireshark:**

**Работа с TLS (Transport Layer Security)**

**TLS (Transport Layer Security) — это криптографический протокол, обеспечивающий безопасность передачи данных в сетях. TLS является продолжением SSL (Secure Sockets Layer) и используется для обеспечения конфиденциальности, целостности и аутентичности данных при их передаче.**

**Основные концепции работы с TLS:**

**Шифрование:
    ◦ TLS использует симметричное и асимметричное шифрование для защиты данных.
    ◦ Симметричное шифрование обеспечивает скорость, а асимметричное — безопасность обмена ключами.**

**Криптографические алгоритмы:
    ◦ Используются алгоритмы такие как AES, RSA, ECDSA, SHA для шифрования данных и создания цифровых подписей.**

**Цифровые сертификаты:
    ◦ Сертификаты X.509 используются для аутентификации серверов и клиентов.
    ◦ Сертификат включает публичный ключ и информацию о владельце и эмитенте (CA).**

**Настройка TLS на веб-сервере:**

**`nginx`:
    ◦ Установка и настройка TLS-сертификата с использованием серверного конфигурационного файла.
    ◦ Конфигурация для разрешения защищенных соединений и указания криптографических протоколов и шифров.**

**Установка и настройка TLS-сертификата:**

```
 sudo apt-get install nginx
 sudo apt-get install certbot python3-certbot-nginx  # Для использования Let's Encrypt
 sudo certbot --nginx -d yourdomain.com
```

**Пример конфигурации для nginx:**

```
 server {
     listen 443 ssl;
     server_name yourdomain.com;

     ssl_certificate /etc/letsencrypt/live/yourdomain.com/fullchain.pem;
     ssl_certificate_key /etc/letsencrypt/live/yourdomain.com/privkey.pem;
     ssl_protocols TLSv1.2 TLSv1.3;
     ssl_ciphers HIGH:!aNULL:!MD5;

     location / {
         root /var/www/html;
         index index.html;
     }
 }
```

**`Apache`:
    ◦ Установка и настройка TLS-сертификата аналогично nginx.
    ◦ Конфигурация для разрешения защищенных соединений, управление протоколами и шифрами.**

**Установка и настройка TLS-сертификата:**

```
 sudo apt-get install apache2
 sudo apt-get install certbot python3-certbot-apache  # Для использования Let's Encrypt
 sudo certbot --apache -d yourdomain.com
```

**Пример конфигурации для Apache**

```
 <VirtualHost *:443>
     ServerName yourdomain.com

     SSLEngine on
     SSLCertificateFile /etc/letsencrypt/live/yourdomain.com/fullchain.pem
     SSLCertificateKeyFile /etc/letsencrypt/live/yourdomain.com/privkey.pem
     SSLProtocol all -SSLv3
     SSLCipherSuite HIGH:!aNULL:!MD5

     DocumentRoot /var/www/html
     <Directory /var/www/html>
         Options Indexes FollowSymLinks
         AllowOverride All
         Require all granted
     </Directory>
 </
```