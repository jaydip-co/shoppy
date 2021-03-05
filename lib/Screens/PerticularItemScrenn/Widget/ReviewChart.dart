import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RatingChart extends StatefulWidget {
    @override
  _RatingChartState createState() => _RatingChartState();
}

class _RatingChartState extends State<RatingChart> {
final List<Color> colors =[
  Colors.green,
  Color.lerp(Colors.green, Colors.yellow, 0.25),
  Color.lerp(Colors.green, Colors.yellow, 0.50),
  Colors.yellow,
  Colors.red,

];
int max;
int min;
List<int> ints ;
@override
  void initState() {
    super.initState();
    max = 20;
    min = 0;
    ints = [10,5,2,2,1];
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final space = SizedBox(height: 5,);


    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10),
              ),
                color: Color(0xff76FF03),
              ),

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("3.9 ",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),
                    Icon(Icons.star,color:Colors.white),
                  ],
                ),
              ),
            ),
            SizedBox(height: height * .01,),
            Text("20 Rating"),
          ],
        ),
        SizedBox(width: width * .05,),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           SizedBox(
             height: 10,
               child: Text("Excellent",style: TextStyle(fontSize: 10),)),
            space,
            SizedBox(
                height: 10,
                child: Text("Very Good",style: TextStyle(fontSize: 10),)),
            space,
            SizedBox(
                height: 10,
                child: Text("Good",style: TextStyle(fontSize: 10),)),
            space,
            SizedBox(
                height: 10,
                child: Text("Average",style: TextStyle(fontSize: 10),)),
            space,
            SizedBox(
                height: 10,
                child: Text("bad",style: TextStyle(fontSize: 10),)),

          ],
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
          children: [
            getOneRatingBar(max, min, ints[0], colors[0]),
            space,
            getOneRatingBar(max, min, ints[1], colors[1]),
            space,
            getOneRatingBar(max, min, ints[2], colors[2]),
            space,
            getOneRatingBar(max, min, ints[3], colors[3]),
            space,
            getOneRatingBar(max, min, ints[4], colors[4]),
          ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: 10,
                child: Text("10",style: TextStyle(fontSize: 10),)),
            space,
            SizedBox(
                height: 10,
                child: Text("10",style: TextStyle(fontSize: 10),)),
            space,
            SizedBox(
                height: 10,
                child: Text("10",style: TextStyle(fontSize: 10),)),
            space,
            SizedBox(
                height: 10,
                child: Text("10",style: TextStyle(fontSize: 10),)),
            space,
            SizedBox(
                height: 10,
                child: Text("10",style: TextStyle(fontSize: 10),)),

          ],
        ),

        // SliderTheme(
        //   data: SliderTheme.of(context).copyWith(
        //     disabledActiveTrackColor: Colors.red[700],
        //     disabledInactiveTrackColor: Colors.red[100],
        //     thumbColor: Colors.transparent,
        //     thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0.0),
        //   ),
        //   child: Slider(
        //     max: 100,
        //     min: 0,
        //     value: 5,
        //     onChanged:null,
        //   ),
        // ),
      ],
    );
  }
  Widget getOneRatingBar(int max,int min,int val,Color color){
    return SizedBox(
      height: 10,
      child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              disabledActiveTrackColor: color,
              trackHeight: 2,
              thumbColor: Colors.transparent,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0.0),
            ),
            child: Slider(
              max: max.toDouble(),
              min: min.toDouble(),
              value: val.toDouble(),
              onChanged:null,
            ),
          ),
    );
  }
}
