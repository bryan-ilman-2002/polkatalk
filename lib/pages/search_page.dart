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
                        offset: Offset(0, 4),
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
                      SizedBox(width: 15),
                      Expanded(
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
      child: SizedBox(
        height: 60,
        child: Material(
          color: Colors.transparent,
          child: Ink(
            decoration: ShapeDecoration(
              color: _getBackgroundColor(index),
              shape: _getBorderShape(index),
            ),
            child: InkWell(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              borderRadius: BorderRadius.circular(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: _getIconColor(index),
                    size: 24,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 12,
                      color: _getIconColor(index),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color _getIconColor(int index) {
    return _selectedIndex == index ? Colors.black : Colors.grey;
  }

  Color _getBackgroundColor(int index) {
    return _selectedIndex == index ? Colors.white : Colors.transparent;
  }

  ShapeBorder _getBorderShape(int index) {
    return _selectedIndex == index
        ? const RollingWheelBorderShape()
        : const Border();
  }
}

class RollingWheelBorderShape extends ShapeBorder {
  const RollingWheelBorderShape();

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final path = Path();
    final radius = rect.height / 2;
    final controlPointDistance = radius * 0.12;

    path.moveTo(rect.left, rect.top);
    path.lineTo(rect.left, rect.bottom - radius + controlPointDistance);
    path.quadraticBezierTo(rect.center.dx, rect.bottom - controlPointDistance,
        rect.right, rect.bottom - radius + controlPointDistance);
    path.lineTo(rect.right, rect.top);
    path.close();

    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}
