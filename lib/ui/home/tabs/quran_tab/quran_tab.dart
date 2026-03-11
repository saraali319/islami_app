import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/quran_tab/widgets/sura_item.dart';

import '../../../../themes/colors.dart';
import '../../../../themes/text_styles.dart';
import 'models/sura_model.dart';

class QUranTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var height = MediaQuery
        .of(context)
        .size
        .height;

    return Stack(
      children: [
        Image.asset(
          'assets/images/quran_tab_background.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.black.withAlpha(70), AppColors.black],
              end: AlignmentGeometry.bottomCenter,
              begin: AlignmentGeometry.topCenter,
            ),
          ),
        ),
        SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: (Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/appbar_logo.png',
                      width: width * 0.7,
                    ),
                  ],
                )),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(

                    decoration: InputDecoration(
                      prefixIcon: ImageIcon(
                          AssetImage('assets/images/ic_quran.png'),color: AppColors.gold),
                      hintText: 'Sura Name',
                      hintStyle: TextStyles.labelLargeStyle(),

                      filled: true,
                      fillColor: AppColors.black.withAlpha(70),
                      enabledBorder: OutlineInputBorder(

                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: AppColors.gold,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: AppColors.gold,
                          width: 1,
                        ),
                      ),


                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(

                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text("Suras", style: TextStyles.labelLargeStyle()),
                ),
              ),
              SliverList.separated(itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8,),
                  child:  SuraItem(sura: suraList[index])
                );
              },
                  itemCount: suraList.length,
                  separatorBuilder: (context, index) =>
                      Divider(color: AppColors.white, thickness: 1,
                        indent: 40,
                        endIndent: 40,
                      ))
            ],
          ),
        ),
      ],
    );
  }
}
