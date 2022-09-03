// ignore_for_file: prefer_const_constructors, camel_case_types, use_key_in_widget_constructors, prefer_is_empty

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/Cubit/cubit.dart';
import 'package:newsapp/shared/Cubit/states.dart';
import 'package:newsapp/shared/components/components.dart';

class businessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newscubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = newscubit.get(context).Busniess;
          return articleBuilder(list, context);
        });
  }
}
