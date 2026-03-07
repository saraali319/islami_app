import 'package:flutter/material.dart';
import 'package:islami_app/models/on_boarding_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../themes/colors.dart';
import '../themes/text_styles.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String routeName = "OnBoardingScreen";

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Image.asset('assets/images/mosque.png'),
                  Positioned(
                    bottom: MediaQuery
                        .of(context)
                        .size
                        .height * 0.05,
                    left: MediaQuery
                        .of(context)
                        .size
                        .width * 0.15,
                    child: Image.asset('assets/images/islami_text.png'),
                  ),
                ],
              ),
              Expanded(
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: onBoardingModel.length,
                    itemBuilder: (context, index) {
                      return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          spacing: 20,
                          children: [
                            Image.asset(onBoardingModel[index].imagePath,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.8,),
                            if(index == 0) SizedBox(height: 20,),
                            Text(onBoardingModel[index].title, style: TextStyles
                                .titleLargeStyle(color: AppColors.gold)),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(onBoardingModel[index].subTitle ?? '',
                                style: TextStyles.titleMediumStyle(
                                  color: AppColors.gold,),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Row(
                              mainAxisAlignment:MainAxisAlignment.spaceBetween,
                              children: [

                                Text('Back',style: TextStyles.titleMediumStyle(color: AppColors.gold),),
                                SmoothPageIndicator(
                                    controller: pageController,  // PageController
                                    count:  onBoardingModel.length,
                                    axisDirection: Axis.horizontal,
                                    effect:  WormEffect(dotHeight: 8,
                                      dotWidth: 8,
                                      activeDotColor: AppColors.gold,
                                      dotColor: Colors.grey,),  // your preferred effect

                                ),

                                Text('Next',style: TextStyles.titleMediumStyle(color: AppColors.gold),),

                              ],
                            )


                          ]
                      );
                    },
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
