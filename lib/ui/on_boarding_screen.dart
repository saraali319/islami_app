import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../models/on_boarding_model.dart';
import '../themes/colors.dart';
import '../themes/text_styles.dart';
import 'home/home_view.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String routeName = 'OnBoardingScreen';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  // المايسترو بتاعنا
  PageController pageController = PageController();
  int currentIndex = 0;

  @override
  void dispose() {
    pageController.dispose(); // ضروري عشان مفيش Memory Leak
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        children: [
          SizedBox(height: 50),
          Image.asset('assets/images/appbar_logo.png',width: width*0.7),

          Expanded(
            child: PageView.builder(
              controller: pageController,
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              itemCount: onBoardingModel.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 30,
                  children: [
                    Image.asset(onBoardingModel[index].imagePath, width: width * 0.8),
                    if(index==0) SizedBox(height: 20),
                    Text(onBoardingModel[index].title,
                        style: TextStyles.titleLargeStyle(color: AppColors.gold)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Text(onBoardingModel[index].subTitle ?? '',
                          textAlign: TextAlign.center,
                          style: TextStyles.titleMediumStyle(color: AppColors.gold)),
                    ),
                  ],
                );
              },
            ),
          ),


          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Opacity(
                  opacity: currentIndex == 0 ? 0 : 1,
                  child: TextButton(
                    onPressed: () {
                      pageController.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut);
                    },
                    child: Text('Back', style: TextStyles.titleMediumStyle(color: AppColors.gold)),
                  ),
                ),


                SmoothPageIndicator(
                  controller: pageController,
                  count: onBoardingModel.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: AppColors.gold,
                    dotColor: AppColors.grey,
                    expansionFactor: 3,
                    dotHeight: 8,
                    dotWidth: 8,
                  ),
                ),


                TextButton(
                  onPressed: () {
                    if (currentIndex == onBoardingModel.length - 1) {

                       Navigator.pushNamed(context, HomeScreen.routeName);
                    } else {
                      pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut);
                    }
                  },
                  child: Text(
                    currentIndex == onBoardingModel.length - 1 ? 'Finish' : 'Next',
                    style: TextStyles.titleMediumStyle(color: AppColors.gold),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}