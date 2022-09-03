import 'package:bloc/bloc.dart';
import 'package:newsapp/shared/network/local/Cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/Cubit/states.dart';

class darkcubit extends Cubit<NewsStates> {
  darkcubit() : super(NewsInitialStates());
  static darkcubit get(context) => BlocProvider.of(context);

  bool isdark = false;
  ThemeMode? appmode = ThemeMode.dark;
  void changeappmode({bool? fromshared}) {
    if (fromshared != null) {
      isdark = fromshared;

      emit(appchangemodestate());
    } else {
      isdark = !isdark;

      cacheHelper.putboolean(key: 'isdark', value: isdark).then((value) {
        emit(appchangemodestate());
      });
    }
  }
}
