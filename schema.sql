-- ACKO UX Writing Quiz — Supabase Setup
-- Run this entire file in: Supabase Dashboard → SQL Editor → New Query → Run

-- 1. Create the participants table
CREATE TABLE IF NOT EXISTS participants (
  id           UUID        PRIMARY KEY DEFAULT gen_random_uuid(),
  name         TEXT        NOT NULL,
  score        INTEGER     NOT NULL DEFAULT 0,
  answers_count INTEGER    NOT NULL DEFAULT 0,
  completed    BOOLEAN     NOT NULL DEFAULT FALSE,
  created_at   TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- 2. Enable Row Level Security (required for Supabase)
ALTER TABLE participants ENABLE ROW LEVEL SECURITY;

-- 3. Open policies — anyone can read, insert, and update (no login required)
CREATE POLICY "Public read"   ON participants FOR SELECT USING (true);
CREATE POLICY "Public insert" ON participants FOR INSERT WITH CHECK (true);
CREATE POLICY "Public update" ON participants FOR UPDATE USING (true);

-- 4. Enable Realtime for live leaderboard updates
ALTER PUBLICATION supabase_realtime ADD TABLE participants;
