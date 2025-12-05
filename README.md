# OneSport – Live Sports Streaming App
### Watch Live Matches, Browse Leagues, and Get Instant Updates  
### Built with Flutter, Firebase, and REST API

The **OneSport Mobile App** is the primary client application of the OneSport streaming ecosystem.  
It allows users to browse live & upcoming matches, view leagues, and watch streams through a secure integration with the OneSport backend and external player.

---

## 🚀 Tech Stack

- **Flutter (Android / iOS / Web)**
- **Dart 3**
- **Firebase Authentication**
- **REST API (OneSport Backend)**
- **Firebase Cloud Messaging (Notifications)**
- **State Management:** Provider / Riverpod / BLoC (depending on implementation)

---

## ✨ Main Features

### 🏆 Matches & Leagues
- View all **live** and **upcoming** matches  
- Browse matches by **league**, **team**, or **date**  
- Match details screen:
  - Teams
  - Time & league
  - Description
  - Streaming availability

### 🎥 Live Streaming Integration
- Launch the **OneSport External Player** to watch the match  
- Stream delivered using secure **HLS / m3u8** URLs  
- Token-based or authenticated access (depending on backend)

### 👤 User Access
- Firebase Authentication (email/phone/custom token)
- Profile & basic settings
- Manage notifications

### 🔔 Push Notifications
- Match start alerts  
- New match announcements  
- Important system updates

---

## 🧱 Project Structure (Suggested)

```txt
lib/
  core/
    config/
    constants/
    routing/
    services/        # API client + Firebase services
    utils/
  features/
    auth/
    home/
    matches/
    leagues/
    video/
    notifications/
    profile/
  app.dart
  main.dart
