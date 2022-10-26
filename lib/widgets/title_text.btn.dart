import 'package:flutter/material.dart';

class TitleTextbutton extends StatelessWidget {
  const TitleTextbutton({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        TextButton(
            onPressed: () {},
            child: const Text(
              "See all",
              style: TextStyle(color: Colors.grey),
            ))
      ],
    );
  }
}
