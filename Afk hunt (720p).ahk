#Requires AutoHotkey v2.0

CoordMode("Mouse", "Window")
CoordMode("Pixel", "Window")

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

^+q::ExitApp

fastDelay := 300
slowDelay := 1000

CampaignButtonPositionX := 875
CampaignButtonPositionY := 670

HuntButtonPositionX := 1000
HuntButtonPositionY := 300

StartHuntButtonPositionX := 640
StartHuntButtonPositionY := 570

BackButtonPositionX := 50
BackButtonPositionY := 70

HuntEnterCancellationX := 490
HuntEnterCancellationY := 535

HuntProgressButtonX := 287
HuntProgressButtonY := 526
; Цвет желтой штуки на плашке поиска
HuntProgressButtonColors := [0xFAE49F]

MainWindow := "ahk_id 1049942"

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
    WaitUntilColor(HuntProgressButtonColors, HuntProgressButtonX, HuntProgressButtonY)
    MouseClick("left", HuntEnterCancellationX, HuntEnterCancellationY)
    Sleep(slowDelay)
    WaitUntilColor(HuntProgressButtonColors, HuntProgressButtonX, HuntProgressButtonY)
    Sleep(fastDelay)
 }