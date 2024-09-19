#Requires AutoHotkey v2.0

CoordMode("Mouse", "Window")
CoordMode("Pixel", "Window")

ExitFunc() {
    Str := ""
    for Index, Value In NewColors {
        Str .= "|" . Value
        Str := LTrim(Str, "|")
    }
    MsgBox(Str, 'Colors I found')
    ExitApp
}


ClickUntilColor(colors, x, y, interval := 50)
{
    Loop
        {
            isRoof := false
            pixelColor := PixelGetColor(x, y)   

            for index, color in colors {  
                if (Abs(pixelColor - color) <= 0)
                {
                    isRoof := true
                }
            }  

            if(isRoof) 
            {
                Sleep(interval)
            } 
                else 
            {
                Sleep(interval)
                MouseClick("left", x, y)
                Sleep(interval)
                Break
            }
        }
}

^+q::ExitFunc

; Сколько солдат ставить на лечение
HealAmount := 250

; MainWindow это мейн которого будем лечить, остальные это фермы (если есть)
MainWindow := "ahk_id 853634"
FarmWindow := "ahk_id 591066"
Farm2Window := "ahk_id 329696"
Farm3Window := "ahk_id 4326614"
Farm4Window := "ahk_id 919334"
Farm5Window := "ahk_id 657392"
Farm6Window := "ahk_id 263940"

StartHealButtonPositionX := 1347
StartHealButtonPositionY := 568

HelpButtonPositionX := 1892
HelpButtonPositionY := 832

AdditionalHelpButtonPositionX := 1784
AdditionalHelpButtonPositionY := 836


; Вот тут придется попотеть
; Для начала надо выйти и зайти в убежище так же как это будет делать скрипт (нажать кнопку убежище 2 раза)
; Это отцентрирует экран и затем надо поставить где то в середине экрана а лучше ближе к низу больничку
; по которой будем кликать
; После того как поставили больничку ищем пиксель для этого запускаем лечение примерно 1500 воинов чтобы было время
; Открываем шпиона и наводим мышкой на кнопку лечения и ищем пиксель в котором можно и на кнопки лечения попасть и на кнопки помощи
; и при этом если нет кнопок то клик не вызывает никаких действий (кликает сквозь крышу)
; Это и будут наши координаты записываем их в переменные ниже
; Цвет надо проверять когда над крышей нет никаких кнопок

; Если вам лень вот это все делать то можете просто скопировать схему моего убежища 
; (у меня больница стоит одна пооддаль вот в ней я пиксель и нажимаю)

RoofX := 1351
RoofY := 568

RoofColor := [0x706E70, 0x7D7570, 0x7C746F, 0x7D7470, 0x7F7672, 0x7C736F, 0x7F7671, 0x79726D, 0x79716D, 0x7A726E]
NewColors := []

AddColor() {
    newColor := PixelGetColor(RoofX, RoofY) 
    isIn := false
    for index, oldColor in RoofColor {
        if (newColor == oldColor) {
            isIn := true
        }
    }
    if(!isIn) {
        RoofColor.Push(newColor)
        NewColors.Push(newColor)
    }
}

fastDelay := 300
slowDelay := 500

; Заходим в мейна и центрируем экран
WinActivate(MainWindow)
WinWaitActive(MainWindow)

Sleep(500)
MouseClick("left", 122, 1030)
Sleep(500)
MouseClick("left", 122, 1030)
Sleep(500)

; Проверяем для начала цвета чтобы если что вкинуть новые. Как и в случае с охотой
; Для этого надо раскомментировать нижние 2 строчки (убрать точки с запятой) и поставить 0 возле Loop
; ClickUntilColor(RoofColor, RoofX, RoofY, slowDelay)
; MsgBox('Roof is not here boss', PixelGetColor(RoofX, RoofY))


Loop 
 {
    ; Основной скрипт который нажимает старт лечения выбирает сколько лечить - запускает лечение
    MouseClick("left", StartHealButtonPositionX, StartHealButtonPositionY)
    Sleep(fastDelay)
    MouseClick("left", 1802, 751)
    Sleep(fastDelay)
    MouseClick("left", 1628, 356)
    Sleep(fastDelay)    
    Send("^a")
    Sleep(fastDelay)
    Send(HealAmount)
    Sleep(fastDelay)
    MouseClick("left", 1551, 967)
    Sleep(1000)

    ; Нажимает ручку на мейне
    ; Тут внимательно - по утрам есть ящик который на время тикает и ручка появляется левее.
    ; Если есть ящик то нудно поменять HelpButtonPosition на AdditionalButtonPosition обе координаты)
    ; Дальше видно что у ботов всегда жмется доп кнопка потмоу что там ящики я не собираю
    MouseClick("left", RoofX, RoofY)
    Sleep(fastDelay)
    ; MouseClick("left", HelpButtonPositionX, HelpButtonPositionY)
    Sleep(fastDelay)
    AddColor()

    ; Ниже идут одинаковые блоки - переход на окно фермы и прожатие ручки
    ; Тут смотрите сами - если ферм больше то блок в 5 строчек позволит по аналогии добавить еще фермы
    ; Если ферм меньше нужно удалять блоки

    ; WinActivate(FarmWindow)
    ; WinWaitActive(FarmWindow)
    ; Sleep(fastDelay)
    ; MouseClick("left", HelpButtonPositionX, HelpButtonPositionY)
    ; Sleep(fastDelay)
    
    ; WinActivate(Farm2Window)
    ; WinWaitActive(Farm2Window)
    ; Sleep(fastDelay)
    ; MouseClick("left", AdditionalHelpButtonPositionX, AdditionalHelpButtonPositionY)
    ; Sleep(fastDelay)
    
    ; WinActivate(Farm3Window)
    ; WinWaitActive(Farm3Window)
    ; Sleep(fastDelay)
    ; MouseClick("left", AdditionalHelpButtonPositionX, AdditionalHelpButtonPositionY)
    ; Sleep(fastDelay)
    
    ; WinActivate(Farm4Window)
    ; WinWaitActive(Farm4Window)
    ; Sleep(fastDelay)
    ; MouseClick("left", AdditionalHelpButtonPositionX, AdditionalHelpButtonPositionY)
    ; Sleep(fastDelay)


    ; WinActivate(Farm5Window)
    ; WinWaitActive(Farm5Window)
    ; Sleep(fastDelay)
    ; MouseClick("left", AdditionalHelpButtonPositionX, AdditionalHelpButtonPositionY)
    ; Sleep(fastDelay)
    
    ; WinActivate(Farm6Window)
    ; WinWaitActive(Farm6Window)
    ; Sleep(fastDelay)
    ; MouseClick("left", AdditionalHelpButtonPositionX, AdditionalHelpButtonPositionY)
    ; Sleep(fastDelay)

    ; ; После того как фермы кончились идем назад на главное окно и ждем пока все долечится
    ; WinActivate(MainWindow)
    ; WinWaitActive(MainWindow)
    Sleep(fastDelay)
    ClickUntilColor(RoofColor, RoofX, RoofY, slowDelay)
    Sleep(fastDelay)
 }
