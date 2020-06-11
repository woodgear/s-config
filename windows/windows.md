# choco
```
Get-ExecutionPolicy
Set-ExecutionPolicy AllSigned
Set-ExecutionPolicy Bypass -Scope Process
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```
```bat

choco install emacs -y
choco install 7zip.install -y
choco install manictime -y
choco install beyondcompare -y
choco install jq -y
choco install wireshark -y
choco install cygwin -y
choco install handle -y
choco install lockhunter -y
choco install listary -y
choco install clcl.portable -y
choco install wps-office-free -y
```

```bat
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
```

``` manually
npcap
```


```bat

mklink "C:\Users\developer\.ideavimrc" "Z:\share\init\vim\.ideamvimrc"
# widnows-terminal(uwp) config file
mklink "C:\Users\developer\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" "Z:\share\init\windows\windows-terminal-uwp\settings.json"

# link vscode config according vscode.md
```
# 关闭防病毒

# 关闭ctrl+shift+f

# env path
```bat
HOMEPATH=C:\Users\developer
```
# 解决方案
- everything 搜索
- faststone capture 截图
- vim 映射 autohotkey