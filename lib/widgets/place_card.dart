import 'package:flutter/material.dart';
import 'package:travel_app/screens/details_page.dart';
import '../model/place_model.dart';
import 'star_display.dart';

class BuildCard extends StatefulWidget {
  final CardItem items;
  const BuildCard({
    super.key,
    required this.items,
  });

  @override
  State<BuildCard> createState() => _BuildCardState();
}

class _BuildCardState extends State<BuildCard> {
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Material(
          child: InkWell(
            onTap: (() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PlaceDetails(items: widget.items)));
            }),
            child: Container(
              width: 225,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.5), BlendMode.darken),
                      image: NetworkImage(widget.items.urlImage),
                      fit: BoxFit.cover)),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.items.title,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold)),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.location_pin,
                              color: Colors.white,
                            ),
                            Text(widget.items.location,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                )),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 15.0),
                        child: Row(
                          children: [
                            IconTheme(
                              data: const IconThemeData(
                                size: 22,
                              ),
                              child: StarDisplay(
                                  value: widget.items.rating.toInt()),
                            ),
                            Text(
                              widget.items.rating.toString(),
                              style: const TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ),
        Positioned(
          right: 20,
          top: 15,
          child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      isFavourite = !isFavourite;
                    });
                  },
                  icon: Icon(
                    isFavourite ? Icons.favorite : Icons.favorite_border,
                    color: isFavourite ? Colors.pink : Colors.black,
                  ))),
        ),
      ],
    );
  }
}
