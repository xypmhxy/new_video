/*
* 作者 Ren
* 时间  2023/8/22 20:56
*/

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:free_tube_player/app/common/common.dart';

class FirebaseHelper {
  static final get = FirebaseHelper._();

  FirebaseHelper._();

  Future<void> initFirebase() async {
    await Firebase.initializeApp(options: _getFirebaseOptions());
  }

  void postEvent({required String eventName, Map<String, Object?>? parameters}) {
    FirebaseAnalytics.instance.logEvent(name: eventName, parameters: parameters);
  }

  FirebaseOptions _getFirebaseOptions() {
    return isIOS
        ? const FirebaseOptions(
        apiKey: 'AIzaSyDIE8ZJgyvYT_laza3egnsiPKozTuuPPFs',
        appId: "1:711978488455:ios:f88fe06f7eaa7f85cfde22",
        messagingSenderId: '711978488455',
        iosClientId: '711978488455-k46562soougcp9dmjoq3a5jjti89ih49.apps.googleusercontent.com',
        storageBucket: 'freetuber-ios.appspot.com',
        projectId: 'freetuber-ios')
        : const FirebaseOptions(
        apiKey: 'AIzaSyBSxbcEBqyvkOT_LOk6dQQJ5PaZdaPFmdM',
        appId: "1:163818755776:android:a76a8f0c3ec033596a3f25",
        messagingSenderId: '163818755776',
        androidClientId: '163818755776-m3s1qf93sp9kpa6vm6nmr1uhcp02jedh.apps.googleusercontent.com',
        storageBucket: 'freetuber-53332.appspot.com',
        projectId: 'freetuber-53332');
  }
}