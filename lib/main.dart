import 'package:flutter/material.dart';
import 'Screens/CategoryMeals .dart';
import 'Screens/MealScreen_Details.dart';
import 'dummy_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        accentColor: Colors.pink,
        canvasColor: Color.fromRGBO(255, 254, 229, 0.9),
        textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(
            fontFamily: 'RobotoCondensed',
          ),
        ),
      ),
      home: MyHomePage(),
      routes: {
        CategoryMealsDetailsStateFul.routeScreenName:(context)=>CategoryMealsDetailsStateFul(),
        MealDetailsStateFul.routeScreenName:(context)=>MealDetailsStateFul(),

      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meal Categories",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),

      ),
      body: GridView(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20
        ),
        children: DUMMY_CATEGORIES.map((catData) {
          return InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                  CategoryMealsDetailsStateFul.routeScreenName,
                  arguments: {
                    "id":catData.id.toString(),
                    "title":catData.title.toString(),
                  }
              );
            },
            borderRadius: BorderRadius.circular(10),

            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: catData.color,
              ),
              child: Text(catData.title.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: Theme.of(context).textTheme.title!.fontFamily,
                ),
              ),
            ),
          );
        }).toList(),
      ),

    );
  }
}
