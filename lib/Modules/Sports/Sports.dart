// ignore_for_file: prefer_const_constructors, prefer_is_empty

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/Cubit/cubit.dart';
import 'package:newsapp/shared/Cubit/states.dart';
import 'package:newsapp/shared/components/components.dart';

class SportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newscubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = newscubit.get(context).Sports;
          return articleBuilder(list, context);
        });
  }
}
