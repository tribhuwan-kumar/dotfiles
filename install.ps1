Get-WmiObject Win32_Process | Where-Object { $_.CommandLine -like '*nvim*' } | ForEach-Object {
  taskkill.exe /T /F /PID $_.ProcessId; Write-Output
 "process with pid $($_.ProcessId) has been terminated."
}

if (-Not (Get-Command git -ErrorAction SilentlyContinue)) {
    winget install --id Git.Git -e --source winget
}

if (-Not (Get-Command nvim -ErrorAction SilentlyContinue)) {
  winget install --id=Neovim.Neovim  -e
}

if (-Not (Get-Command bun -ErrorAction SilentlyContinue)) {
  powershell -c "irm bun.sh/install.ps1|iex"
}

if (-Not (Get-Command python -ErrorAction SilentlyContinue)) {
  winget install --id=Python.Python.3.12  -e
}

# if (-Not (Get-Command lua -ErrorAction SilentlyContinue)) {
#   winget install "lua for windows"
# }

iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force

$CurrentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
$dotarchPath = "$env:USERPROFILE\Downloads\dotarch"
$nvimPath = "$env:LOCALAPPDATA\nvim"

if (-Not (Test-Path $dotarchPath)) {
  git clone --branch win https://github.com/tribhuwan-kumar/dotarch.git "$env:USERPROFILE\Downloads\dotarch"
}

if (-Not (Test-Path $nvimPath)) {
    New-Item -ItemType Directory -Path $nvimPath
}

Get-ChildItem -Path $dotarchPath |  Where-Object { $_.Name -ne ".git" } | ForEach-Object {
  $linkPath = "$nvimPath\$_"
  if (Test-Path $linkPath) {
    Remove-Item -Path $linkPath -Force
  }
  New-Item -ItemType SymbolicLink -Path $linkPath -Target "$dotarchPath\$_"
}

# profile
$profileContent = @'
function Git-Push {
  git push
}

function Git-Pull {
  git pull
}

function Git-Commit {
  git commit
}

function Show-GitStatus {
  git status
}

function Open-Nvim {
  nvim
}

function Clear-Screen {
  clear
}

function Exit-Shell {
  exit
}

function Show-GitLog {
  git log --graph --abbrev-commit --decorate --format=format:'%C(green)%h%C(reset) - %C(magenta)%aD%C(reset) %C(yellow)(%ar)%C(reset)%C(auto)%d%C(reset)%n''          %C(cyan)%s%C(reset) %C(dim blue)- %an%C(reset)' --all
}

Set-Alias gpp Git-Push
Set-Alias gpl Git-Pull
Set-Alias gcc Git-Commit
Set-Alias gss Show-GitStatus
Set-Alias c Clear-Screen
Set-Alias vi Open-Nvim
Set-Alias ex Exit-Shell
Set-Alias glg Show-GitLog

Import-Module PSReadLine
Set-PSReadLineOption -EditMode Vi

Set-PSReadLineKeyHandler -Key j -Function HistorySearchForward -ViMode Command
Set-PSReadLineKeyHandler -Key k -Function HistorySearchBackward -ViMode Command
'@

$profilePath = $PROFILE

if (-Not (Test-Path $profilePath)) {
    New-Item -ItemType File -Path $profilePath -Force
}

Add-Content -Path $profilePath -Value $profileContent

# permission
takeown /F "$dotarchPath" /R /D Y
icacls $dotarchPath /grant "`"$CurrentUser`":(OI)(CI)F" /T /Q

