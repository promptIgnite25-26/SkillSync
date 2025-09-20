#!/bin/bash

echo "🚀 Setting up SkillSync Job Portal..."

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js 18+ first."
    exit 1
fi

# Check Node.js version
NODE_VERSION=$(node -v | cut -d'v' -f2 | cut -d'.' -f1)
if [ "$NODE_VERSION" -lt 18 ]; then
    echo "❌ Node.js version 18+ is required. Current version: $(node -v)"
    exit 1
fi

echo "✅ Node.js version: $(node -v)"

# Install dependencies
echo "📦 Installing dependencies..."
npm install

# Create environment file if it doesn't exist
if [ ! -f .env.local ]; then
    echo "📝 Creating environment file..."
    cat > .env.local << EOF
NEXTAUTH_URL=http://localhost:3000
NEXTAUTH_SECRET=your-secret-key-here-$(openssl rand -hex 32)
DATABASE_URL="file:./dev.db"
EOF
    echo "✅ Environment file created"
else
    echo "✅ Environment file already exists"
fi

# Generate Prisma client
echo "🗄️ Setting up database..."
npx prisma generate

# Run database migrations
echo "🔄 Running database migrations..."
npx prisma migrate dev --name init

# Seed the database
echo "🌱 Seeding database with sample data..."
npx prisma db seed

echo ""
echo "🎉 Setup complete! You can now start the development server:"
echo "   npm run dev"
echo ""
echo "📋 Demo accounts:"
echo "   Admin: admin@demo.io / Admin123!"
echo "   Employer: employer@demo.io / Employer123!"
echo "   Student: student@demo.io / Student123!"
echo ""
echo "🌐 Open http://localhost:3000 in your browser"
