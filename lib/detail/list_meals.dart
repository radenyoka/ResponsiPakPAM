import 'package:flutter/material.dart';
import 'package:responsiprakpam/model/meal.dart';
import 'package:responsiprakpam/api/data_source.dart';
import 'detail_meals.dart';

class ListMeals extends StatefulWidget {
  final String Category;
  const ListMeals({super.key, required this.Category});

  @override
  State<ListMeals> createState() => _ListMealsState();
}

class _ListMealsState extends State<ListMeals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.Category),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: FutureBuilder(
        future: ApiDataSource.instance.getMeals(widget.Category),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('ERROR'),
            );
          }
          if (snapshot.hasData) {
            Meal meal  = Meal.fromJson(snapshot.data!);
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemCount: meal.meals?.length,
                itemBuilder: (context, int index) {
                  final Meals? meals = meal.meals?[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailMeals(idMeals: '${meals?.idMeal}')));
                    },
                    child: Card(
                      child: SizedBox(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Image.network(
                                '${meals?.strMealThumb}',
                                height: 160,
                                width: 150,
                              ),
                            ),
                            Text(
                              '${meals?.strMeal}',
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }
            );
          }
          return Center(
            child: CircularProgressIndicator(color: Colors.indigo),
          );
        },
      ),
    );
  }
}