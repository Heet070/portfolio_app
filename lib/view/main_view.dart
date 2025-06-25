import 'package:flutter/material.dart';
import 'package:portfolio/view/first_view.dart';
import 'package:portfolio/view/second_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: PageView(
          controller: pageController,
          scrollDirection: Axis.vertical,
          // Removed physics line to enable default scroll behavior
          children: const [
            FirstView(),
            SecondView(),
          ],
        ),
      ),
    );
  }
}
