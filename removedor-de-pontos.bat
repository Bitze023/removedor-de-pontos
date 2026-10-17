@echo off
setlocal

title Removedor de Pontos - Apenas Numeros
mode con: cols=60 lines=12

:LOOP
cls

echo ============================================
echo       REMOVEDOR DE PONTOS
echo ============================================
echo.
echo Cole o texto na area de transferencia.
echo O programa ira manter apenas os numeros.
echo.
echo Pressione CTRL+C para fechar.
echo ============================================
echo.

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
    "$txt = Get-Clipboard -Raw;" ^
    "if ([string]::IsNullOrWhiteSpace($txt)) {" ^
    "    Write-Host 'Erro: Area de transferencia vazia.' -ForegroundColor Red;" ^
    "} else {" ^
    "    $result = $txt -replace '[^0-9]', '';" ^
    "    if ($result.Length -gt 0) {" ^
    "        Set-Clipboard -Value $result;" ^
    "        Write-Host 'Sucesso! Numeros copiados.' -ForegroundColor Cyan;" ^
    "        Write-Host 'Resultado: ' -NoNewline;" ^
    "        Write-Host $result -ForegroundColor Yellow;" ^
    "    } else {" ^
    "        Write-Host 'Erro: Nenhum numero encontrado.' -ForegroundColor Red;" ^
    "    }" ^
    "}"

echo.
echo ============================================
echo Aguardando proxima execucao...
echo ============================================

timeout /t 2 >nul
goto LOOP