# social_app

A Flutter app that fetches and displays posts from [JSONPlaceholder](https://jsonplaceholder.typicode.com/posts).

---

## Architecture

The app is built with Clean Architecture and a feature-based folder structure, which maps naturally to MVC:

| MVC | This app |
|---|---|
| **Model** | `PostEntity`, `PostModel`, repository layer |
| **View** | `HomeScreen`, `DetailScreen`, `SplashScreen` |
| **Controller** | `PostsNotifier` (Riverpod) |

Organized into three layers:

- **Domain** — pure Dart entities and repository interfaces, zero external dependencies
- **Data** — models with JSON parsing, Dio datasources, and repository implementations
- **Presentation** — UI screens and Riverpod notifiers that sit between the data and the UI

The UI depends only on repository interfaces, never on concrete implementations:
```
View → PostsNotifier (Controller) → Repository Interface → Repository Impl → Datasource → Dio
```

## State Management

Riverpod 3.x without code generation. `PostsNotifier` extends `AsyncNotifier` and acts as the Controller — it fetches data, holds state, and exposes it to the UI. `AsyncValue` handles loading, error, and data states out of the box, with a `refresh()` method to manually re-fetch.

## Navigation

go_router with nested routes. All route paths are centralized in `RouteConstants` to avoid hardcoded strings scattered across the app. The detail screen receives a `PostEntity` via `extra` to avoid re-fetching data already in memory.

## Stack

| Package | Version | Purpose |
|---|---|---|
| `flutter_riverpod` | ^3.2.1 | State management |
| `dio` | ^5.9.0 | HTTP client |<img width="1080" height="2340" alt="Screenshot_20260220_133017" src="https://github.com/user-attachments/assets/12d7b3ce-f8ae-450f-8a06-336d1567550b" />

| `go_router` | ^16.2.0 | Navigation |

## Running the app
```bash
flutter pub get
flutter run
```

## Screenshots

<img width="280" height="600" alt="Screenshot_20260220_133017" src="https://github.com/user-attachments/assets/469ed243-fc3a-44c5-9d50-1d3dc5c87c96" />
<img width="280" height="600" alt="Screenshot_20260220_133625" src="https://github.com/user-attachments/assets/236cb012-3042-4ed1-90a7-beab8853baaf" />
<img width="280" height="600" alt="Screenshot_20260220_133019" src="https://github.com/user-attachments/assets/1530ac11-13ea-4bed-bacd-22515bcd7d27" />
<img width="280" height="600" alt="Screenshot_20260220_133022" src="https://github.com/user-attachments/assets/8b6d3128-8579-4d86-a09e-32daaa3f53db" />
<img width="280" height="600" alt="Screenshot_20260220_133423" src="https://github.com/user-attachments/assets/37ef8d75-b0bf-44f6-b7d8-c586223d06ea" />

