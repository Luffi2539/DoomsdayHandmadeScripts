# DoomsdayHandmadeScripts

Добро пожаловать!
Данные скрипты полностью самопальные и у некоторых заведутся с полпинка а кому то придется попотеть.
Из хороших новостей попотеть придется один раз а не сидеть постоянно что-то делать ручками в игре

Поехали!

# Шаг 1
Скачать программу скрипта на [AuthoHotkey.com](https://www.autohotkey.com/)
Там жмем кнопку Download и выбираем v2
Скачиваем файл и устанавливаем

# Шаг 2 
Прямо тут из репозитория скачиваем файл который Вам удобнее
Жмем на файл он откроется и справа по нажатию на меню будет возможность скачать
![image](https://github.com/user-attachments/assets/eff0d512-f68a-4c59-a021-bac69ee74f24)

# Шаг 3
Помните мы программу скачали в шаге 1 - пришло ее время - ищем и запускаем - вам откроется окошко
и в нем надо запустить Window Spy

<img width="331" alt="image" src="https://github.com/user-attachments/assets/7d108ebe-72b9-460a-a436-f758963894cf">

# Шаг 4
Теперь запускаем нашу игру а также используя блокнот открываем скрипт который вы скачали
Что нам необходимо - нам нужно сказать скрипту в каком окне он будет делать действия. Каждый раз запуская игру ее идентификатор
меняется и это та часть скрипта которую придется каждый раз обновлять (ну если на ночь ставить то раз в неделю - все быстрее чем играть охоту)
Итак - запускаем игру (если запущена не запускаем) и откроется окно игры. Spy которого мы открыли будет бесить потмоу что он поверх всех окон - ему можно
отодвигаем его чтобы было удобно и теперь кликаем на окошко игры и видим что шпиён показывает нам информацию об окне (там будет много слов Doomsday)
Обязательно посмотрите что окно от игры и оттуда нам нужен ahk_id

<img width="477" alt="image" src="https://github.com/user-attachments/assets/4b32c07d-db89-459a-bd99-93e6b3f2e2f0">

Берем эти цифры и пихаем в скрипт вот сюда

<img width="232" alt="image" src="https://github.com/user-attachments/assets/5dd729f1-dbda-41aa-abee-18a640366d40">

Сохраняем файл (Ctrl + S или Файл -> сохранить)

# Шаг 5
Открываем регион (чтобы меню кампании было внизу)
Запускаем скрипт.

В идеале все должно заработать! и теперь скрипт просто будет в афк режиме запускать вам охоту снова и снова

# НЮАНСЫ!!!!

Как я писал в начале поделка полностью кустарная и вам придется ее постоянно подтюнивать и есть еще проблемы,
но как показала практика лучше 5 минут покодить чем 2 дня играть охоту

Выйти из скрипта: Ctrl+Shift+q

1. Менять Айди окна надо будет каждый раз перед запуском скрипта (Шаг 4)
2. Скрипт по сути запускает охоту и ждет появления кнопки "Выход" (той что на розовом фоне)
Если скрипт завис на этом месте жмите комбинацию для выхода скрипта и вам покажется сообщение с цветом который был на кнопке - этот цвет нужно через запятую добавить в HuntFinishedColors (там в файле уже есть 2 цвета)
Потом пересохраняем скрипт выходим на главный экран и стартуем заново

3. Если вы запустили скрипт и курсор бегает по экрану но не происходит вообще ничего (не открывается кампания и охота) - 
Поздравляю вам не повезло с системой. Тут мы не поняли пока в чем проблема, но если такое происходит скорее всего игру надо будет запускать из Steam
Если вы не знаете что такое Steam - идете в гугл пишете "Steam скачать" находите - качаете - заводите там учетку и там у него в магазине будет Doomsday
Качаете его и запускаете прямо через Steam - игра полностью такая же но видимо клиент собирали как то по другому и там пока что не наблюдаолсь проблем что клики идут сквозь окно

Вроде все - если еще что-то всплывет буду пополнять список
Удачи!


