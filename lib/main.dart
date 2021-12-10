import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/shared/bloc_observer.dart';
import 'package:social_app/shared/componantes/componantes.dart';
import 'layout/home_layout/home_layout.dart';
import 'layout/home_layout/social_cubit.dart';
import 'shared/componantes/constantes.dart';
import 'shared/network/local/cache_helper/cach_helper.dart';
import 'shared/styles/themes/themes.dart';
import 'modules/login_screen/login_screen.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async{}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var token = await FirebaseMessaging.instance.getToken();
  print('TOKEN $token');
  await CacheHelper.init();
  //foreground fcm
  FirebaseMessaging.onMessage.listen((event) {
    print(event.data.toString());
    showToast(msg: "On Message", color: Colors.green);

  });
  //on tap To open fcm
  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    print(event.data.toString());
    showToast(msg: "On Message Opened App", color: Colors.green);

  });
  //background fcm
  FirebaseMessaging.onBackgroundMessage((firebaseMessagingBackgroundHandler));

  Bloc.observer = MyBlocObserver();

  Widget widget;

  uId = CacheHelper.getData(key: 'uId');

  if (uId != null) {
    widget = HomeLayout();
  } else {
    widget = LoginScreen();
  }

  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  const MyApp({this.startWidget});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SocialCubit()
        ..getUserData()
        ..getPosts(),
      child: BlocConsumer<SocialCubit, SocialState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            home: startWidget,
          );
        },
      ),
    );
  }
}
