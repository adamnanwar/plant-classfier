@echo off
echo 🌱 Starting Plant Disease Classification System
echo.

echo 📡 Starting Backend...
start "Backend" cmd /k "cd backend && node src/app.js"

timeout /t 3

echo 🌐 Starting Frontend...
start "Frontend" cmd /k "cd frontend && npm run dev"

echo.
echo ✅ System is starting up!
echo 📡 Backend: http://localhost:3000
echo 🌐 Frontend: http://localhost:5173
echo.
echo 🔑 Login: admin / admin123
echo.
pause
