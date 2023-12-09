import 'package:flutter/material.dart';
import 'package:responsiprakpam/api/data_source.dart';
import 'package:responsiprakpam/model/category.dart';
import 'package:responsiprakpam/detail/list_meals.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Categories'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: ApiDataSource.instance.getCategory(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('ERROR'),
            );
          }
          if (snapshot.hasData) {
            Category category = Category.fromJson(snapshot.data!);
            return ListView.builder(
                itemCount: category.categories?.length,
                itemBuilder: (BuildContext context, int index) {
                  var categories = category.categories?[index];
                  return InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ListMeals(Category: '${categories?.strCategory}'),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Column(
                            children: [
                              Image.network(
                                '${categories?.strCategoryThumb}',
                                height: 120,
                                width: 120,
                              ),
                              Text(
                                '${categories?.strCategory}',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                child: Text(
                                  '${categories?.strCategoryDescription}',
                                  textAlign: TextAlign.justify,
                                ),
                              )
                            ],
                          ),
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