# 40 Концепции Makefile Работа с docker-контейнерами

**Makefile** — это файл, используемый утилитой **make** для автоматизации процесса сборки программного обеспечения. Makefile содержит набор правил и инструкций, определяющих, как компилировать и связывать исходный код для создания исполняемых файлов или библиотек.

## Концепции:

**Цели**

**Цель** — это то, что вы хотите создать или обновить. Это может быть исполняемый файл, объектный файл или даже другое правило в Makefile.

```makefile
target: dependencies
    command
```

- **target**: Имя цели.
- **dependencies**: Список файлов или других целей, от которых зависит эта цель.
- **command**: Команда (или команды), которые должны быть выполнены для создания или обновления цели.

пример: 

```makefile
app: main.o utils.o
    gcc -o app main.o utils.o
```

**Зависимости (Dependencies)**

Зависимости указывают на файлы, от которых зависит цель. Если один из этих файлов изменяется, цель должна быть пересобрана.

Пример:

```makefile
main.o: main.c utils.h
    gcc -c main.c

utils.o: utils.c utils.h
    gcc -c utils.c
```

**Правила (Rules)**

Правила состоят из цели, зависимостей и команд для выполнения. Они определяют процесс сборки.

Пример полного Makefile:

```makefile
app: main.o utils.o
    gcc -o app main.o utils.o

main.o: main.c utils.h
    gcc -c main.c

utils.o: utils.c utils.h
    gcc -c utils.c

clean:
    rm -f app main.o utils.o
```

**Переменные (Variables)**

Переменные позволяют избежать дублирования кода и упрощают изменение Makefile.

Пример использования переменных:

```makefile
CC = gcc
CFLAGS = -Wall -g

app: main.o utils.o
    $(CC) -o app main.o utils.o $(CFLAGS)

main.o: main.c utils.h
    $(CC) -c main.c $(CFLAGS)

utils.o: utils.c utils.h
    $(CC) -c utils.c $(CFLAGS)

clean:
    rm -f app main.o utils.o
```

**Встроенные правила и макросы**

Make имеет множество встроенных правил и макросов для распространенных задач сборки. Например, можно использовать встроенные правила для компиляции C-файлов без явного указания команд:

Пример: 

```makefile
app: main.o utils.o
    $(CC) $^ -o $@

main.o: main.c 
utils.o: utils.c 
```

Пример сложного мейка: 

```makefile
# Переменные компилятора и флаги компиляции/линковки 
CC = gcc 
CFLAGS = -Wall -g 
LDFLAGS = 

# Списки исходных файлов и объектных файлов 
SRCS = main.c foo.c bar.c 
OBJS = $(SRCS:.c=.o) 

# Основная цель 
app: $(OBJS) 
    $(CC) $(LDFLAGS) -o $@ $^ 

# Правила для объектных файлов 
%.o : %.c 
    $(CC) $(CFLAGS) -c $< 

# Дополнительные цели 
.PHONY : clean all 

all : app 

clean : 
    rm -f *.o app 

# Автоматическое создание зависимостей заголовочных файлов (.d files)
DEPFILES := $(SRCS:.c=.d)
%.d : %.c  
    @set -e; rm -f $@; \
    $(CC) -MM $(CPPFLAGS) $< > $@.$$$$; \
    sed 's,\($*\)\.o[ :]*,\1\.o $@ : ,g' < $@.$$$$ > $@; \
    rm -f $@.$$$$

include $(DEPFILES)
```

## Использование докера с мейк файл

```
├── Dockerfile
├── Makefile
└── src
    └── main.py
```

```docker
# Используем базовый образ Python
FROM python:3.8-slim

# Устанавливаем рабочую директорию в контейнере
WORKDIR /app

# Копируем файлы проекта в рабочую директорию
COPY src/ /app/

# Устанавливаем зависимости (если есть)
RUN pip install --no-cache-dir -r requirements.txt

# Определяем команду по умолчанию для запуска приложения
CMD ["python", "main.py"]
```

```makefile
# Переменные
IMAGE_NAME = my_app_image
CONTAINER_NAME = my_app_container

.PHONY: all build run stop clean logs shell

all: build run

build:
    docker build -t $(IMAGE_NAME) .

run:
    docker run --name $(CONTAINER_NAME) -d $(IMAGE_NAME)

stop:
    docker stop $(CONTAINER_NAME)
    docker rm $(CONTAINER_NAME)

clean: stop
    docker rmi $(IMAGE_NAME)

logs:
    docker logs -f $(CONTAINER_NAME)

shell:
    docker exec -it $(CONTAINER_NAME) /bin/sh

# Дополнительные цели могут быть добавлены по мере необходимости.
```

### Использование Makefile

Для использования этого Make file, просто выполните нужные команды из корневой директории вашего проекта:

Чтобы собрать образ и запустить контейнер:
`make all`

Чтобы остановить и удалить контейнер:

`make stop`

Чтобы очистить все (остановить контейнеры и удалить образы):
`make clean`

Чтобы просмотреть логи:

`make logs`

Чтобы получить доступ к оболочке внутри работающего контейнера:

`make shell`