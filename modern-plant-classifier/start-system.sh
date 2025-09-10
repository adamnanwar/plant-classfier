#!/bin/bash

echo "🌱 Starting Plant Disease Classification System"
echo ""

echo "📡 Starting Backend..."
cd backend
node src/app.js &
BACKEND_PID=$!

sleep 3

echo "🌐 Starting Frontend..."
cd ../frontend
npm run dev &
FRONTEND_PID=$!

echo ""
echo "✅ System is starting up!"
echo "📡 Backend: http://localhost:3000"
echo "🌐 Frontend: http://localhost:5173"
echo ""
echo "🔑 Login: admin / admin123"
echo ""
echo "Press Ctrl+C to stop both services"

# Wait for both processes
wait $BACKEND_PID $FRONTEND_PID
