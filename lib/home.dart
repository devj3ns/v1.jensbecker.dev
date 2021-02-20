import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';

import 'animated_wave.dart';
import 'extensions.dart';
import 'socials_row/socials_row.dart';

class Home extends StatefulWidget {
  const Home({@required this.title});
  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>
    with SingleTickerProviderStateMixin {
  AnimationController _baseAnimation;
  Animation<double> _socialsAnimation;
  final Color backgroundColor = Colors.white;

  @override
  void initState() {
    super.initState();
    _baseAnimation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..forward();
    _socialsAnimation = CurvedAnimation(
      parent: _baseAnimation,
      curve: const Interval(0.50, 1.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          AnimatedWave(
            speed: 1.25,
            height: 100,
            color: Colors.blue.withAlpha(60),
          ),
          AnimatedWave(
            speed: 1.75,
            height: 75,
            color: Colors.blueGrey.withAlpha(60),
          ),
          AnimatedWave(
            speed: 2,
            height: 50,
            color: Colors.blue.withAlpha(60),
          ),
          Align(
            alignment: const Alignment(0, -1 / 3),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FadeIn(
                  duration: const Duration(milliseconds: 500),
                  child: Container(
                    width: 150,
                    height: 150,
                    child: CircleAvatar(
                      backgroundImage: const NetworkImage(
                        'assets/icon.jpg',
                      ),
                      backgroundColor: backgroundColor,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                FadeIn(
                  duration: const Duration(milliseconds: 600),
                  child: SelectableText(
                    'Jens Becker',
                    style: Theme.of(context).textTheme.headline3.copyWith(
                        color: context.isInDarkMode
                            ? Colors.white.withOpacity(0.7)
                            : Colors.black.withOpacity(0.7)),
                  ),
                ),
                const SizedBox(height: 10),
                FadeIn(
                  duration: const Duration(milliseconds: 600),
                  child: SelectableText(
                    'Digital Creator',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: Colors.blueGrey),
                  ),
                ),
                const SizedBox(height: 20),
                SocialsRow(animation: _socialsAnimation),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
