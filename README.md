# Emmans Reading Room — UB E-Library AI

Integrated **web + Android** digital library for IPT102. HTML, CSS, Java, a shared Java backend, 220 public-domain books, and **Gizmo**, an embedded agentic assistant.

## Run the website and API (Windows)

```powershell
powershell -ExecutionPolicy Bypass -File .\run.ps1
```

Then open [http://localhost:8080](http://localhost:8080).

### Accounts

| Role | Username | Password | Downloads |
| --- | --- | --- | --- |
| Admin | `admin` | `Admin@Lumina2026` | 10 |
| Demo user | `demo` | `Demo@123` | 10 |
| Guest | Guest Mode button | — | 5 per session |

## What to demo (Phase 2 / Phase 3)

1. Catalog search by title, author, and category.
2. Guest download of a Gutenberg EPUB; sixth unique download is blocked.
3. Register, login, logout; My Library and favorites.
4. Gizmo chat: `Compare Dracula and Frankenstein` (two+ tool calls on live data).
5. `Save Pride and Prejudice` → reply `yes` (confirmation before save).
6. Admin dashboard at `/admin.html`.

## Android

Open `android/` in Android Studio and run on an emulator. Default API: `http://10.0.2.2:8080`. On a physical phone, change the URL to your PC's LAN address.

## Docker

```bash
docker compose up --build
```

## Legal note

Book files are **not** copied from Z-Library. Every download URL points to [Project Gutenberg](https://www.gutenberg.org/), which is a legally authorized public-domain source.

Full write-up: [docs/TECHNICAL_DOCUMENTATION.md](docs/TECHNICAL_DOCUMENTATION.md)
