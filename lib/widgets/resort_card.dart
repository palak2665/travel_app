import 'package:flutter/material.dart';
import 'package:travel_app/widgets/star_display.dart';

import '../model/place_model.dart';

class ResortCard extends StatelessWidget {
  const ResortCard({
    super.key,
    required this.items,
  });

  final CardItem items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, right: 15.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Card(
          elevation: 0.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: BorderSide(width: 2, color: Colors.grey.shade200)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.green),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(items.urlImage)),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      width: 120,
                      height: 160,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('${items.title.split(' ')[0]} Resort',
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyText1),
                      const SizedBox(
                        width: 30,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_border_outlined,
                            color: Colors.grey,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '\u{20B9}${items.price}',
                    style: const TextStyle(color: Colors.red, fontSize: 18.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        IconTheme(
                          data: const IconThemeData(
                            size: 22,
                          ),
                          child: StarDisplay(value: items.rating.toInt()),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          items.rating.toString(),
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      'A resort is a place used for\n vacation, relaxation or as a day.',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
