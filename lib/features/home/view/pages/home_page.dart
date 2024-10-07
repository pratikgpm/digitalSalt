import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/app_pallete.dart';
import '../../../../core/widget/learningPlanProgress.dart';
import '../widgets/custom_progressIndicator.dart';

class homeScreen extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const homeScreen(),
      );

  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
          SizedBox(
            height: 240,
            child: Stack(
              children: [
                Container(
                  height: 183,
                  color: Pallete.bgBlue,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              //this will be dynamic
                              text: 'Hi,Kristin',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Pallete.whiteColor,
                                fontSize: 24, // You can adjust the size if needed
                              ),
                            ),
                            TextSpan(
                              text: '\nLet’s start learning',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Pallete.whiteColor,
                                fontSize:
                                    14, // Smaller font size for the grey text
                              ),
                            ),
                          ],
                        ),
                      ),
                      SvgPicture.asset('assets/svg_files/ProfileAvatarMale.svg'),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 20,
                  left: 20,
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Pallete.regFontColr.withOpacity(0.4),
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: const Offset(0, 5)),
                        ],
                        color: Pallete.whiteColor,
                        borderRadius: BorderRadius.circular(15)),
                    height: 96,
                    width: 335,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Learned today",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Pallete.regFontColr,
                                ),
                              ),
                              Text(
                                "My cources",
                                style: TextStyle(
                                    color: Pallete.bgBlue,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: '46min',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Pallete.headingFontColr,
                                    fontSize:
                                        20, // You can adjust the size if needed
                                  ),
                                ),
                                TextSpan(
                                  text: '/60min',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Pallete.regFontColr,
                                    fontSize:
                                        10, // Smaller font size for the grey text
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const GradientProgressIndicator(
                            backgroundColor: Color(0xffF4F3FD),
                            //Later on this will be dynamic handel by stateManagenment
                            value: 0.6,
                            gradient: LinearGradient(
                                colors: [Colors.white, Color(0xffFF5106)]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 154.65,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Pallete.cardBlueBg,
                    ),
                    margin: const EdgeInsets.only(left: 20, right: 12),
                    height: 154,
                    width: 249,
                    child: Stack(
                      children: [
                        Positioned(
                            bottom: 6.5,
                            right: 0,
                            child: SvgPicture.asset(
                                'assets/svg_files/homeBannerOne.svg')),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 18.5, horizontal: 18),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                "What do youwant to\nlearn today ?",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Pallete.headingFontColr),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor: const MaterialStatePropertyAll(
                                      Pallete.orange),
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.symmetric(
                                          horizontal: 8.5, vertical: 5.0)),
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6)
                                      )
                                  ),
                                ),
                                child: const Text("Get started",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        color: Pallete.whiteColor)),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Pallete.cardBlueBg,
                    ),
                    margin: EdgeInsets.only(right: 12),
                    height: 154,
                    width: 249,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SvgPicture.asset('assets/svg_files/homeBannerTwo.svg'),
                        SvgPicture.asset('assets/svg_files/homeBannerOne.svg')
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          Container(
              margin: const EdgeInsets.only(left: 20),
              child: const Text(
                "Learning Plan",
                style: TextStyle(
                    color: Pallete.headingFontColr,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              )),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 133,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: Pallete.whiteColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: Pallete.regFontColr.withOpacity(0.4),
                      blurRadius: 5,
                      spreadRadius: 1,
                      offset: const Offset(0, 5))
                ]),
            padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 16.0),
            child: const Column(
              children: [
                ProgressWidget(
                  completed: 40,
                  topic: "Packaging Design",
                  total: 48,
                ),
                SizedBox(
                  height: 16,
                ),
                ProgressWidget(
                  completed: 6,
                  topic: "Product Design",
                  total: 24,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Container(
            height: 140,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: Pallete.fadePinkBannerBg,
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //figma value modified , inital 96.51
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Meetup',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Pallete.purple,
                          fontSize: 24.36, // You can adjust the size if needed
                        ),
                      ),
                      TextSpan(
                        text: '\nOff-line exchange of learning \nexperiences',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Pallete.purple,
                          fontSize: 10, // Smaller font size for the grey text
                        ),
                      ),
                    ],
                  ),
                ),
                SvgPicture.asset(
                  'assets/svg_files/group.svg',
                  height: 120,
                )
              ],
            ),
          )
                ],
              ),
        ));
  }
}
