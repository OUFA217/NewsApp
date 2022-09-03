import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/Cubit/cubit.dart';
import 'package:newsapp/shared/Cubit/states.dart';
import 'package:newsapp/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  @override
  var searchcontroller = TextEditingController();
  Widget build(BuildContext context) {
    return BlocConsumer<newscubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = newscubit.get(context).Search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defultformfield(
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Search must not be empty';
                    } else {
                      return null;
                    }
                  },
                  controller: searchcontroller,
                  changed: (value) {
                    newscubit.get(context).Searchbar(value);
                  },
                  type: TextInputType.text,
                  label: 'Search',
                  prefix: Icons.search,
                ),
              ),
              Expanded(
                  child: articleBuilder(
                list,
                context,
                isSearch: true,
              ))
            ],
          ),
        );
      },
    );
  }
}
