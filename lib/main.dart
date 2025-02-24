import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:iit_marketing/views/ItemPage.dart';
import 'package:iit_marketing/views/addItem.dart';
import 'package:iit_marketing/views/allUsersChats.dart';
import 'package:iit_marketing/views/chat_page.dart';
import 'package:iit_marketing/views/chat_screen.dart';
import 'package:iit_marketing/views/home.dart';
import 'package:iit_marketing/views/login.dart';
import 'package:iit_marketing/views/newNewsConfirmation.dart';
import 'package:iit_marketing/views/orders.dart';
import 'package:iit_marketing/views/profile.dart';
import 'package:iit_marketing/views/search.dart';
import 'package:iit_marketing/views/signup.dart';
import 'package:iit_marketing/views/userInputPage.dart';
import 'firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:iit_marketing/services/auth_services.dart'; // Import AuthService for FCM token

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Get the currently logged-in user
  User? user = FirebaseAuth.instance.currentUser;

  // Initialize FCM only if the user is logged in
  if (user != null) {
    await setupFCM(user.uid);
  }

  print("✅ Firebase initialized successfully!");

  runApp(const MyApp());
}

Future<void> setupFCM(String userId) async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  // Request notification permissions (iOS & Android)
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.denied) {
    print("🔴 Notifications permission denied.");
    return;
  }

  print("✅ Notifications permission granted: ${settings.authorizationStatus}");

  // Save FCM token
  await AuthService().saveFCMToken(userId);

  // Foreground message listener
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print("📩 Foreground message received: ${message.notification?.title}");
  });

  // When the user taps on a notification
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print("📬 User tapped on a notification: ${message.notification?.title}");
  });

  // Handle background messages
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
}

// Background message handler (must be a top-level function)
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("📨 Background message received: ${message.notification?.title}");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    String initialRoute = _auth.currentUser != null ? "/home" : "/login";

    return MaterialApp(
        title: 'News App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: initialRoute,
        onGenerateRoute: (settings) {
          if (settings.name == "/new_news_confirmation") {
            final args = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(
              builder: (context) => NewNewsConfirmation(
                title: args["title"]!,
                description: args["description"]!,
                longDescription: args["longDescription"]!,
                thumbnailImage: args["thumbnailPath"] ?? '',
                additionalImages:
                    List<String>.from(args["additionalImages"] ?? []),
              ),
            );
          }

          switch (settings.name) {
            case "/":
            case "/home":
              return MaterialPageRoute(builder: (context) => HomePage());
            case "/userInput":
              return MaterialPageRoute(
                  builder: (context) => ProfileSetupPage());
            case "/profile":
              return MaterialPageRoute(builder: (context) => ProfilePage());
            case "/new":
              return MaterialPageRoute(builder: (context) => AddNews());
            case "/orders":
              return MaterialPageRoute(builder: (context) => OrdersPage());
            case "/signup":
              return MaterialPageRoute(builder: (context) => SignUp());
            case "/login":
              return MaterialPageRoute(builder: (context) => Login());
            case "/search":
              return MaterialPageRoute(builder: (context) => SearchPage());
            case "/chat":
              return MaterialPageRoute(
                  builder: (context) => Chats(uid: _auth.currentUser!.uid));
            default:
              return MaterialPageRoute(builder: (context) => HomePage());
          }
        });
  }
}
