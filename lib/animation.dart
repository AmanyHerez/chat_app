import 'dart:math';

import 'package:flutter/material.dart';

class AnimationClass extends StatefulWidget {
  @override
  _AnimationClassState createState() => _AnimationClassState();
}

class _AnimationClassState extends State<AnimationClass> with SingleTickerProviderStateMixin{
  double height = 200;
  double width = 200;
  Color colorsCOntainer=Colors.red;
  late AnimationController animationController;
  //بدي اعمل الو انيشاليذ
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController=AnimationController(vsync: this,duration: Duration(seconds: 6));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Anaimation",
        ),
      ),
      body: Center(
        // مناسب للانيميشن البسيطة و ال performance تاعها مناسب
        // child: AnimatedContainer(
        //   duration: Duration(seconds: 1),
        //   //كيف طريقة الحركة simulation
        //   curve:Curves.bounceInOut ,
        //   width: width,
        //   height: height,
        //   color: colorsCOntainer,
        // ),
        // لو بدي اعمل انيميشن اتحكم فيه مثلا ابدا انيميشن عند event معين او اوقف انيميشن فلازمني controller على شان اتحكم فيه
        //مش متعلق ب widget معينة . اي ودجيت رح تعطيني اياها رح اسقط عليها الانيميشن
        // اعطيتني صورة او كونتينر او اي اشي
        child: AnimatedBuilder(
          animation: animationController.view,
          //bulider هي الى رح تنشأ الحركة تعتي
          builder: (context,widget){
            // rotate يعنى لف الحركة
            return Transform.rotate(angle: animationController.value*2*pi,child: widget,);
            //animationController.value قيمة متغيرة بين صفر و واحد
            //صفر اول الحركة و واحد في اخر الحركة
          },
          child: Container(
            width: width,
            height: height,
            color: colorsCOntainer,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          animationController.forward();
          // if(animationController.isAnimating){
          //   animationController.stop();
          // }else{
          //   animationController.repeat();
          // }

          //هذا استخدمناه مع ال AnimatedContainer
          // setState(() {
          //   //
          //   // هيك انا غيرت بصورة مفاجئة انو غيرت الطول و العرض
          //  // يعنى دغري صار البوكس 400*400
          //     //             height = 400;
          //     //             width = 400;
          //
          //
          //   height = height==200?400:200;
          //   width = width==200?400:200;
          //   colorsCOntainer= colorsCOntainer==Colors.red ?Colors.yellow :Colors.red;
          // });
        },
        tooltip: 'increment',
        child: Icon(Icons.add),
      ),
    );
    ;
  }
}
