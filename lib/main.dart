// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Layout/News_Layout.dart';
import 'package:newsapp/shared/Cubit/cubit.dart';
import 'package:newsapp/shared/Cubit/cubitdark.dart';
import 'package:newsapp/shared/Cubit/states.dart';
import 'package:newsapp/shared/network/local/BlocObserver/BlocObserver.dart';
import 'package:newsapp/shared/network/remote/dio_helper.dart';
import 'package:newsapp/shared/network/local/Cache_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  BlocOverrides.runZoned(
    () async {
      //بيتأكد ان كل حاجه خلصت فالميثود وبعدين يرن
      WidgetsFlutterBinding.ensureInitialized();
      DioHelper.init();
      await cacheHelper.init();
      bool? isdark = cacheHelper.getboolean(key: 'isdark');
      isdark = true;

      runApp(MyApp(isdark));
      // Use cubits...
    },
    blocObserver: MyBlocObserver(),
  );
}

//class MyApp
//stateless dol 2 widget flutter kolhm
//stateful
class MyApp extends StatelessWidget {
  final bool isdark;
  MyApp(this.isdark);

  // AWL 7AGA astd3y constructor 3lshan y2om tany 7aga el bulid
  //3lshan hya asasya fe el app hya elly btbny el app
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => newscubit()
            ..getBusniess()
            ..getSports()
            ..getScience()
            ..getProfile(),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              darkcubit()..changeappmode(fromshared: isdark),
        ),
      ],
      child: BlocConsumer<darkcubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            home: NewsLayout(),
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                  titleSpacing: 20.0,
                  iconTheme: IconThemeData(color: Colors.black),
                  backwardsCompatibility: false,
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark,
                  )),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange,
                  elevation: 20.0),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: HexColor('333739'),
              appBarTheme: AppBarTheme(
                  titleSpacing: 20.0,
                  iconTheme: IconThemeData(color: Colors.white),
                  backwardsCompatibility: false,
                  backgroundColor: HexColor('333739'),
                  elevation: 0.0,
                  titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: HexColor('333739'),
                    statusBarIconBrightness: Brightness.light,
                  )),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                elevation: 20.0,
                backgroundColor: HexColor('333739'),
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            themeMode: darkcubit.get(context).isdark
                ? ThemeMode.dark
                : ThemeMode.light,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
