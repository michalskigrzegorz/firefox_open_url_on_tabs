### Script who start browser - FIREFOX, open websites from list and visit each of them
### Grzegorz Michalski - INVERT8
### grzegorz.michalski@invert8.com

## first - install Firefox browser

## list of websites, you can add as many pages as you like
# on this example I added 4 websites
$url1 = "http://www.invert8.com"
$url2 = "https://www.linkedin.com/in/grzegorzmichalski"
$url3 = "http://www.webpure.pl"
$url4 = "https://github.com/michalskigrzegorz"

## start browser with all of variables / websites addresses
# for example: if you add 7 addresses to the above list, you should add these variables below
[System.Diagnostics.Process]::Start("firefox.exe", "-private $url1 $url2 $url3 $url4")

# sleep timer: script open browser with our addresses and wait - 10 seconds
Start-Sleep -s 10

## loop FOR
# script iterate over the all of addresses on open browser
# if you added n addresses, change the value below to n - 2 (on this example 3 = 4 url)
For ($i=0; $i -le 2; $i++)
{
    # script send keyboard sequence to the browser (CTRL + TAB keys)
    [System.Windows.Forms.SendKeys]::SendWait("^{TAB}") 
    # wait 5 seconds and keep going
    Start-Sleep -s 5
}

## when all of tabs have been opened
# check FIREFOX process
Get-Process | ? { $_.ProcessName -eq 'firefox' }
# stop FIREFOX process
Stop-Process -ProcessName 'firefox'
# check again FIREFOX process
Get-Process | ? { $_.ProcessName -eq 'firefox' }

## HELPER:
# more option for FIREFOX
# https://developer.mozilla.org/en-US/docs/Mozilla/Command_Line_Options