import 'package:e_commerce_clothing_ui/core/sizes/med_qry.dart';
import 'package:e_commerce_clothing_ui/screens/cart_screen.dart';
import 'package:e_commerce_clothing_ui/screens/details_closthes.dart';
import 'package:e_commerce_clothing_ui/widgets/auto_text_size.dart';
import 'package:e_commerce_clothing_ui/widgets/layout_builder/layout_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClosthesDepart {
  final String depart;
  final Color color;

  ClosthesDepart(this.depart, this.color);
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final medQryHieght = medQryHeight(context) -
        mediaQuery.padding.top -
        mediaQuery.padding.bottom -
        mediaQuery.viewPadding.top -
        mediaQuery.viewPadding.bottom;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset('asset/home.svg'), label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('asset/heart.svg'), label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('asset/ring_ring.svg'), label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('asset/user.svg'), label: ''),
        ],
      ),
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 10
            buildSizedBox(
              height: medQryHieght * 0.08,
              child: buildTopOfScreen(),
            ),

            // 7
            buildSizedBox(
              height: medQryHieght * 0.07,
              child: buildSearchContainer(),
            ),
            SizedBox(
              height: medQryHieght * 0.03,
            ),
            // 20
            buildSizedBox(
              height: medQryHieght * 0.2,
              child: buildDiscountSquare(context),
            ),
            SizedBox(
              height: medQryHieght * 0.03,
            ),
            // 3
            buildSizedBox(
              height: medQryHieght * 0.03,
              child: buildListClohesDepart(),
            ),
            SizedBox(
              height: medQryHieght * 0.03,
            ),
            // 3
            buildSizedBox(
                height: medQryHieght * 0.5, child: buildCardListOfClothes()),
          ],
        ),
      ),
    );
  }

  Widget buildSizedBox(
      {required double height, double? width, required Widget child}) {
    return SizedBox(
      height: height,
      width: width,
      child: child,
    );
  }

  buildTopOfScreen() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              AutoTextSizesClass(
                textAuto: 'Welcom Back!',
                fonsSizeAuto: 12.0,
                stepGranialy: 2,
                miniFontSize: 6,
                fontWeightAuto: FontWeight.w400,
                // ignore: use_full_hex_values_for_flutter_colors
                colorAuto: Color(0xffbac4F5663),
              ),
              AutoTextSizesClass(
                textAuto: 'Falcon Thought',
                fonsSizeAuto: 15.0,
                stepGranialy: 3,
                miniFontSize: 6,
                fontFamilyAuto: 'Popines',
                fontWeightAuto: FontWeight.w600,
                colorAuto: Color(0xff061023),
              ),
            ],
          ),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade200, blurRadius: 5)
                ]),
            child: IconButton(
              icon: SvgPicture.asset('asset/bag22.svg'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) {
                      return const CartScreen();
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  buildSearchContainer() {
    return InfoWidget(builder: (context, localSizes) {
      return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        // height: localSizes.localHeight * 0.3,
        width: localSizes.localWidth * 0.9,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.grey.shade200),
        child: Row(
          children: const [
            Icon(Icons.search),
            AutoTextSizesClass(
                textAuto: 'What are you looking for...',
                colorAuto: Color(0xff4F5663),
                fonsSizeAuto: 10.0,
                stepGranialy: 2.0,
                fontWeightAuto: FontWeight.w400,
                fontFamilyAuto: 'Popines',
                miniFontSize: 6)
          ],
        ),
      );
    });
  }

  buildDiscountSquare(BuildContext context) {
    return Container(
      width: medQryWidth(context) * 0.9,
      height: medQryHeight(context) * 0.2,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          fit: BoxFit.fill,
          alignment: Alignment.center,
          image: AssetImage(
            'asset/mask_group.png',
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AutoTextSizesClass(
            textAuto: 'Shop wit us!',
            fonsSizeAuto: 14.0,
            stepGranialy: 2.0,
            miniFontSize: 6.0,
            colorAuto: Color(0xff061023),
            fontWeightAuto: FontWeight.w400,
          ),
          SizedBox(
            width: medQryWidth(context) * 0.4,
            child: const AutoTextSizesClass(
              textAuto: 'Get 40% Off for all iteams',
              fonsSizeAuto: 20.0,
              stepGranialy: 4.0,
              miniFontSize: 12,
              maxLinesAuto: 2,
              fontFamilyAuto: 'Popines',
              colorAuto: Color(0xff061023),
              fontWeightAuto: FontWeight.w700,
            ),
          ),
          Row(
            children: const [
              AutoTextSizesClass(
                textAuto: 'Shop Now',
                fonsSizeAuto: 14.0,
                stepGranialy: 2.0,
                miniFontSize: 6.0,
                fontFamilyAuto: 'Popines',
                colorAuto: Color(0xff061023),
                fontWeightAuto: FontWeight.w400,
              ),
              Icon(
                Icons.arrow_right_alt_sharp,
                size: 30,
              ),
            ],
          )
        ],
      ),
    );
  }

  buildListClohesDepart() {
    List<String> clothesDepart = [
      'All',
      'Jacket',
      'Jeans',
      'Pants',
      'Shirt',
    ];
    return SizedBox(
      height: medQryHeight(context) * 0.03,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: clothesDepart.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: () {},
              child: Container(
                height: 30,
                width: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    boxShadow: [
                      BoxShadow(color: Colors.grey.shade200, blurRadius: 5)
                    ],
                    borderRadius: BorderRadius.circular(15)),
                child: AutoTextSizesClass(
                  textAuto: clothesDepart[index],
                  fonsSizeAuto: 12.0,
                  stepGranialy: 2.0,
                  miniFontSize: 6.0,
                  colorAuto: const Color(0xff061023),
                  fontWeightAuto: FontWeight.w500,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  buildCardListOfClothes() {
    // GridView.count(crossAxisCount: 2);
    return InfoWidget(builder: (context, localSizes) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: 4,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 10, childAspectRatio: 2 / 3),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) {
                      return const DetailsClothes();
                    },
                  ),
                );
              },
              child: Container(
                height: localSizes.localHeight * 0.9,
                width: localSizes.localWidth * 0.5,
                margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: InfoWidget(builder: (context, localSizes) {
                  return Stack(
                    children: [
                      Container(
                        height: localSizes.localHeight * 0.7,
                        width: localSizes.localWidth,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('asset/image_cut.png'),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: localSizes.localHeight / 100,
                        left: localSizes.localWidth / 2.5,
                        child: Container(
                          height: localSizes.localHeight / 1.8,
                          width: localSizes.localWidth / 5,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Color(0xff061023),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.shopping_basket_outlined,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: localSizes.localHeight / 100,
                        left: localSizes.localWidth / 4.5,
                        child: SizedBox(
                          height: localSizes.localHeight / 5,
                          width: localSizes.localWidth / 1.5,
                          child: Column(
                            children: const [
                              AutoTextSizesClass(
                                textAuto: 'Bomber Jackets',
                                fonsSizeAuto: 14,
                                stepGranialy: 2,
                                miniFontSize: 8,
                                fontWeightAuto: FontWeight.w500,
                              ),
                              AutoTextSizesClass(
                                textAuto: '\$49.99',
                                fonsSizeAuto: 16,
                                stepGranialy: 2,
                                miniFontSize: 8,
                                fontWeightAuto: FontWeight.w400,
                                fontFamilyAuto: 'Popines',
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: localSizes.localWidth * 0.2,
                          height: localSizes.localHeight * 0.2,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              shape: BoxShape.circle,
                              boxShadow: const [
                                BoxShadow(color: Colors.white, blurRadius: 8)
                              ]),
                          child: IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset('asset/heart.svg'),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: ClipPath(
                          clipper: MyClipper(),
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            height: localSizes.localHeight * 0.5,
                            width: localSizes.localWidth,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            );
          },
        ),
      );
    });
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(size.width * 0.0808375, size.height * 0.4990000);
    path0.quadraticBezierTo(size.width * 0.2376375, size.height * 0.5081800,
        size.width * 0.2987875, size.height * 0.4960000);
    path0.cubicTo(
        size.width * 0.3752125,
        size.height * 0.4550800,
        size.width * 0.3761875,
        size.height * 0.2995600,
        size.width * 0.5019375,
        size.height * 0.2988600);
    path0.cubicTo(
        size.width * 0.6243375,
        size.height * 0.3000400,
        size.width * 0.6294000,
        size.height * 0.4657000,
        size.width * 0.7023375,
        size.height * 0.4980200);
    path0.quadraticBezierTo(size.width * 0.7691625, size.height * 0.5093800,
        size.width, size.height * 0.4980000);
    path0.lineTo(size.width * 0.9995000, size.height);
    path0.lineTo(0, size.height);
    path0.lineTo(0, size.height * 0.5017600);
    path0.lineTo(size.width * 0.0808375, size.height * 0.4990000);
    path0.close();
    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
