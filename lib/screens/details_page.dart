import 'package:flutter/material.dart';

import '../model/place_model.dart';
import '../widgets/star_display.dart';

class PlaceDetails extends StatelessWidget {
  const PlaceDetails({super.key, required this.items});
  final CardItem items;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: const [
          Icon(
            Icons.favorite_border_rounded,
          ),
          SizedBox(width: 12)
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5), BlendMode.darken),
                image: NetworkImage(items.urlImage),
                fit: BoxFit.cover)),
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    items.title,
                    style: const TextStyle(color: Colors.white, fontSize: 30.0),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_pin,
                        color: Colors.white,
                      ),
                      Text(items.location,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          )),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                items.description,
                style: Theme.of(context).textTheme.headline3,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  IconTheme(
                    data: const IconThemeData(
                      size: 22,
                    ),
                    child: StarDisplay(value: items.rating.toInt()),
                  ),
                  Text(
                    items.rating.toString(),
                    style: const TextStyle(color: Colors.white),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(
                      '\u{20B9}${items.price}/person',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            const Color(0xFFFCD240),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ))),
                      onPressed: () {},
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          'Book Now',
                          style: TextStyle(color: Colors.black),
                        ),
                      ))
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
