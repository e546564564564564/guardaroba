# Il mio guardaroba

Webapp personale per catalogare i vestiti (con scontorno automatico), comporre outfit, votarli e farsi consigliare da una consulente AI.
Tutto gratuito: GitHub Pages (sito), Supabase free (login, database, foto), Gemini free tier (consulente), scontorno nel browser.

## Struttura
- `index.html` — l'app
- `config.js` — URL e chiave pubblica di Supabase
- `vendor/bgr.mjs`, `bg/` — scontorno nel browser (@imgly/background-removal, modello "small")
- `setup.sql` — da eseguire una volta in Supabase

## Setup (una volta)
1. Supabase: crea un progetto gratuito, esegui `setup.sql` nel SQL Editor.
2. Authentication > URL Configuration: Site URL = indirizzo GitHub Pages.
3. Copia Project URL e anon key in `config.js`.
4. Primo accesso con la tua email, poi in `config.js` metti `allowSignup: false` e in Supabase disattiva "Allow new users to sign up".
5. In Stile incolla la chiave Gemini (aistudio.google.com/apikey) e importa la scheda stile.
