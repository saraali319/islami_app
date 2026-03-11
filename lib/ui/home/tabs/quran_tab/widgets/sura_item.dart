import 'package:flutter/material.dart';

import '../../../../../themes/text_styles.dart';
import '../../../../sura_details/sura_details.dart';
import '../models/sura_model.dart';

class SuraItem extends StatelessWidget {
  Sura sura;

  SuraItem({required this.sura});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SuraDetails.routeName, arguments: sura);
      },
      child: Row(
          children: [
            Stack(
              alignment: Alignment.center,

              children: [
                Image.asset(
                  'assets/images/aya_shape.png',
                  height: 52,
                ),
                Text(sura.id.toString(),
                    style: TextStyles.labelMediumStyle())
              ],
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(sura.nameEn,
                      style: TextStyles.titleMediumSmall()),
                  SizedBox(height: 8,),
                  Text("${sura.versesNumber} versus",
                      style: TextStyles.titleMediumSmall()),


                ],

              ),
            ),
            SizedBox(width: 16),
            Text(sura.nameAr, style: TextStyles.titleMediumSmall()),
          ]
      ),
    );
  }

}