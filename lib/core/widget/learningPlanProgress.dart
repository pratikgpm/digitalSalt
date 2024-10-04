import 'package:digital_salt/core/theme/app_pallete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProgressWidget extends StatelessWidget {
  final String topic;
  final int completed;
  final int total;

  const ProgressWidget({
    Key? key,
    required this.topic,
    required this.completed,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double progress = total != 0 ? completed / total : 0;

    return Container(
      height: 22,
      child:
      Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 18,
                  width: 18,
                  child: CircularProgressIndicator(
                    strokeWidth: 3.0,
                    value: progress,
                    color: Pallete.circularProgressGrey ,
                    backgroundColor: Pallete.circularProgressSecondary,
            
                  ),
                ),
                SizedBox(width: 13,),
                Text(
                  topic,
                  style: TextStyle(
                    fontSize: 14,
                    color: Pallete.headingFontColr,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          RichText(
            text:  TextSpan(
              children: [
                TextSpan(
                  text: '$completed',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Pallete.headingFontColr,
                    fontSize:
                    14, // You can adjust the size if needed
                  ),
                ),
                TextSpan(
                  text: '/$total',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Pallete.regFontColr,
                    fontSize:
                    14, // Smaller font size for the grey text
                  ),
                ),
              ],
            ),
          ),

        ],
      )
    );
  }
}
