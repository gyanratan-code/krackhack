import 'package:cloudinary_url_gen/cloudinary.dart';
import 'package:cloudinary_flutter/image/cld_image.dart';
import 'package:cloudinary_flutter/cloudinary_context.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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
import 'firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

var CLOUDINARY_URL =
    'cloudinary://965385289918515:7VlJRstsqWldtRjsm6KAvFM_A70@dec8nkbl4';
var cloudinary = Cloudinary.fromStringUrl(CLOUDINARY_URL);
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupFCM();
  print("✅ Firebase initialized successfully!");
  // await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

void setupFCM() {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print("New message received: ${message.notification?.body}");
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print("User clicked on notification");
  });
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
                additionalImages: List<String>.from(args["additionalImages"] ?? []),
              ),
            );
          }

          switch (settings.name) {
            case "/":
            case "/home":
              return MaterialPageRoute(builder: (context) => HomePage());
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
