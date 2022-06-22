import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class LiveTVFirebaseUser {
  LiveTVFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

LiveTVFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<LiveTVFirebaseUser> liveTVFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<LiveTVFirebaseUser>((user) => currentUser = LiveTVFirebaseUser(user));
