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

if (-Not (Get-Command zoxide -ErrorAction SilentlyContinue)) {
  winget install --id=ajeetdsouza.zoxide  -e
}

if (-Not (Get-Command fzf -ErrorAction SilentlyContinue)) {
  winget install --id=junegunn.fzf  -e
}

if (-Not (Get-Command bat -ErrorAction SilentlyContinue)) {
  winget install sharkdp.bat
}

if (-Not (Get-Command rg -ErrorAction SilentlyContinue)) {
  winget install BurntSushi.ripgrep.MSVC
}

if (-Not (Get-Command oh-my-posh -ErrorAction SilentlyContinue)) {
  winget install JanDeDobbeleer.OhMyPosh -s winget
}

if (-Not (Get-Module -ListAvailable -Name PSFzf)) {
    Install-Module -Name PSFzf -Force -Scope CurrentUser
}

# if (-Not (Get-Command lua -ErrorAction SilentlyContinue)) {
#   winget install "lua for windows"
# }

iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force

$CurrentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
$dotarchPath = "$env:USERPROFILE\dotarch"
$nvimPath = "$env:LOCALAPPDATA\nvim"

if (-Not (Test-Path $dotarchPath)) {
  git clone --branch win https://github.com/tribhuwan-kumar/dotarch.git "$env:USERPROFILE\dotarch"
}

if (-Not (Test-Path $nvimPath)) {
    New-Item -ItemType Directory -Path $nvimPath
}

Get-ChildItem -Path $dotarchPath |  Where-Object { $_.Name -ne ".git" -and $_.Name -ne  "accessories" } | ForEach-Object {
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
Set-Alias gcmt Git-Commit
Set-Alias gss Show-GitStatus
Set-Alias c Clear-Screen
Set-Alias vi Open-Nvim
Set-Alias ex Exit-Shell
Set-Alias glg Show-GitLog

Import-Module PSReadLine
Set-PSReadLineOption -EditMode Vi
Set-PSReadLineOption -PredictionSource None

Set-PSReadLineKeyHandler -Key j -Function HistorySearchForward -ViMode Command
Set-PSReadLineKeyHandler -Key k -Function HistorySearchBackward -ViMode Command
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
Invoke-Expression (& { (oh-my-posh --init --shell powershell --config ~/dotarch/accessories/vendetta.omp.json) })
Invoke-Expression (& { (zoxide init --cmd cd powershell | Out-String) })
$env:BAT_THEME = 'gruvbox-dark'
$env:RIPGREP_CONFIG_PATH = "$HOME/dotarch/accessories/.ripgreprc"
$env:FZF_DEFAULT_COMMAND = 'rg --files'
$env:FZF_DEFAULT_OPTS = '
  --color=fg:#bdae93,fg+:#ebdbb2,bg:#0C0D0C,bg+:#292929
  --color=hl:#bdae93,hl+:#ebdbb2,info:#afaf87,marker:#a9b665
  --color=prompt:#ea6962,spinner:#7daea3,pointer:#e78a4e,header:#87afaf
  --color=border:#262626,label:#aeaeae,query:#d9d9d9
  --border-label=""
  --info="right"
  --border="rounded"
  --preview-window="border-rounded"
  --bind "ctrl-y:preview-up,ctrl-e:preview-down"
  --bind "ctrl-b:preview-page-up,ctrl-f:preview-page-down"
  --bind "ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down"
  --bind "shift-up:preview-top,shift-down:preview-bottom"
  --bind "alt-up:half-page-up,alt-down:half-page-down"
  --preview "bat -n --color=always --style=header,grid --line-range :500 {} 2> NUL"'
$env:FZF_CTRL_T_OPTS = '
  --walker-skip .git,node_modules,target,env,__pycache__,.next,dist
  --bind "ctrl-/:change-preview-window(down|hidden|)"'
$env:FZF_CTRL_R_OPTS ='
  --preview "echo {}"
  --preview-window up:3:hidden:wrap
  --bind "ctrl-/:toggle-preview"
  --bind "ctrl-y:execute-silent(echo -n {2..} | Set-Clipboard)+abort"'
$env:FZF_ALT_C_OPTS = '
  --walker-skip .git,node_modules,target,env,__pycache__,.next,dist
  --preview "tree -C {}"'
'@

setx PATH "$($env:PATH);$HOME/dotarch/accessories/bins"
$profilePath = $PROFILE

if (-Not (Test-Path $profilePath)) {
    New-Item -ItemType File -Path $profilePath -Force
}

Set-Content -Path $profilePath -Value $profileContent

# permission
takeown /F "$dotarchPath" /R /D Y
icacls $dotarchPath /grant "`"$CurrentUser`":(OI)(CI)F" /T /Q

