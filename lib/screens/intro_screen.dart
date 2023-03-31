import 'package:e_commerce_clothing_ui/widgets/bottom_container.dart';
import 'package:flutter/material.dart';

import '../widgets/page_view_onboarder.dart';

class OnBorderScreen extends StatefulWidget {
  const OnBorderScreen({super.key});

  @override
  State<OnBorderScreen> createState() => _OnBorderScreenState();
}

class _OnBorderScreenState extends State<OnBorderScreen> {
  PageController controller = PageController();
  bool showColor = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(249, 0, 3, 24),
      body: Stack(
        children: [
          PageView(
            controller: controller,
            onPageChanged: (value) {
              setState(() {
                if (value == 0) {
                  showColor = true;
                } else if (value == 1) {
                  showColor = false;
                } else {
                  showColor = true;
                }
              });
            },
            children: const [
              OnBoarderPage(
                image: 'asset/image1.png',
                textTitle: 'Your style tell about you',
                textSubTitle:
                    'There are many clothes with designs that are suitable for you today',
                showShader: true,
              ),
              OnBoarderPage(
                image: 'asset/image2.png',
                textTitle: 'Level up your lifestyle',
                textSubTitle:
                    'There are many clothes with designs that are suitable for you today',
                showShader: false,
              ),
            ],
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: BottomContainer(
                controller: controller,
                showColor: showColor,
              )),
        ],
      ),
    );
  }
}
