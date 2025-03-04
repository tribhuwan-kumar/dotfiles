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

# takeown /F $nvimPath /R /D Y

