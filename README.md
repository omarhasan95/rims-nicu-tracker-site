# RIMS NICU Tracker Site

Single-file NICU tracking app with:

- Firebase Authentication
- Google Sign-In
- Cloud Firestore live sync
- Flexible patient admission form
- Admin-only settings page
- Excel workbook export for monthly NICU and SNCU reporting

## What Changed

- Demo mode removed
- Demo account removed
- Dummy patient records removed
- Google Sign-In enabled in the UI
- Settings locked to admin users
- Patient admission no longer requires every field at the start
- Death timing and cause detail dropdowns added for reporting consistency
- Excel export now includes:
  - `Patient Records`
  - `Monthly Summary`
  - `Death Detail Reference`

## Data Model

Firestore collections used by the app:

- `settings/app`
- `users/{uid}`
- `records/{recordId}`

## Admin Behavior

- The first signed-in user becomes admin automatically if no admin email is saved yet.
- Admin users can update hospital identity and the admin email list.
- Non-admin users can still create and update patient records.

## Deployment

This is a static HTML app. Deploy `index.html` to Vercel, Firebase Hosting, Netlify, or any static host.

## Important

For true admin protection, apply Firestore security rules that match the app's admin email logic.
