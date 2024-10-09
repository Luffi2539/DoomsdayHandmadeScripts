#Requires AutoHotkey v2.0

CoordMode("Mouse", "Window")
CoordMode("Pixel", "Window")

ExitFunc() {
    Str := ""
    for Index, Value In NewColors {
        Str .= "|" . Value
        Str := LTrim(Str, "|")
    }
    MsgBox(PixelGetColor(ExitHuntButtonX, ExitHuntButtonY), 'Colors I found')
    ExitApp
}

WaitUntilColor(colors, x, y, interval := 1000)
{
    Loop
        {
            Sleep(interval)

            inProgress := false
            
            pixelColor := PixelGetColor(x, y)   

            for index, color in colors { 
                if (pixelColor == color) {
                    inProgress := true
                } 
            }

            if (!inProgress) {
                break
            }
        }
}

WaitUntilNoColor(colors, x, y, interval := 1000)
{
    Loop
        {
            Sleep(interval)

            inProgress := true
            
            pixelColor := PixelGetColor(x, y)   

            for index, color in colors { 
                if (pixelColor == color) {
                    inProgress := false
                } 
            }

            if (!inProgress) {
                break
            }
        }
}

^+q::ExitFunc

fastDelay := 500
slowDelay := 1000

CampaignButtonPositionX := 1309
CampaignButtonPositionY := 1020

HuntButtonPositionX := 1587
HuntButtonPositionY := 589

StartHuntButtonPositionX := 956
StartHuntButtonPositionY := 853

BackButtonPositionX := 74
BackButtonPositionY := 100

HuntEnterCancellationX := 706
HuntEnterCancellationY := 806

HuntProgressButtonX := 1315
HuntProgressButtonY := 534

ExitHuntButtonX := 1244
ExitHuntButtonY := 956
; Цвета голубой штуки (между мигающими стрелочками) на плашке подбора
HuntProgressButtonColors := [0x194746, 0x1C4E4D, 0x205655, 0x1C504F, 0x1C4F4D]
NewColors := []
; Цвета красной кнопки завершения охоты - если охота закончилось а вы все еще на экране с кнопкой выход
; жмите Ctrl+Shift+q и выйдя из скрипта сообщение скажет какой цвет был в пикселе - там стабильность высокая
; скорее всего будет только пара цветов
HuntFinishedColors := [0xD29789, 0xD29788, 0xD29787, 0xD29689, 0xD29688, 0xD29687, 0xD29589, 0xD29588, 0xD29587]

AddColor() {
    newColor := PixelGetColor(HuntProgressButtonX, HuntProgressButtonY) 
    isIn := false
    for index, oldColor in HuntProgressButtonColors {
        if (newColor == oldColor) {
            isIn := true
        }
    }
    if(!isIn) {
        HuntProgressButtonColors.Push(newColor)
        NewColors.Push(newColor)
    }
}

MainWindow := "ahk_id 918514"

WinActivate(MainWindow)
WinWaitActive(MainWindow)

Sleep(500)

Loop
 {
    MouseClick("left", CampaignButtonPositionX, CampaignButtonPositionY)
    Sleep(slowDelay)
    MouseClick("left", HuntButtonPositionX, HuntButtonPositionY)
    Sleep(slowDelay)
    MouseClick("left", StartHuntButtonPositionX, StartHuntButtonPositionY)
    Sleep(fastDelay)
    WaitUntilNoColor(HuntFinishedColors, ExitHuntButtonX, ExitHuntButtonY)
    Sleep(slowDelay)
    MouseClick("left", ExitHuntButtonX, ExitHuntButtonY)
    Sleep(slowDelay)
 }
