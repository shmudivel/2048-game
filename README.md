# 🎮 2048 Game with Global Leaderboard

A classic 2048 game with **worldwide leaderboard** powered by Supabase database. Play from any device and compete with players around the globe!

## 🚀 Quick Start

### Option 1: Play Online (GitHub Pages)
🎯 **[Play the game here](https://your-username.github.io/your-repo-name)** - No setup required!

### Option 2: Local Development

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/your-repo-name.git
   cd your-repo-name
   ```

2. **Set up environment variables**
   ```bash
   cp .env.example .env
   # Edit .env with your Supabase credentials
   ```

3. **Open the game**
   ```bash
   open index.html
   ```

## 🛠️ Full Setup (For Developers)

### 1. Create Supabase Project
1. Go to [supabase.com](https://supabase.com) and create a free account
2. Create a new project and wait for it to be ready
3. Note your **Project URL** and **anon public key** from Settings → API

### 2. Set up Database Tables
1. In your Supabase dashboard, go to **SQL Editor**
2. Copy and paste the contents of `supabase-setup.sql`
3. Click **Run** to create the required tables

### 3. Configure Environment Variables

**For Local Development:**
1. Create `.env` file in the project root:
   ```env
   SUPABASE_URL=https://your-project-ref.supabase.co
   SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
   ```

**For GitHub Pages Deployment:**
1. Go to your GitHub repository **Settings** → **Secrets and variables** → **Actions**
2. Add these repository secrets:
   - `SUPABASE_URL`: Your Supabase project URL
   - `SUPABASE_ANON_KEY`: Your Supabase anon public key

### 4. Deploy to GitHub Pages
1. Enable GitHub Pages in repository **Settings** → **Pages**
2. Set source to "GitHub Actions"
3. Push to main branch - the GitHub Action will automatically deploy

### 5. Test the Game
1. Open the deployed game or `index.html` locally
2. Enter a player name and play
3. Check that scores appear in the global leaderboard
4. Verify in Supabase dashboard that data is being saved

## 🎯 Features

- ✅ **Global Leaderboard**: Top 10 scores from players worldwide
- ✅ **Real-time Database**: Powered by Supabase PostgreSQL
- ✅ **Secure Deployment**: Environment variables via GitHub Secrets
- ✅ **Cross-device Play**: Works on mobile, tablet, and desktop
- ✅ **Offline Fallback**: localStorage backup when database unavailable
- ✅ **Player Identity**: Custom names on the global leaderboard

## 🔒 Security Features

- 🔐 **Environment Variables**: API keys stored securely in `.env` and GitHub Secrets
- 🛡️ **Row Level Security**: Supabase RLS policies protect the database
- 🚫 **No Hardcoded Keys**: Credentials injected during build process
- 📝 **Git Ignored**: `.env` file automatically excluded from version control

## 🛠️ Troubleshooting

**Deployment Issues:**
- Ensure GitHub Secrets are set correctly in repository settings
- Check GitHub Actions logs for deployment errors
- Verify Supabase project is active and accessible

**Scores not saving?**
- Check browser console (F12) for errors
- Verify Supabase URL and API key are correct
- Ensure database tables exist (run `supabase-setup.sql`)
- Check Row Level Security policies allow public inserts

**Leaderboard not loading?**
- Check network connection and CORS settings
- Verify Supabase project is publicly accessible
- Test API endpoints in Supabase dashboard

## 📊 Database Schema

### `game_scores` table:
```sql
CREATE TABLE game_scores (
  id SERIAL PRIMARY KEY,
  player_name TEXT NOT NULL,
  score INTEGER NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
```

### `best_scores` table:
```sql
CREATE TABLE best_scores (
  id SERIAL PRIMARY KEY,
  player_name TEXT NOT NULL,
  best_score INTEGER NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
```

## 🔧 File Structure

```
├── .env                    # Environment variables (git ignored)
├── .env.example           # Template for environment variables
├── .gitignore             # Git ignore rules
├── .github/
│   └── workflows/
│       └── deploy.yml     # GitHub Actions deployment
├── index.html             # Main game file
├── supabase-setup.sql     # Database setup script
└── README.md              # This file
```

## 🚀 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is open source and available under the [MIT License](LICENSE). 