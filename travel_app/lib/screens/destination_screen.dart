import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/models.dart';

class DestinationScreen extends StatefulWidget {
  final Destination? destination;

  const DestinationScreen({super.key, this.destination});

  @override
  State<DestinationScreen> createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  Text _buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; ++i) {
      stars += '⭐ ';
    }
    stars.trim();
    return Text(stars);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 6)
                    ]),
                child: Hero(
                  tag: widget.destination!.imageUrl!,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image(
                      image: AssetImage(widget.destination!.imageUrl!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 30,
                          color: Colors.black,
                        )),
                    Row(
                      children: [
                        IconButton(
                            // ignore: avoid_print
                            onPressed: () => print('Search'),
                            icon: const Icon(
                              Icons.search,
                              size: 30,
                              color: Colors.black,
                            )),
                        IconButton(
                            // ignore: avoid_print
                            onPressed: () => print('More'),
                            icon: const Icon(
                              FontAwesomeIcons.arrowDownWideShort,
                              size: 25,
                              color: Colors.black,
                            )),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                left: 20,
                bottom: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.destination!.city!,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2),
                    ),
                    Row(
                      children: [
                        const Icon(
                          FontAwesomeIcons.locationArrow,
                          size: 15,
                          color: Colors.white70,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          widget.destination!.country!,
                          style: const TextStyle(
                              color: Colors.white70, fontSize: 20),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Positioned(
                right: 30,
                bottom: 40,
                child: Icon(
                  Icons.location_on,
                  color: Colors.white70,
                  size: 25,
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.only(top: 10, bottom: 15),
                itemCount: widget.destination!.activities!.length,
                itemBuilder: (BuildContext context, int index) {
                  Activity activity = widget.destination!.activities![index];
                  return Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(40, 5, 20, 5),
                        height: 170,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(100, 20, 20, 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 120,
                                    child: Text(
                                      activity.name!,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        '\$${activity.price!}',
                                        style: const TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const Text(
                                        'per pax',
                                        style: TextStyle(color: Colors.grey),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(height: 3,),
                              Text(
                                activity.type!,
                                style: const TextStyle(color: Colors.grey),
                              ),
                              const SizedBox(height: 5,),
                              _buildRatingStars(activity.rating!),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    width: 70,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).hintColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(activity.startTimes![0]),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    width: 70,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).hintColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(activity.startTimes![1]),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20,
                        bottom: 15,
                        top: 15,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image(
                            width: 110,
                            image: AssetImage(activity.imageUrl!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}
