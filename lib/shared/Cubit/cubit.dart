// ignore_for_file: camel_case_types, unnecessary_import, prefer_const_constructors, non_constant_identifier_names, avoid_print

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/Cubit/states.dart';
import 'package:newsapp/Modules/Business/Business.dart';
import 'package:newsapp/Modules/Science/Sceince.dart';

import 'package:newsapp/Modules/Sports/Sports.dart';

import 'package:newsapp/shared/network/remote/dio_helper.dart';

class newscubit extends Cubit<NewsStates> {
  newscubit() : super(NewsInitialStates());
  static newscubit get(context) => BlocProvider.of(context);
  int currentindex = 0;
  List<BottomNavigationBarItem> bottomitems = [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.business,
        ),
        label: 'Busniess'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.sports,
        ),
        label: 'Sports'),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.facebook),
      label: 'Profile',
    ),
  ];
  void changebottomnavindex(int index) {
    currentindex = index;
    if (index == 1) getSports();
    if ((index) == 2) getScience();
    if ((index) == 3) getProfile();

    emit(NewsBottomNavStates());
  }

  List<Widget> Screens = [
    businessScreen(),
    SportsScreen(),
    ScienceScreen(),
    
  ];
  List<dynamic> Busniess = [];
  void getBusniess() {
    emit(NewsgetLoadingSuccessState());
    if (Busniess.length == 0) {
      DioHelper.getdata(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'business',
          'apiKey': 'ba69be2f050f4f0ca5aa36c5c9c28420',
        },
      ).then((value) {
        // print(value.data['articles'][0]['title']);
        Busniess = value.data['articles'];
        print(Busniess[0]['title']);
        emit(NewsgetBusniessSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsgetBusniessErrorState(error.toString()));
      });
    } else {
      emit(NewsgetBusniessSuccessState());
    }
  }

  List<dynamic> Sports = [];
  void getSports() {
    emit(NewsSportsgetLoadingSuccessState());
    if (Science.length == 0) {
      DioHelper.getdata(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'sports',
          'apiKey': 'ba69be2f050f4f0ca5aa36c5c9c28420',
        },
      ).then((value) {
        // print(value.data['articles'][0]['title']);
        Sports = value.data['articles'];
        print(Sports[0]['title']);
        emit(NewsSportsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsSportsErrorState(error.toString()));
      });
    } else {
      emit(NewsSportsSuccessState());
    }
  }

  List<dynamic> Science = [];
  void getScience() {
    emit(NewsSciencegetLoadingSuccessState());
    if (Science.length == 0) {
      DioHelper.getdata(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'science',
          'apiKey': 'ba69be2f050f4f0ca5aa36c5c9c28420',
        },
      ).then((value) {
        // print(value.data['articles'][0]['title']);
        Science = value.data['articles'];
        print(Science[0]['title']);
        emit(NewsScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsScienceErrorState(error.toString()));
      });
    } else {
      emit(NewsScienceSuccessState());
    }
  }

  List<dynamic> Profile = [];
  void getProfile() {
    emit(NewsSciencegetLoadingSuccessState());
    DioHelper.getdata(
      url: 'posts',
      query: {
        'Profile': 'Khaled',
      },
    ).then((value) {
      // print(value.data['articles'][0]['title']);
      Profile = value.data['data'];
      // print(Science[0]['title']);
      emit(NewsScienceSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsScienceErrorState(error.toString()));
    });
  }

  List<dynamic> Search = [];

  void Searchbar(String value) {
    emit(NewsSearchbargetLoadingSuccessState());

    DioHelper.getdata(
      url: 'v2/everything',
      query: {
        'q': value,
        'apiKey': 'ba69be2f050f4f0ca5aa36c5c9c28420',
      },
    ).then((value) {
      // print(value.data['articles'][0]['title']);
      Search = value.data['articles'];
      print(Search[0]['title']);
      emit(NewsSearchbarSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsSearchbarerrorState(error.toString()));
    });
  }
}
