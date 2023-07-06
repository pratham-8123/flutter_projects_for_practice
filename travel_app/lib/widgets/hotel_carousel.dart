import 'package:flutter/material.dart';
import 'package:travel_app/models/models.dart';

class HotelCarousel extends StatelessWidget {
  const HotelCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                'Exclusive Hotels',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5),
              ),
              GestureDetector(
                // ignore: avoid_print
                onTap: () => print('See All'),
                child: Text(
                  'See All',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 300,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: hotels.length,
              itemBuilder: (BuildContext context, int index) {
                Hotel hotel = hotels[index];
                return Container(
                  margin: const EdgeInsets.all(10),
                  width: 240,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Positioned(
                        bottom: 15,
                        child: Container(
                          height: 120,
                          width: 240,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  hotel.name!,
                                  style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.2),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  hotel.address!,
                                  style: const TextStyle(color: Colors.grey),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  '\$${hotel.price} / Night',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 2),
                                  blurRadius: 6)
                            ]),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image(
                            height: 180,
                            width: 220,
                            image: AssetImage(hotel.imageUrl!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }
}
