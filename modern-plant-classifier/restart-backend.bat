@echo off
echo 🔄 Restarting Backend...

echo 🛑 Stopping existing backend processes...
taskkill /f /im node.exe 2>nul

echo ⏳ Waiting 2 seconds...
timeout /t 2

echo 🚀 Starting backend...
cd backend
start "Backend" cmd /k "node src/app.js"

echo ✅ Backend restarted!
echo 📡 Backend: http://localhost:3000
echo.
pause
