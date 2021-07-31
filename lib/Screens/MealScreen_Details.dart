import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetails extends State<MealDetailsStateFul> {

  @override
  Widget build(BuildContext context) {
    String idMeal = ModalRoute.of(context)!.settings.arguments as String;
    final mealData=DUMMY_MEALS.firstWhere((element){
      return element.id==idMeal;
    });
    List<String> ingredients=mealData.ingredients!.toList();
    List<String> steps=mealData.steps!.toList();
    List<String> categories=mealData.categories!.toList();

    Widget getContainer(String? title){
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        width: 350,
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 5),
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Text("$title",style: TextStyle(
          color: Colors.orangeAccent,
          fontSize: 24,
          fontFamily: Theme.of(context).textTheme.title!.fontFamily,
        ),),
      );
    }

   return Scaffold(
     appBar: AppBar(
       title: Text(mealData.title.toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
     ),
     body: SafeArea(
       child: SingleChildScrollView(
         child: Container(
           child: Column(
             children: [
               Image.asset(mealData.imageUrl.toString(),
                 height: 250,width: double.infinity,fit:BoxFit.fill,),
               getContainer("ingredients"),
               Container(
                 width: 350,
                 height: 190,
                 margin: EdgeInsets.only(top: 5),
                 padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                 decoration: BoxDecoration(
                   color: Colors.white,
                   border: Border.all(width: 1,color: Colors.grey),
                   borderRadius: BorderRadius.circular(10)

                 ),
                 child: ListView.builder(
                   itemCount:ingredients.length ,
                   itemBuilder: (con,index){
                     return Card(
                       color: Colors.orangeAccent,
                       child: Container(
                         padding: EdgeInsets.all(7),
                         child: Text(ingredients[index].toString(),style: TextStyle(
                           color: Colors.white,
                           fontSize: 20,
                           fontFamily: Theme.of(context).textTheme.title!.fontFamily,
                         ),),
                       )
                     );
                   },
                 ),
               ),
               getContainer("steps"),
               Container(
                 width: 350,
                 height: 250,
                 margin: EdgeInsets.only(top: 5),
                 padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                 decoration: BoxDecoration(
                     color: Colors.white,
                     border: Border.all(width: 1,color: Colors.grey),
                     borderRadius: BorderRadius.circular(10)
                 ),
                 child: ListView.builder(
                   itemCount:steps.length ,
                   itemBuilder: (con,index){
                     return ListTile(
                       leading: CircleAvatar(
                         child: Text("${index+1}"),
                       ),
                       title: Text(steps[index]),

                     );
                   },
                 ),
               ),
             ],
           ),
         ),
       ),
     ),

   );
  }

}

class MealDetailsStateFul extends StatefulWidget {
  static String routeScreenName = "/MealDetails";
  @override
  State<StatefulWidget> createState() {
    return MealDetails();
  }
}
