import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBhA4MDn5jWtD1bG5OsSXNxNesWHsJsWRk",
            authDomain: "livetv-b6767.firebaseapp.com",
            projectId: "livetv-b6767",
            storageBucket: "livetv-b6767.appspot.com",
            messagingSenderId: "20255061608",
            appId: "1:20255061608:web:96286f91350b8f2cfd6ddd",
            measurementId: "G-ZY9V5MD972"));
  } else {
    await Firebase.initializeApp();
  }
}
