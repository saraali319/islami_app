import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../themes/colors.dart';
import '../../themes/text_styles.dart';
import '../home/tabs/quran_tab/models/sura_model.dart';

class SuraDetails extends StatefulWidget {
  final Sura sura;

  const SuraDetails({super.key, required this.sura});

  static const String routeName = 'SuraDetails';

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  // 3rfna string hena 3shan ya5d data mn fn t7t
  String? suraContent = "";

  @override
  void initState() {
    super.initState();
    getSuraDetails();
  }

  @override
  Widget build(BuildContext context) {
    // getSuraDetails();
    print(1);
    return Scaffold(
      backgroundColor: AppColors.black,

      appBar: AppBar(
        title: Text(widget.sura.nameEn),
        backgroundColor: AppColors.black,
        foregroundColor: AppColors.gold,
      ),
      body: Stack(
        alignment: AlignmentGeometry.bottomCenter,
        children: [
          Image.asset(
            'assets/images/img_bottom_decoration.png',
            width: double.infinity,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Image.asset("assets/images/img_left_corner.png"),
                    Expanded(
                      child: Text(
                        widget.sura.nameAr,
                        textAlign: TextAlign.center,
                        style: TextStyles.titleLargeStyle(
                          color: AppColors.gold,
                        ),
                      ),
                    ),
                    Image.asset("assets/images/img_right_corner.png"),
                  ],
                ),
              ),
              Expanded(
                child: suraContent == null
                    ? Center(
                        child: CircularProgressIndicator(color: AppColors.gold),
                      )
                    : SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            suraContent ?? "",
                            textAlign: TextAlign.center,
                            style: TextStyles.bodyMediumStyle(
                              color: AppColors.gold,
                            ),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  //   void getSuraDetails()async{
  // String suraDetailsText='1';
  // await rootBundle.loadString('assets/suras/'
  //     '${widget.sura.id}.txt').then((value){
  //   suraDetailsText=value;
  //   debugPrint(suraDetailsText);
  // });
  // debugPrint(suraDetailsText);
  //   }
  // }
  Future<void>getSuraDetails() async {
    String suraDetailsText = await rootBundle.loadString(
      'assets/suras/${widget.sura.id}.txt',
    );
    //split bt7wl string -> list
    //join btrg3 list -> string

    // suraDetailsText=suraDetailsText.trim();
    // var ayaList=suraDetailsText.split('\n');
    // ayaList=ayaList.map((line) => line.trim()).toList();
    //await Future.delayed(Duration(seconds: 1));
    var ayaList = suraDetailsText
        .trim()
        .split('\n')
        .map((aya) => aya.trim())
        .toList()
        .join('||');
    suraContent = ayaList;
    setState(() {});
  }

  void test()async {
    getSuraDetails();
    print(1);
  }
}
