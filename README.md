# 📱 Marketplace App

## 📌 Overview
We are developing a cross-platform mobile application using Flutter to ensure accessibility across Android and iOS. Our backend is powered by **Firebase for secure authentication and efficient data management. 

## 🚀 Features
### 🏠 Home Page
- Displays newest products and top sales.
- Allows users to explore trending listings.

### 🔍 Search Bar
- Enables users to search for items by:
  - User name
  - Minimum and maximum price range

### ➕ Add a New Item
- Users can list their items for sale.
- Images are checked for NSFW content before posting.

### 💬 Chat Space
- Facilitates real-time interaction between buyers and sellers.

### 👤 Profile Page
- Stores all user activities, including:
  - Posted items
  - Purchase history
  - Chat interactions

## 🔒 Security & Content Moderation
To maintain a safe environment, we have implemented a rigorous NSFW content detection system. 
- We evaluated multiple models (Gantman/NSFW, Yahoo/Open_NSF, NSFWJS/InceptionV3) and selected **MobileNetV2 (140_224) for its accuracy and efficiency.
- The model was converted to TFLite and deployed using FastAPI on Render.
- When an image is uploaded, our system returns probability scores for categories like porn, sexy, hentai, AI, and neutral.
- Only neutral images are allowed in the marketplace.

## 🎨 UI/UX Design
- Designed using Figma for a seamless and engaging user experience.

## 🛠 Tech Stack
### 📱 Mobile Development
- Flutter (Cross-platform: Android/iOS)

### 🔗 Backend & Database
- Firebase (Authentication, Data Management, Chat)
- FastAPI (NSFW Content Detection API)
- Render (API Deployment)

## 📂 Repository Structure

krackhack/
│-- lib/                # Flutter frontend code
│-- assets/             # Images and other static assets
│-- models/             # Data models for the app
│-- services/           # API and Firebase integration
│-- screens/            # UI screens of the app
│-- pubspec.yaml        # Dependencies and configuration
│-- README.md           # Project documentation


## 🏗 Installation & Setup
1. Clone the repository:
   sh
   git clone https://github.com/gyanratan-code/krackhack.git
   
2. Navigate to the project folder:
   sh
   cd krackhack
   
3. Install dependencies:
   sh
   flutter pub get
   
4. Run the app:
   sh
   flutter run
   

## 📜 Summary of Code
- The application is built using Flutter for cross-platform compatibility.
- Firebase is used for authentication and data storage.
- The NSFW detection model is implemented with FastAPI and TFLite.
- Users can search, list items, chat, and track their activities within the app.

## 🤝 Contribution
Contributions are welcome! Feel free to submit a pull request or raise an issue.
