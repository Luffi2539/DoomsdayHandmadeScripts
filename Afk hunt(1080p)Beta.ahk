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

^+q::ExitFunc

fastDelay := 300
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

HuntProgressButtonX := 429
HuntProgressButtonY := 790
; Цвет желтой штуки на плашке поиска
HuntProgressButtonColors := [0xFDEBA7]
NewColors := []

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

MainWindow := "ahk_id 263142"

WinActivate(MainWindow)
WinWaitActive(MainWindow)

Sleep(500)

; MsgBox(PixelGetColor(HuntProgressButtonX, HuntProgressButtonY))

Loop
 {
    MouseClick("left", CampaignButtonPositionX, CampaignButtonPositionY)
    Sleep(fastDelay)
    MouseClick("left", HuntButtonPositionX, HuntButtonPositionY)
    Sleep(fastDelay)
    MouseClick("left", StartHuntButtonPositionX, StartHuntButtonPositionY)
    Sleep(fastDelay)
    MouseClick("left", BackButtonPositionX, BackButtonPositionY)
    Sleep(fastDelay)
    MouseClick("left", BackButtonPositionX, BackButtonPositionY)
    Sleep(slowDelay)
    AddColor()
    Sleep(fastDelay)
    WaitUntilColor(HuntProgressButtonColors, HuntProgressButtonX, HuntProgressButtonY)
    MouseClick("left", HuntEnterCancellationX, HuntEnterCancellationY)
    Sleep(slowDelay)
    WaitUntilColor(HuntProgressButtonColors, HuntProgressButtonX, HuntProgressButtonY)
    Sleep(fastDelay)
 }