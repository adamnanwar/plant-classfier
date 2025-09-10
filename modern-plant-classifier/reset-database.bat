@echo off
echo 🔄 Resetting Database...

echo 🛑 Stopping backend...
taskkill /f /im node.exe 2>nul

echo ⏳ Waiting 2 seconds...
timeout /t 2

echo 🗑️ Deleting old database...
cd backend
if exist database.sqlite del database.sqlite
if exist uploads rmdir /s /q uploads
mkdir uploads

echo 🚀 Starting backend with fresh database...
start "Backend" cmd /k "node src/app.js"

echo ✅ Database reset complete!
echo 📡 Backend: http://localhost:3000
echo.
pause
