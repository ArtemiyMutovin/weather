Для работы запросов нужно инициализоровать Rails.application.credentials.api_key


API для статистики по погоде
Источник https://developer.accuweather.com/apis.

Необходимые эндпоинты:

/weather/current - Текущая температура
/weather/historical - Почасовая температура за последние 24 часа (https://developer.accuweather.com/accuweather-current-conditions-api/apis/get/currentconditions/v1/{locationKey}/historical/24)
/weather/historical/max - Максимальная темперетура за 24 часа
/weather/historical/min - Минимальная темперетура за 24 часа
/weather/historical/avg - Средняя темперетура за 24 часа
/weather/by_time - Ближайшая температура к переданному timestamp (например 1621823790 должен отдать температуру за 2021-05-24 08:00. Из имеющихся данных, если такого времени нет вернуть 404)
/health - статус бэкэнда
