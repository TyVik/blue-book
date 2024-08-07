# 18 Мониторинг процессов: top, ps, nice. Каталог /proc

`top` это команда, которая в реальном времени отображает активные процессы в системе. Она предоставляет информацию о процессорном времени, памяти, и других ресурсах, используемых процессами.
**Основные функции:**

- Отображение списка текущих процессов и системной информации.
- Обновление информации в реальном времени.
- Возможность фильтрации и сортировки процессов по различным критериям.

**Ключевые параметры:**

- -d — указывает интервал обновления экрана.
- -p — мониторинг только указанных PID (идентификаторов процессов).

**Интерактивные команды:**

- P — сортировка по использованию процессора.
- M — сортировка по использованию памяти.
- k — завершение процесса по PID.
- r — изменить приоритет (niceness) процесса.

`ps`это команда, которая отображает снимок текущих процессов в системе.
Основные функции:
Показ процесса с различной степенью детализации.
Фильтрация процессов по различным критериям.
Ключевые параметры:

- -e — показать все процессы.
- -f — полная форма отображения.
- -u [username] — показать процессы, принадлежащие пользователю.
- -aux — отображение всех процессов с полным их описанием и потреблением ресурсов.

`nice и renice`
nice для определения приоритета процесса при его запуске, renice изменяет приоритет уже запущенного процесса.
`Основные функции`

- Установка приоритета свой выполняемой команды (от -20 до 19).
- Высокий приоритет соответствует меньшему значению, низкий — большему.

**Каталог /proc**

`/proc` — это виртуальный файловый каталог, который предоставляет информацию о системных и процессных показателях в реальном времени.
Основные особенности:
Виртуальная файловая система, которая существует только в оперативной памяти.
Содержит информацию о текущем состоянии операционной системы.
Основные директории и файлы:

- /proc/cpuinfo — информация о процессоре.
- /proc/meminfo — информация о памяти.
- /proc/[PID] — информация о процессе с указанным PID:
    - /proc/[PID]/cmdline — строка запуска команды.
    - /proc/[PID]/status — статус процесса.
    - /proc/[PID]/fd — открытые файлы процесса.
- /proc/loadavg — информация о средней загрузке системы.