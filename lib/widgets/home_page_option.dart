import 'package:flutter/material.dart';

class HomePageOption extends StatelessWidget {
  final Icon pageIcon;
  final String pageTitle;
  final String pageSubtitle;
  final VoidCallback pageRoute;
  const HomePageOption(
      {Key? key,
      required this.pageIcon,
      required this.pageTitle,
      required this.pageSubtitle,
      required this.pageRoute})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pageRoute,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 5,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              colors: [Colors.green, Colors.lightGreen],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TweenAnimationBuilder(
                      tween: Tween(begin: 0.0, end: 2 * 3.1415926535),
                      duration: const Duration(seconds: 5),
                      builder:
                          (BuildContext context, double angle, Widget? child) {
                        return Transform.rotate(
                          angle: angle,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 26,
                            child: Icon(
                              pageIcon.icon,
                              size: 30,
                              color: Colors.black,
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Text(
                        pageTitle,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Arial',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        pageSubtitle,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                          fontFamily: 'Verdana',
                        ),
                      ),
                    ),
                    const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                      child: Icon(
                        Icons.navigate_next,
                        size: 32,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
