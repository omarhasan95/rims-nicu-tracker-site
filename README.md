# RIMS NICU Tracker Site

Static NICU dashboard prototype for admissions, analytics, reports, and optional Supabase-backed authentication.

## Included

- `index.html` contains the full app
- Demo mode with seeded sample NICU records
- Optional Supabase auth and CRUD setup
- Browser-side charts, CSV/JSON import-export, and print-ready reports

## Quick Start

1. Open `index.html` locally in a browser for demo mode.
2. Deploy the same file to Vercel, Netlify, or GitHub Pages for a static hosting setup.
3. In the app Settings screen, add `SUPABASE_URL` and `SUPABASE_ANON_KEY` if you want live cloud data.

## Supabase Notes

- Create a `nicu_records` table using the schema shown inside the app.
- Enable email authentication in Supabase Auth.
- Add row-level security policies appropriate for your hospital or team.

## Current Scope

This version is intentionally self-contained so the prototype can be reviewed, shared, and deployed quickly.
