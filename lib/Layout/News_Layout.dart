// ignore_for_file: override_on_non_overriding_member, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Modules/Search/Search.dart';
import 'package:newsapp/shared/Cubit/cubit.dart';
import 'package:newsapp/shared/Cubit/cubitdark.dart';
import 'package:newsapp/shared/Cubit/states.dart';
import 'package:newsapp/shared/components/components.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newscubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = newscubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('News App'),
            actions: [
              IconButton(
                onPressed: () {
                  Navigateto(
                    context,
                    SearchScreen(),
                  );
                },
                icon: Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {
                  darkcubit.get(context).changeappmode();
                },
                icon: Icon(Icons.brightness_4_outlined),
              ),
            ],
          ),
          body: cubit.Screens[cubit.currentindex],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomitems,
            currentIndex: cubit.currentindex,
            onTap: (index) {
              cubit.changebottomnavindex(index);
            },
          ),
        );
      },
    );
  }
}
