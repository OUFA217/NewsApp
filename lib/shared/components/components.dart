// ignore_for_file: prefer_const_constructors
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:newsapp/Modules/WebView/WebView.dart';

Widget defultformfield({
  required final FormFieldValidator<String> validator,
  required TextEditingController controller,
  required TextInputType type,
  void Function(String)? onsubmit,
  void Function(String)? changed,
  VoidCallback? suffixpressed,
  VoidCallback? onTap,
  required String label,
  bool isPassword = false,
  required IconData prefix,
  IconData? suffix,
}) =>
    TextFormField(
      validator: validator,
      controller: controller,
      obscureText: isPassword,
      onChanged: changed,
      onTap: onTap,
      onFieldSubmitted: onsubmit,
      keyboardType: type,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixpressed,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: OutlineInputBorder(),
      ),
    );

void Navigateto(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
Widget buildArticleItem(data, context) => InkWell(
      onTap: () {
        Navigateto(
          context,
          WebView_screen(data['url']),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: NetworkImage('${data['urlToImage']}'),
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${data['title']}',
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${data['publishedAt']}',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );

Widget articleBuilder(list, context, {isSearch = false}) => ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildArticleItem(list[index], context),
        separatorBuilder: (context, index) => myDivider(),
        itemCount: list.length,
      ),
      fallback: (context) => isSearch
          ? Container()
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
