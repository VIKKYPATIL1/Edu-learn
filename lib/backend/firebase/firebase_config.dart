import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyD_XVL_TfGvRDysu9BPQ-iP1HmAbOgapXo",
            authDomain: "job-seeker-24a9a.firebaseapp.com",
            projectId: "job-seeker-24a9a",
            storageBucket: "job-seeker-24a9a.appspot.com",
            messagingSenderId: "965096919096",
            appId: "1:965096919096:web:c55d4cfd42f888ba1656cd",
            measurementId: "G-2Q0459RP7L"));
  } else {
    await Firebase.initializeApp();
  }
}
