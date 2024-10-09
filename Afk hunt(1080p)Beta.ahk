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
; Цвета голубой штуки (между мигающими стрелочками) на плашке подбора
HuntProgressButtonColors := [0x194746, 0x1C4E4D, 0x205655, 0x1C504F, 0x1C4F4D]
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

MainWindow := "ahk_id 131244"

WinActivate(MainWindow)
WinWaitActive(MainWindow)

Sleep(500)

Loop
 {
    MouseClick("left", StartHuntButtonPositionX, StartHuntButtonPositionY)
    Sleep(fastDelay)
    AddColor()
    WaitUntilColor(HuntProgressButtonColors, HuntProgressButtonX, HuntProgressButtonY)
    Sleep(15000)
    MouseClick("left", BackButtonPositionX, BackButtonPositionY)
    Sleep(slowDelay)
    MouseClick("left", CampaignButtonPositionX, CampaignButtonPositionY)
    Sleep(fastDelay)
    MouseClick("left", HuntButtonPositionX, HuntButtonPositionY)
    Sleep(fastDelay)
    AddColor()
    WaitUntilColor(HuntProgressButtonColors, HuntProgressButtonX, HuntProgressButtonY)
    Sleep(slowDelay)
 }