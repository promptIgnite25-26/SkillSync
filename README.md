# SkillSync - Job Portal for Students

A comprehensive job portal platform that connects students with employers for internships and job opportunities. Built with Next.js 14, TypeScript, and modern web technologies.

## 🚀 Features

### For Students
- **Profile Management**: Create detailed profiles with education, skills, and experience
- **Resume Upload**: Upload and manage resumes with 2MB file size limit
- **Job Search**: Advanced filtering by job type, location, skills, CGPA, and year
- **Application Tracking**: Track application status and manage cover letters
- **Smart Matching**: AI-powered job matching based on profile and skills

### For Employers
- **Company Profiles**: Showcase company information and culture
- **Job Posting**: Create and manage job postings with detailed requirements
- **Application Management**: Review, filter, and update application status
- **Candidate Profiles**: View detailed student profiles and resumes
- **Analytics**: Track application metrics and job performance

### General Features
- **Role-based Authentication**: Secure access with student, employer, and admin roles
- **Responsive Design**: Mobile-first design with Tailwind CSS
- **File Upload**: Secure resume storage with type and size validation
- **Real-time Updates**: Live status updates and notifications
- **Search & Filtering**: Advanced search capabilities across all data

## 🛠️ Tech Stack

- **Frontend**: Next.js 14 (App Router), TypeScript, Tailwind CSS
- **UI Components**: shadcn/ui with Radix UI primitives
- **Authentication**: NextAuth.js with credentials provider
- **Database**: Prisma ORM with SQLite
- **Validation**: Zod with react-hook-form
- **Styling**: Tailwind CSS with custom design system
- **Icons**: Lucide React

## 📋 Prerequisites

- Node.js 18+ 
- npm or yarn
- Git

## 🚀 Quick Start

### 1. Clone the Repository

```bash
git clone <repository-url>
cd skillsync
```

### 2. Install Dependencies

```bash
npm install
```

### 3. Set Up Environment Variables

Create a `.env.local` file in the root directory:

```env
NEXTAUTH_URL=http://localhost:3000
NEXTAUTH_SECRET=your-secret-key-here
DATABASE_URL="file:./dev.db"
```

### 4. Set Up the Database

```bash
# Generate Prisma client
npx prisma generate

# Run database migrations
npx prisma migrate dev

# Seed the database with sample data
npx prisma db seed
```

### 5. Start the Development Server

```bash
npm run dev
```

The application will be available at `http://localhost:3000`.

## 🗄️ Database Schema

### Core Models

- **User**: Authentication and role management
- **StudentProfile**: Student-specific information and resume data
- **EmployerProfile**: Company information and contact details
- **Job**: Job postings with requirements and application details
- **Application**: Job applications with status tracking

### Key Features

- **File Storage**: Resume files stored as binary data in SQLite
- **JSON Fields**: Skills and year requirements stored as JSON arrays
- **Relationships**: Proper foreign key relationships with cascade deletes
- **Indexing**: Optimized queries with proper database indexes

## 🔐 Authentication & Authorization

### User Roles

1. **STUDENT**: Can create profiles, apply to jobs, track applications
2. **EMPLOYER**: Can post jobs, manage applications, view candidate profiles
3. **ADMIN**: Full system access and management capabilities

### Security Features

- Password hashing with bcryptjs
- JWT-based session management
- Role-based route protection
- File upload validation and sanitization
- Input validation with Zod schemas

## 📁 Project Structure

```
skillsync/
├── app/                    # Next.js App Router pages
│   ├── api/               # API routes
│   ├── dashboard/         # Dashboard page
│   ├── jobs/              # Job listing and detail pages
│   ├── profile/           # Profile management
│   ├── applications/      # Application tracking
│   ├── employer/          # Employer-specific pages
│   └── settings/          # User settings
├── components/            # Reusable UI components
│   └── ui/               # shadcn/ui components
├── lib/                  # Utility functions and configurations
├── prisma/               # Database schema and migrations
├── hooks/                # Custom React hooks
└── middleware.ts         # Next.js middleware for auth
```

## 🎯 API Endpoints

### Authentication
- `POST /api/auth/register` - User registration
- `GET/POST /api/auth/[...nextauth]` - NextAuth endpoints

### Profiles
- `GET/PUT /api/profile/student` - Student profile management
- `GET/PUT /api/profile/employer` - Employer profile management

### File Upload
- `POST /api/upload/resume` - Resume upload (2MB limit)

### Jobs
- `GET /api/jobs` - List jobs with filtering
- `POST /api/jobs` - Create new job (employer only)
- `GET /api/jobs/[id]` - Get job details
- `PUT /api/jobs/[id]` - Update job (employer only)
- `PATCH /api/jobs/[id]/toggle` - Toggle job status

### Applications
- `GET /api/applications` - List applications
- `POST /api/applications` - Submit application (student only)
- `PATCH /api/applications/[id]` - Update application status (employer only)

## 🎨 UI Components

Built with shadcn/ui and includes:

- **Forms**: Input, Textarea, Select, Checkbox components
- **Layout**: Card, Badge, Separator, Progress components
- **Navigation**: Button, Dropdown, Tabs components
- **Feedback**: Toast notifications and loading states
- **Data Display**: Tables, lists, and status indicators

## 🚀 Deployment

### Replit Ready

The project is configured for Replit deployment with:

```json
{
  "scripts": {
    "dev": "next dev -p $PORT",
    "build": "next build", 
    "start": "next start -p $PORT"
  }
}
```

### Environment Variables for Production

```env
NEXTAUTH_URL=https://your-domain.com
NEXTAUTH_SECRET=your-production-secret
DATABASE_URL="file:./prod.db"
```

## 🧪 Demo Accounts

The seed script creates demo accounts for testing:

- **Admin**: `admin@demo.io` / `Admin123!`
- **Employer**: `employer@demo.io` / `Employer123!`
- **Student**: `student@demo.io` / `Student123!`

## 📱 Features Walkthrough

### Student Journey
1. Register as a student
2. Complete profile with education and skills
3. Upload resume (PDF/Word, max 2MB)
4. Browse and filter job opportunities
5. Apply to jobs with cover letters
6. Track application status

### Employer Journey
1. Register as an employer
2. Complete company profile
3. Post job opportunities
4. Review and filter applications
5. Update application status
6. Manage job postings

## 🔧 Development

### Available Scripts

```bash
npm run dev          # Start development server
npm run build        # Build for production
npm run start        # Start production server
npm run lint         # Run ESLint
npm run db:migrate   # Run database migrations
npm run db:seed      # Seed database with sample data
npm run db:studio    # Open Prisma Studio
```

### Database Management

```bash
# Reset database
npx prisma migrate reset

# View database in Prisma Studio
npx prisma studio

# Generate new migration
npx prisma migrate dev --name migration-name
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License.

## 🆘 Support

For support and questions:

1. Check the documentation
2. Review existing issues
3. Create a new issue with detailed information
4. Contact the development team

## 🎉 Acknowledgments

- Next.js team for the amazing framework
- Vercel for hosting and deployment
- shadcn/ui for beautiful components
- Prisma for excellent database tooling
- The open-source community for inspiration

---

**SkillSync** - Connecting students with their dream careers! 🚀
