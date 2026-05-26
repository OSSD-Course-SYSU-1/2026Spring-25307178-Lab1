param(
  [int]$Port = 5731,
  [string]$HostAddress = "0.0.0.0"
)

$ErrorActionPreference = "Stop"
$ProjectDir = Split-Path -Parent $MyInvocation.MyCommand.Path

if (-not (Get-Command node -ErrorAction SilentlyContinue)) {
  throw "未找到 Node.js，请先安装 Node.js 或确认 node 已在 PATH 中。"
}

Set-Location $ProjectDir

Write-Host ""
Write-Host "=== 跨设备无线文件传输：真机演示模式 ==="
Write-Host "1. 电脑和手机/平板连接同一个 Wi-Fi。"
Write-Host "2. 启动后优先使用标记为 recommended 的 LAN 地址。"
Write-Host "3. 如果真机打不开地址，请允许 Windows 防火墙中的 Node.js 入站访问。"
Write-Host ""
Write-Host "按 Ctrl+C 可结束服务。"
Write-Host ""

node server.mjs --host $HostAddress --port $Port
