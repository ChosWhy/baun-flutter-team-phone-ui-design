import 'package:flutter/material.dart';

class SearchWidgetOfInfoPage extends StatelessWidget {
  const SearchWidgetOfInfoPage(
      {Key? key, required this.name, required this.phoneNumber})
      : super(key: key);
  final String name;
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(itemBuilder: (itemBuilder, index) => Container()),
      ],
    );
  }
}
