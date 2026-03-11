import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/quran_tab/quran_tab.dart';
import '../../themes/colors.dart';
import '../../themes/text_styles.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  // تعريف الـ Controller
  late PageController pageController = PageController(
    initialPage: selectedIndex,
  );


  List<Widget> tabs = [
    QUranTab(),
    Container(color: Colors.blue),
    QUranTab(),
    Container(color: Colors.yellow),
    Container(color: Colors.red),
  ];

  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
      if (((pageController.page ?? 0) % 1) > 0.5) {
        selectedIndex = (pageController.page ?? 0).toInt() + 1;
      } else {
        selectedIndex = (pageController.page ?? 0).toInt();

      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: //tabs[selectedIndex]
      PageView(
        controller: pageController,
        children: tabs,

      ),
      backgroundColor: AppColors.black,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
          onTap: (newIndex) {
            if (newIndex == selectedIndex) return;
            selectedIndex = newIndex;
            pageController.jumpToPage(
              selectedIndex,
            );},
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.gold,
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.black,
        showUnselectedLabels: false,
        selectedLabelStyle: TextStyles.bodySmallStyle(),
        items: [
          BottomNavigationBarItem(icon: _buildBottomNavigationBarIcon("assets/images/ic_quran.png", 0), label: "Quran"),
          BottomNavigationBarItem(icon: _buildBottomNavigationBarIcon("assets/images/ic_hadeth.png", 1), label: "Hadeth"),
          BottomNavigationBarItem(icon: _buildBottomNavigationBarIcon("assets/images/ic_sebha.png", 2), label: "Sebha"),
          BottomNavigationBarItem(icon: _buildBottomNavigationBarIcon("assets/images/ic_radio.png", 3), label: "Radio"),
          BottomNavigationBarItem(icon: _buildBottomNavigationBarIcon("assets/images/ic_time.png", 4), label: "Time"),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBarIcon(String imagePath, int index) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: index == selectedIndex
          ? BoxDecoration(
        color: AppColors.black.withAlpha(60),
        borderRadius: BorderRadius.circular(100),
      )
          : null,
      child: ImageIcon(AssetImage(imagePath)),
    );
  }
}