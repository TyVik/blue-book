# Безопасность Linux

Пометка: тут крайне мало информации, рекомендуется почитать урок “Настройка сети”

`apt update && apt dist-upgrade` - команда, которая проверяет ОС и пакеты на наличие обновлений

`TCP-wrapper` использует следующие файлы конфигурации:

- `/etc/hosts.allow` - указывает, каким службам и хостам разрешён доступ к системе
    
    Пример файла:
    
    ```bash
    # Allow access to SSH from the local network
    sshd : 10.129.14.0/24
    
    # Allow access to FTP from a specific host
    ftpd : 10.129.14.10
    
    # Allow access to Telnet from any host in the inlanefreight.local domain
    telnetd : .inlanefreight.local
    ```
    
- `/etc/hosts.deny` - указывает, к каким службам и хостам запрещён доступ
    
    Пример файла:
    
    ```bash
    # Deny access to all services from any host in the inlanefreight.com domain
    ALL : .inlanefreight.com
    
    # Deny access to SSH from a specific host
    sshd : 10.129.22.22
    
    # Deny access to FTP from hosts with IP addresses in the range of 10.129.22.0 to 10.129.22.255
    ftpd : 10.129.22.0/24
    ```