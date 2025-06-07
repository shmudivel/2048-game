-- Create table for game scores (leaderboard)
CREATE TABLE game_scores (
    id BIGSERIAL PRIMARY KEY,
    player_name TEXT NOT NULL,
    score INTEGER NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create table for best scores 
CREATE TABLE best_scores (
    id BIGSERIAL PRIMARY KEY,
    player_name TEXT NOT NULL,
    best_score INTEGER NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Add indexes for better performance
CREATE INDEX idx_game_scores_score ON game_scores(score DESC);
CREATE INDEX idx_best_scores_score ON best_scores(best_score DESC);
CREATE INDEX idx_game_scores_created_at ON game_scores(created_at DESC);

-- Enable Row Level Security (RLS)
ALTER TABLE game_scores ENABLE ROW LEVEL SECURITY;
ALTER TABLE best_scores ENABLE ROW LEVEL SECURITY;

-- Create policies to allow public read/write access
CREATE POLICY "Enable read access for all users" ON game_scores FOR SELECT USING (true);
CREATE POLICY "Enable insert access for all users" ON game_scores FOR INSERT WITH CHECK (true);

CREATE POLICY "Enable read access for all users" ON best_scores FOR SELECT USING (true);
CREATE POLICY "Enable insert access for all users" ON best_scores FOR INSERT WITH CHECK (true); 