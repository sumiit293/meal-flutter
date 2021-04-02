import 'package:flutter/material.dart';
import './../widgets/meal_item.dart';
import './../models/meals.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = "/category-meals";
  final List<Meal> availableMeals;
  CategoryMealScreen(this.availableMeals);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String categoryTitle;
  List<Meal> displayedMeal;
  var _loadeInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadeInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedMeal = widget.availableMeals.where((meals) {
        return meals.categories.contains(categoryId);
      }).toList();
      _loadeInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeal.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              id: displayedMeal[index].id,
              title: displayedMeal[index].title,
              affordability: displayedMeal[index].affordability,
              complexity: displayedMeal[index].complexity,
              duration: displayedMeal[index].duration,
              imageUrl: displayedMeal[index].imageUrl,
              removeItem: _removeMeal);
        },
        itemCount: displayedMeal.length,
      ),
    );
  }
}
