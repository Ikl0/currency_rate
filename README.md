# README

## Установка

1. **Клонирование репозитория**

    ```bash
    git clone (https://github.com/Ikl0/currency_rate.git)
    ```

2. **Установка зависимостей**

    ```bash
    bundle install
    yarn install
    ```

## Запуск приложения

1. **Создайте базу данных и проведите миграции**

    ```bash
    rails db:create
    rails db:migrate
    ```

2. **Заполнение базы данных начальными данными**

    ```bash
    rails db:seed
    ```

3. **Запуск сервера Rails**

    ```bash
    rails server
    ```

4. **Запуск Sidekiq**

    Откройте новое окно терминала и запустите Sidekiq:

    ```bash
    bundle exec sidekiq
    ```

После выполнения этих шагов, ваше приложение должно быть доступно по адресу `http://localhost:3000`.

## Полезные команды

- **Просмотр очереди Sidekiq**

    Sidekiq включает веб-интерфейс для просмотра статистики и очередей. Для его запуска выполните:

    ```bash
    bundle exec sidekiq -C config/sidekiq.yml
    ```

    Затем откройте в браузере страницу `http://localhost:3000/sidekiq`.

- **Запуск консоли Rails**

    ```bash
    rails console
    ```

- **Запуск тестов**

    ```bash
    rails test
    ```

Пожалуйста, обратите внимание, что этот README предполагает, что Ruby, Rails, PostgreSQL, Redis и другие необходимые инструменты уже установлены на вашей машине.
