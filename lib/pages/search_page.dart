import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

const String rating = "3.2";

class _SearchPageState extends State<SearchPage> {
  int _selectedIndex = 0;

  Color _getRatingColor(double value) {
    // Define the start and end colors for interpolation
    Color startColor = Colors.red;
    Color middleColor = Colors.yellow;
    Color endColor = Colors.green;

    // Normalize the value between 0.0 and 1.0
    double normalizedValue = (value - 0.0) / (5.0 - 0.0);

    // Calculate the stop points for color interpolation
    double stop1 =
        0.5; // Stop point for transitioning from startColor to middleColor
    double stop2 =
        1.0; // Stop point for transitioning from middleColor to endColor

    final Color? ratingColor;
    if (normalizedValue <= stop1) {
      // Interpolate between startColor and middleColor
      ratingColor =
          Color.lerp(startColor, middleColor, normalizedValue / stop1);
      return ratingColor ?? Colors.transparent;
    } else {
      // Interpolate between middleColor and endColor
      ratingColor = Color.lerp(
          middleColor, endColor, (normalizedValue - stop1) / (stop2 - stop1));
      return ratingColor ?? Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    int counter = 0;

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
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
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
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
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'John Doe', // Replace with the name
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 2),
                            const Text(
                              'Software Engineer', // Replace with the profession
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color:
                                        _getRatingColor(double.parse(rating)),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    rating,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
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
            borderRadius: BorderRadius.circular(24),
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
