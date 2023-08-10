import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentTab = 0;

  final List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.parachuteBox,
    FontAwesomeIcons.personBiking
  ];

  List<Widget> _buildIcon() {
    return _icons.asMap().entries.map((MapEntry<int, dynamic> map) {
      return GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = map.key;
          });
        },
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: _selectedIndex == map.key
                ? Theme.of(context).hintColor
                : const Color(0xFFE7EBEE),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Icon(
            _icons[map.key],
            size: 25,
            color: _selectedIndex == map.key
                ? Theme.of(context).primaryColor
                : const Color(0xFFB4C1C4),
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 30),
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 100),
              child: Text(
                'What would you like to find ?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _buildIcon()),
            const SizedBox(
              height: 20,
            ),
            const DestinationCarousel(),
            const SizedBox(
              height: 20,
            ),
            const HotelCarousel(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int value) {
          setState(() {
            _currentTab = value;
          });
        },
        currentIndex: _currentTab,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 30,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.local_pizza,
                size: 30,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: CircleAvatar(
                radius: 15,
                backgroundImage: NetworkImage('http://i.imgur.com/zL4Krbz.jpg'),
              ),
              label: '')
        ],
      ),
    );
  }
}
