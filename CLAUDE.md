# ACKO UX Writing Quiz

## What this is
A standalone interactive quiz for ACKO product designers. 20 MCQ questions, each showing a phone screen mockup with intentionally flawed copy. The participant picks what's wrong, checks their answer, gets an explanation, and sees a scored results screen at the end.

## File
- `quiz.html` — single self-contained file. All CSS, JS, and question data are inline. No build step.
- `Font/` — Euclid Circular B (Regular, Medium, SemiBold, Bold). Loaded via @font-face with CDN fallback.

## Preview
Use the `quiz` server config (port 4321). Open `http://localhost:4321/quiz.html`.

## Tech
- Pure HTML/CSS/JS, no frameworks
- Phone mockup: 280px wide, 9:16 aspect ratio, dynamic island, signal/wifi/battery status bar, ACKO purple nav bar, home indicator
- Font: Euclid Circular B throughout (UI and inside phone screens)
- ACKO design tokens: `#6841E6` primary, `#0A0A0A`/`#141414`/`#474649`/`#7A7B7D` grey scale, `#E0E0E1` border
- JS syntax note: all double quotes inside JS string literals must be escaped as `\"` — smart/curly quotes will break the script silently

## Quiz structure
- **Intro screen** — title, 20 / ~10 min / 0 tricks stats, Start quiz button
- **Quiz screen** — progress bar, Q badge, phone mockup, question text, 4 option cards (A–D), Check answer button
- **Results screen** — animated SVG score ring, correct/wrong counts, accordion of all 20 Q&As

## Question data (`const questions = [...]`)
Each question object:
```js
{
  mockup: "q01",          // maps to mockupContent(id) switch case
  navTitle: "Claim Status", // phone nav bar title
  question: "...",
  options: ["A", "B", "C", "D"],
  correctIndex: 1,        // 0-based
  explanation: "..."
}
```

## Phone screen mockups (`mockupContent`, `mockupCTA`)
- `mockupContent(id)` — returns HTML string for the phone content area
- `mockupCTA(id)` — returns the CTA bar at the bottom (or empty string)
- `buildMockup(id, navTitle)` — assembles the full phone frame

## Copy rules (ACKO voice)
- No em dashes except maximum 2–3 in the entire quiz (currently: Q8C and Q20C)
- No passive voice, no jargon, no overpromising
- ACKO = "we" / "our" in customer-facing copy
- Sentence case on CTAs and headers
- Be specific about time (not "soon")

## Design system
@.claude/rules/acko-setup.md
