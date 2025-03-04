if (-Not (Get-Command git -ErrorAction SilentlyContinue)) {
    winget install --id Git.Git -e --source winget
}

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
Get-ChildItem -Path $dotarchPath | ForEach-Object {
    New-Item -ItemType SymbolicLink -Path "$nvimPath\$_" -Target "$dotarchPath\$_"
}

if (-Not (Get-Command bun -ErrorAction SilentlyContinue)) {
  powershell -c "irm bun.sh/install.ps1|iex"
}

# takeown /F $nvimPath /R /D Y

