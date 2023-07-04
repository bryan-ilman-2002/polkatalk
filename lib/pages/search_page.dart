import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    int counter = 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('PolkaTalk'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle notification icon press
            },
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 10,
            ),
          ],
        ),
        child: BottomAppBar(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _buildNavItem(Icons.search, 'Search', counter++),
              _buildNavItem(Icons.favorite, 'Favorites', counter++),
              _buildNavItem(Icons.calendar_today, 'Sessions', counter++),
              _buildNavItem(Icons.inbox, 'Inbox', counter++),
              _buildNavItem(Icons.person, 'Profile', counter++),
            ],
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: 10, // Replace with your actual data count
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[200],
                          ),
                          // Replace with your photo widget
                          child: const Center(
                            child: Icon(Icons.photo, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'John Doe', // Replace with the name
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Software Engineer', // Replace with the profession
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(Icons.star,
                                    color: Colors.yellow, size: 18),
                                Icon(Icons.star,
                                    color: Colors.yellow, size: 18),
                                Icon(Icons.star,
                                    color: Colors.yellow, size: 18),
                                Icon(Icons.star,
                                    color: Colors.yellow, size: 18),
                                Icon(Icons.star, color: Colors.grey, size: 18),
                                SizedBox(width: 5),
                                Text(
                                  '4.0', // Replace with the rating
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 320),
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            border: _getNavBarItemBorder(index),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 24,
                color: _getNavBarItemColor(index),
              ),
              const SizedBox(height: 4),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 320),
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: _getNavBarTextWeight(index),
                  color: _getNavBarItemColor(index),
                ),
                child: Text(
                  label,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  FontWeight _getNavBarTextWeight(int index) {
    return _selectedIndex == index ? FontWeight.bold : FontWeight.normal;
  }

  Color _getNavBarItemColor(int index) {
    return _selectedIndex == index ? Colors.black : Colors.grey;
  }

  Border _getNavBarItemBorder(int index) {
    return _selectedIndex == index
        ? Border.all(color: Colors.black, width: 2.0)
        : Border.all(color: Colors.transparent, width: 0.0);
  }
}
