import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/models/Meal.dart';
import '../dummy_data.dart';
import 'MealScreen_Details.dart';

class CategoryMealsDetails extends State<CategoryMealsDetailsStateFul> {

  @override
  Widget build(BuildContext context) {
   Map<String,String>? data = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
   String CategoryId = data["id"].toString();
   String? CategoryTitle = data["title"].toString();
   List<Meal>  meals  = DUMMY_MEALS.where((element) {
     return element.categories!.contains(CategoryId);
   }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(CategoryTitle+" meals",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: ListView.builder(
        itemCount: meals.length,
        itemBuilder: (con, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                MealDetailsStateFul.routeScreenName,
                arguments: meals[index].id.toString(),
              );

            },
            child: Card(
              shadowColor: Colors.grey,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                padding: EdgeInsets.only(bottom: 15),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10)),
                      child: Image.asset(
                        meals[index].imageUrl.toString(),
                        fit: BoxFit.fill,
                        height: 350,
                        width: double.infinity,
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 5),
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      width: double.infinity,
                      color: Colors.grey.withOpacity(0.2),
                      child: Text(
                        meals[index].title.toString(),
                        style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontSize: 18),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                       Row(
                         children: [
                           Icon(Icons.schedule,color: Colors.orange),
                           Text(meals[index].duration.toString()+" min",
                             style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold,),
                           ),
                         ],
                       ),
                       Row(
                         children: [
                           Icon(Icons.work_sharp,color: Colors.orange,),
                           Text(meals[index].complexity.toString(),
                             style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold,),
                           ),
                         ],
                       ),
                       Row(
                         children: [
                           Icon(Icons.attach_money,color: Colors.orange,),
                           Text(meals[index].affordability.toString(),
                             style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold,),
                           ),
                         ],
                       ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

}

class CategoryMealsDetailsStateFul extends StatefulWidget {
  static String routeScreenName = "/CategoryMealsDetails";
  @override
  State<StatefulWidget> createState() {
    return CategoryMealsDetails();
  }
}
