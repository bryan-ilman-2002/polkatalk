import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late ScrollController _scrollController;
  bool _showScrollButton = false;

  bool isBackGroundButtonTapped = false;

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset > 0) {
      setState(() {
        _showScrollButton = true;
      });
    } else {
      setState(() {
        _showScrollButton = false;
      });
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  Color _getRatingColor(double value) {
    // Define the start and end colors for interpolation
    Color startColor = Colors.red;
    Color middleColor = Colors.yellow;
    Color endColor = Colors.green;

    // Normalize the value between 0.0 and 1.0
    double normalizedValue = (value - 0.0) / (5.0 - 0.0);

    // Calculate the stop points for color interpolation
    double firstStop =
        0.5; // Stop point for transitioning from startColor to middleColor
    double secondStop =
        1.0; // Stop point for transitioning from middleColor to endColor

    if (normalizedValue <= firstStop) {
      // Interpolate between startColor and middleColor
      return Color.lerp(startColor, middleColor, normalizedValue / firstStop) ??
          Colors.transparent;
    } else {
      // Interpolate between middleColor and endColor
      return Color.lerp(middleColor, endColor,
              (normalizedValue - firstStop) / (secondStop - firstStop)) ??
          Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    int counter = 0;

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _buildNavItem(Icons.search_outlined, 'Search', counter++),
            _buildNavItem(Icons.favorite_outline, 'Favorites', counter++),
            _buildNavItem(Icons.calendar_today_outlined, 'Sessions', counter++),
            _buildNavItem(Icons.inbox_outlined, 'Inbox', counter++),
            _buildNavItem(Icons.person_outline, 'Profile', counter++),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: ListView.builder(
            controller: _scrollController,
            itemCount: 15, // Replace with your actual data count
            itemBuilder: (BuildContext context, int index) {
              return index == 0
                  ? Row(
                      children: [
                        const Expanded(
                          child: CustomCard(),
                        ),
                        Listener(
                          onPointerDown: (PointerDownEvent _) {
                            setState(() {
                              isBackGroundButtonTapped = true;
                            });
                          },
                          onPointerUp: (PointerUpEvent _) {
                            setState(() {
                              isBackGroundButtonTapped = false;
                            });
                          },
                          onPointerCancel: (PointerCancelEvent _) {
                            setState(() {
                              isBackGroundButtonTapped = false;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            margin: const EdgeInsets.only(right: 8),
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isBackGroundButtonTapped
                                  ? const Color.fromARGB(255, 230, 230, 230)
                                  : Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.photo_outlined,
                              color: Colors.grey,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    )
                  : Padding(
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
                                    child:
                                        Icon(Icons.photo, color: Colors.white),
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
                                          padding: const EdgeInsets.all(6),
                                          decoration: BoxDecoration(
                                            color: _getRatingColor(4.2),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: const Text(
                                            "4.2",
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
      ),
      floatingActionButton: _showScrollButton
          ? FloatingActionButton(
              onPressed: _scrollToTop,
              mini: true,
              elevation: 2,
              backgroundColor: Colors.grey[50],
              child: const Icon(
                Icons.arrow_upward,
                color: Colors.grey,
                size: 24,
              ),
            )
          : null,
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

class CustomCard extends StatefulWidget {
  const CustomCard({Key? key}) : super(key: key);

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool isFilterButtonTapped = false;
  bool isNotificationButtonTapped = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
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
        children: [
          Expanded(
            child: Listener(
              onPointerDown: (PointerDownEvent _) {
                setState(() {
                  isFilterButtonTapped = true;
                });
              },
              onPointerUp: (PointerUpEvent _) {
                setState(() {
                  isFilterButtonTapped = false;
                });
              },
              onPointerCancel: (PointerCancelEvent _) {
                setState(() {
                  isFilterButtonTapped = false;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.horizontal(left: Radius.circular(32)),
                  color: isFilterButtonTapped
                      ? const Color.fromARGB(255, 230, 230, 230)
                      : Colors.white,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.filter_alt_outlined,
                      color: Colors.grey,
                      size: 30,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Filter',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 40,
            width: 1.2,
            color: Colors.grey,
          ),
          Expanded(
            child: Listener(
              onPointerDown: (PointerDownEvent _) {
                setState(() {
                  isNotificationButtonTapped = true;
                });
              },
              onPointerUp: (PointerUpEvent _) {
                setState(() {
                  isNotificationButtonTapped = false;
                });
              },
              onPointerCancel: (PointerCancelEvent _) {
                setState(() {
                  isNotificationButtonTapped = false;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.horizontal(right: Radius.circular(32)),
                  color: isNotificationButtonTapped
                      ? const Color.fromARGB(255, 230, 230, 230)
                      : Colors.white,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.notifications_outlined,
                      color: Colors.grey,
                      size: 30,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Notification',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
