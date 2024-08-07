# 46 Мониторинг процессов: top, ps, nice. Каталог /proc

## 46. Мониторинг процессов: top, ps, nice. Каталог /proc

- **top**: команда `top` в Linux дает динамическое представление о состоянии системы. Она обеспечивает текущую информацию о центральном процессоре, памяти, загрузке и других параметрах системы в режиме реального времени.
- **ps:** команда `ps` позволяет просмотреть информацию о текущих процессах системы в статическом виде.
- **nice:** команда `nice` позволяет изменить приоритет запускаемого процесса. Приоритет определяется числом от -20 до 19, где -20 - наивысший приоритет, а 19 - наинизший. Пример использования: `nice -n 19 command`. С помощью команды `renice` можно изменять приоритет уже запущенных процессов.

Каталог `/proc` является виртуальной файловой системой, предоставляющей динамический информационный вывод о текущем состоянии системы и ее процессах.

- Каталог `/proc` включает директории с числовыми именами, соответствующими идентификаторам процессов (PID). В каждой из этих директорий есть файлы и подкаталоги с информацией о соответствующем процессе.
- В файле `/proc/meminfo` можно получить информацию о памяти системы.
- Файл `/proc/cpuinfo` содержит подробную информацию о процессорах системы.
- В `/proc/version` хранится информация о версии ядра и компилятора.

Каталог `/proc` обрабатывается ядром и системой и не хранит информацию на диске, поэтому его размер всегда равен 0. Эта файловая система очень важна для системного анализа и отладки.

---