# choco
```bat
Get-ExecutionPolicy
Set-ExecutionPolicy AllSigned
Set-ExecutionPolicy Bypass -Scope Process
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```
```bat

choco install emacs -y
choco install 7zip.install -y
rem choco install manictime -y
choco install beyondcompare -y
choco install jq -y
choco install wireshark -y
choco install cygwin -y
choco install handle -y
choco install lockhunter -y
choco install listary -y
choco install clcl.portable -y
choco install wps-office-free -y
choco install vscode -y
choco install sublimetext3.powershellalias -y
choco install baretail -y
choco install microsoft-windows-terminal -y
choco install git -y
choco install everything -y
choco install googlechrome -y
choco install autohotkey.portable -y
choco install cmdermini -y
choco install cmake -y
choco install python3 -y
choco install microsoft-windows-terminal -y
choco install sublimetext3.app -y
choco install discord -y
choco install yq -y
```

```bat
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
```

``` manually
npcap
```
# vscode
参照vscode/vscode.md

# link
```bat

mklink "C:\Users\developer\.ideavimrc" "Z:\share\init\vim\.ideamvimrc"
# widnows-terminal(uwp) config file
```
# auto-logon
```ps
$RegPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"
$DefaultUsername = "your username"
$DefaultPassword = "your password"
Set-ItemProperty $RegPath "AutoAdminLogon" -Value "1" -type String 
Set-ItemProperty $RegPath "DefaultUsername" -Value "$DefaultUsername" -type String 
Set-ItemProperty $RegPath "DefaultPassword" -Value "$DefaultPassword" -type String
```
# rust
```
rustup-init.exe --default-host i686-pc-windows-msvc --default-toolchain stable --profile default -v -y
rustup update
```
# set-global-env
```bat
wmic ENVIRONMENT create name="test-env",username="<system>",VariableValue="xxxxx"
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


# ssh
```
mkdir ~/.ssh
vim ~/.ssh/id_rsa.pub
vim ~/.ssh/id_rsa.pub
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa
git config --global core.editor "vim" 
```