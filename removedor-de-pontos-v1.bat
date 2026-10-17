@echo off
setlocal
title Numeros Extrair v2.0
mode con: cols=60 lines=10

echo ============================================
echo      Limpador de Texto: Apenas Numeros
echo ============================================

:: Execução do PowerShell otimizada
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
    "$txt = Get-Clipboard -Raw;" ^
    "if ([string]::IsNullOrWhiteSpace($txt)) {" ^
    "    Write-Host 'Erro: Area de transferencia vazia.' -ForegroundColor Red;" ^
    "    exit 1;" ^
    "}" ^
    "$result = $txt -replace '[^0-9]', '';" ^
    "if ($result.Length -gt 0) {" ^
    "    Set-Clipboard -Value $result;" ^
    "    Write-Host 'Sucesso! Numeros copiados.' -ForegroundColor Cyan;" ^
    "    Write-Host 'Resultado: ' -NoNewline; Write-Host $result -ForegroundColor Yellow;" ^
    "} else {" ^
    "    Write-Host 'Erro: Nenhum numero encontrado.' -ForegroundColor Red;" ^
    "    exit 1;" ^
    "}"

if %errorlevel% neq 0 (
    echo.
    pause
) else (
    timeout /t 2 >nul
)