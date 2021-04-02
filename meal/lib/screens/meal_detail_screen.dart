import 'package:flutter/material.dart';
import 'package:meal/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = "/meal-item-detail";
  @override
  Widget build(BuildContext context) {
    final routesArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final selectedMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == routesArg['id']);

    Widget buildSectionTitle(BuildContext context, String title) {
      return Container(
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
      );
    }

    Widget buildContainer(Widget child) {
      return Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          height: 200,
          width: double.infinity,
          child: child);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title.toString()),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
              ),
            ),
            buildSectionTitle(context, "Ingridents"),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      selectedMeal.ingredients[index],
                    ),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, "Steps"),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${index + 1}'),
                      ),
                      title: Text(selectedMeal.steps[index]),
                    ),
                    Divider(),
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          Icons.delete,
        ),
        onPressed: () {
          Navigator.of(context).pop(selectedMeal.id);
        },
      ),
    );
  }
}
