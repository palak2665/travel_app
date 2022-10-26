import 'package:flutter/material.dart';

import '../model/category_model.dart';
import '../model/place_model.dart';
import '../widgets/place_card.dart';
import '../widgets/resort_card.dart';
import '../widgets/searchbox.dart';
import '../widgets/title_text.btn.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryChoice>? _categorychoices;
  get item => _categorychoices;
  int? _choiceIndex;
  List<CardItem> items = [
    CardItem(
      urlImage:
          'https://i0.wp.com/girlswanderlust.com/wp-content/uploads/2022/02/cassie-gallegos-Lqno1bhxoiE-unsplash.jpg?ssl=1',
      title: 'Kuta Beach',
      price: '10,000',
      description:
          'One of the most happening beaches in Goa, Baga Beach is where you will find water sports, fine dining restaurants, bars, and clubs. Situated in North Goa, Baga Beach is bordered by Calangute and Anjuna Beaches.',
      location: 'Bali, Indonesia',
      rating: 4.2,
    ),
    CardItem(
      urlImage:
          'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/18/3e/36/95/baga-sea-beach.jpg?w=800&h=-1&s=1',
      title: 'Baga Beach',
      price: '15,000',
      description:
          'One of the most happening beaches in Goa, Baga Beach is where you will find water sports, fine dining restaurants, bars, and clubs. Situated in North Goa, Baga Beach is bordered by Calangute and Anjuna Beaches.',
      location: 'Goa, India',
      rating: 4.8,
    ),
    CardItem(
      urlImage:
          'https://i.pinimg.com/564x/24/83/22/248322f48d8d7e1aafabf24739122502.jpg',
      title: 'Colva Beach',
      price: '20,000',
      description:
          'One of the most happening beaches in Goa, Baga Beach is where you will find water sports, fine dining restaurants, bars, and clubs. Situated in North Goa, Baga Beach is bordered by Calangute and Anjuna Beaches.',
      location: 'Goa, India',
      rating: 4.8,
    ),
  ];
  @override
  void initState() {
    super.initState();
    _categorychoices = [
      CategoryChoice(title: 'Beach', urlImage: 'assets/images/image 1648.png'),
      CategoryChoice(title: "Mountain", urlImage: 'assets/images/img.png')
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: CircleAvatar(
            backgroundColor: Colors.grey.shade300,
          ),
        ),
        title: const Text("Hello, Vineetha"),
        actions: const [
          Icon(
            Icons.notifications,
            color: Colors.grey,
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                "Where do you \nwant to explore today?",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: SearchBox(),
            ),
            const TitleTextbutton(
              title: "Choose Category",
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _categorychoices!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                              color: _choiceIndex == index
                                  ? Colors.green
                                  : Colors.grey,
                              width: 2)),
                      child: ChoiceChip(
                        avatar: Image(image: AssetImage(item[index].urlImage)),
                        label: Text(item[index].title),
                        shadowColor: Colors.white,
                        selected: _choiceIndex == index,
                        onSelected: (bool selected) {
                          setState(() {
                            _choiceIndex = selected ? index : 0;
                          });
                        },
                        backgroundColor: Colors.white,
                        selectedColor: Colors.white,
                        labelStyle: const TextStyle(color: Colors.black),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              height: MediaQuery.of(context).size.height * 0.45,
              child: ListView.separated(
                  separatorBuilder: (context, _) => const SizedBox(
                        width: 10,
                      ),
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return BuildCard(
                      items: items[index],
                    );
                  }),
            ),
            const TitleTextbutton(
              title: "Popular Package",
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ResortCard(items: items[index]);
                })
          ],
        ),
      )),
    );
  }
}
