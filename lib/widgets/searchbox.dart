import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0),
      width: MediaQuery.of(context).size.width * 0.93,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.grey.shade200)),
      child: const TextField(
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
            hintStyle: TextStyle(color: Colors.grey),
            border: InputBorder.none,
            hintText: "Search"),
      ),
    );
  }
}
