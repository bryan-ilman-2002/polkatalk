import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PolkaTalk',
      theme: ThemeData(
        splashFactory: InkRipple.splashFactory,
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
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
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomAppBar(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _buildNavItem(Icons.search, 'Search', 0),
              _buildNavItem(Icons.favorite, 'Favorites', 1),
              _buildNavItem(Icons.calendar_today, 'Sessions', 2),
              _buildNavItem(Icons.inbox, 'Inbox', 3),
              _buildNavItem(Icons.person, 'Profile', 4),
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
                elevation: 4,
                shadowColor: Colors.grey.withOpacity(0.5),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      // Replace with your photo widget
                      child: const Center(
                        child: Icon(Icons.photo, color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Title $index', // Replace with your title
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Details $index', // Replace with your details
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Row(
                            children: [
                              Icon(Icons.star, color: Colors.grey, size: 18),
                              Icon(Icons.star, color: Colors.grey, size: 18),
                              Icon(Icons.star, color: Colors.grey, size: 18),
                              Icon(Icons.star, color: Colors.grey, size: 18),
                              Icon(Icons.star, color: Colors.grey, size: 18),
                              SizedBox(width: 5),
                              Text(
                                '4.0', // Replace with your rating
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
