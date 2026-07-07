# Spectre VPN

A Flutter VPN client UI rebuilt as an MVVM + SOLID architecture showcase. Started as a quick UI clone; this repo is the result of pulling business logic out of widgets and rebuilding it as a properly layered, testable app.

> No real VPN tunnel — connecting doesn't actually encrypt anything. The structure (repository interfaces, sealed states, view models) is the seam a real VPN SDK or backend would plug into.

## Features

- Auth — email/password sign up & sign in via Firebase Auth, reactive auth-gated routing
- Countries — browsable list of free/premium VPN server locations
- Connection — connect → connecting → connected → disconnect flow with a live session timer, modeled as a state machine
- Settings — VPN Accelerator, NetShield, Split Tunneling, Kill Switch toggles

## Architecture

Feature-first folders, each split into three layers:

```
lib/
├── core/                     # Cross-feature: theme, shared widgets, utils
└── features/
    └── <feature>/
        ├── domain/            # Entities, abstract repository contracts, sealed states
        ├── data/              # Concrete repository implementations, data sources
        └── presentation/      # View <-> ViewModel <-> Repository (interface)
```

Dependency direction always points inward: views depend on view models, view models depend on repository .interfaces., and only one concrete class per feature knows about a real backend (e.g. `FirebaseAuthRepository` is the only file that imports `firebase_auth`). Swapping a backend means touching one file per feature.

## Tech stack

Riverpod (`StateNotifier` + sealed state classes) · Firebase Auth · `flutter_svg` · Lucide / Phosphor icons · `animated_text_kit`

Uses Firebase Auth, so you'll need your own Firebase project:

## Status

Portfolio/architecture demo, not a shipped product. No real VPN tunneling, no persisted settings (in-memory repository — swapping in `shared_preferences` is a single-file change), no tests checked in beyond the view model examples in `test/`.

