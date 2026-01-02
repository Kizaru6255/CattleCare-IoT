# 🐄 Cow Health & Shed Management System

[![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)](https://flutter.dev/)
[![Firebase](https://img.shields.io/badge/firebase-%23039BE5.svg?style=for-the-badge&logo=firebase)](https://firebase.google.com/)
[![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev/)

A comprehensive, IoT-integrated mobile application designed for modern dairy farming. This app empowers farmers with real-time health monitoring, automated disease diagnosis, and efficient herd management.

---

## 📸 Visual Showcase

### 📱 App Screenshots
<p align="center">
  <img src="assets/demo/WhatsApp Image 2026-01-02 at 9.07.27 PM.jpeg" width="200" />
  <img src="assets/demo/WhatsApp Image 2026-01-02 at 9.07.28 PM.jpeg" width="200" />
  <img src="assets/demo/WhatsApp Image 2026-01-02 at 9.07.28 PM (1).jpeg" width="200" />
</p>
<p align="center">
  <img src="assets/demo/WhatsApp Image 2026-01-02 at 9.07.29 PM.jpeg" width="200" />
  <img src="assets/demo/WhatsApp Image 2026-01-02 at 9.07.29 PM (1).jpeg" width="200" />
  <img src="assets/demo/WhatsApp Image 2026-01-02 at 9.07.30 PM.jpeg" width="200" />
</p>

### 🎥 Demo Videos
<p align="center">
  <video src="assets/demo/demo.mp4" width="320" height="240" controls></video>
  <video src="assets/demo/demo2.mp4" width="320" height="240" controls></video>
</p>

---

## ✨ Key Features

- 🩺 **Disease Diagnosis**: Automated diagnosis for over 70+ common cattle diseases with detailed remedies and prevention steps.
- 📊 **IoT Monitoring**: Real-time tracking of environmental factors like Temperature and Humidity in the shed.
- 🐄 **Cow Profile Management**: Detailed digital records for every animal, including health history and productivity.
- 📦 **Inventory & Expense Tracking**: Manage feed, medicines, and daily farm expenses seamlessly.
- 🔐 **Secure Authentication**: Robust login system powered by Firebase and Google Sign-In.
- 📱 **Modern UI/UX**: Clean, intuitive interface built with Flutter and Bloc for smooth state management.

---

## 🛠️ Tech Stack

- **Frontend**: Flutter (Dart)
- **State Management**: Bloc / Cubit & GetX
- **Backend**: Firebase (Authentication, Firestore, Realtime Database, Storage)
- **Icons & Graphics**: Flutter SVG, Font Awesome
- **Local Storage**: Shared Preferences

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (>=3.1.0)
- Android Studio / VS Code
- Firebase Project Setup

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/cow_1.git
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run the app:
   ```bash
   flutter run
   ```

---

## 📁 Project Structure
```text
lib/
├── application/       # App configuration and themes
├── model/             # Data models (Disease, Cow, etc.)
├── presentation/      # UI Layer
│   ├── ui/
│   │   ├── screen/    # App screens (Profile, Inventory, etc.)
│   │   ├── utility/   # Constants and helper functions
│   │   └── widgets/   # Reusable UI components
└── permissions/       # App permission handling
```

---

## 🤝 Contributing
Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
