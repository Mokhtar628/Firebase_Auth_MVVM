# Firebase Auth MVVM

This Firebase Auth app is built using **MVVM architecture**, **Firebase Authentication**, and **State Management** techniques. The project emphasizes **scalable** and **maintainable code** while ensuring a smooth user experience through a clean and structured design.

---

## 📝 Table of Contents

1. [Introduction](#-introduction)
2. [Features](#-features)
3. [Installation](#-installation)
4. [Usage](#-usage)
5. [Design Decisions](#-design-decisions)
6. [Challenges Faced](#-challenges-faced)
7. [Extra Features](#-extra-features)
8. [Contributing](#-contributing)
9. [License](#-license)
10. [Acknowledgments](#-acknowledgments)

---

## 🚀 Introduction

This app demonstrates the use of **MVVM architecture** and **Firebase Authentication** in a Flutter mobile application. It showcases how to manage state effectively and organize code for scalability and maintainability. The app features user registration, login, and authentication using Firebase, along with smooth animations for a better user experience.

---

## 🎯 Features

- **MVVM Architecture**: Organizes the code into distinct layers (Model, View, ViewModel) for better scalability and maintainability.
- **Firebase Authentication**: Handles user sign-up, login, and authentication with Firebase.
- **State Management**: Efficiently manages the app's state using the **Provider** pattern.
- **Smooth Animations**: Added delightful animations like confetti on success 🎉.
- **Clean UI**: Modern and user-friendly interface based on a Figma design.
- **Form Validation**: Validates user input for registration and login forms.

---

## 🛠️ Installation

Follow these steps to get the app up and running locally:

1. Clone this repository:

    ```bash
    git clone https://github.com/Mokhtar628/Firebase_Auth_MVVM.git
    ```

2. Navigate to the project folder:

    ```bash
    cd Firebase_Auth_MVVM
    ```

3. Install dependencies:

    ```bash
    flutter pub get
    ```

4. Set up Firebase:
   - Go to [Firebase Console](https://console.firebase.google.com/).
   - Create a new Firebase project.
   - Download the `google-services.json` (for Android) and `GoogleService-Info.plist` (for iOS).
   - Place the `google-services.json` file in `android/app/` and `GoogleService-Info.plist` in `ios/Runner/`.

5. Run the app:

    ```bash
    flutter run
    ```



---

## 🧑‍💻 Usage

1. Launch the app on your emulator, simulator, or physical device.
2. Perform basic authentication tasks like signing up and logging in.
3. Upon successful login or registration, a confetti animation will play 🎉.

---

## 💡 Design Decisions

- **MVVM Architecture**: The app is structured with clear separations between UI (View), business logic (ViewModel), and data management (Model).
  

- **State Management**: The app utilizes the **Provider** pattern for effective state management across all layers, making it easier to handle UI changes and business logic.

- **Firebase Authentication**: Firebase is used to handle user authentication securely and efficiently, with built-in methods for login and sign-up.

- **Animations**: Custom animations are used to enhance the user experience, including a confetti animation upon successful login or registration.

---

## 🚧 Challenges Faced

1. **Animate the falling celebration scraps on signup success**: Implementing a responsive and user-friendly design with smooth animations.

---

## ✨ Extra Features

- **Confetti Animation**: Custom confetti effect on successful user login or registration for a joyful user experience.
- **Error Handling**: Clear error messages are displayed for invalid inputs and Firebase authentication issues.
- **Responsive UI**: The UI is designed to work seamlessly across different screen sizes and orientations.

---

## 👨‍💻 Contributing

Contributions are welcome! If you’d like to contribute to this project:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-name`).
3. Make changes and commit them (`git commit -am 'Added new feature'`).
4. Push to the branch (`git push origin feature-name`).
5. Submit a pull request.

---

## 🎉 Acknowledgments

- **Flutter**: For enabling quick, cross-platform mobile development.
- **Firebase**: For providing an easy-to-use backend service for authentication.
- **Provider**: For efficient and scalable state management.
- **Confetti**: For adding fun, smooth animations to the app.
- **Figma**: For the clean UI design that inspired the layout.

---

Feel free to reach out with questions or suggestions!. 😊


