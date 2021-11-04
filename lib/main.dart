import 'package:flutter/material.dart';
import 'detail.dart';
import 'recipe.dart';

void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      title: 'Recipes Calculator',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.grey,
          secondary: Colors.black,
        ),
      ),
      home: const MyHomePage(title: 'Recipes Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SafeArea(
          child: Container(
            // 4
            child: ListView.builder(
              // 5
              itemCount: Recipe.samples.length,
              // 6
              itemBuilder: (BuildContext context, int index) {
                // 7
                // TODO: Update to return Recipe card
                return GestureDetector(
                  // 8
                  onTap: () {
                    // 9
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          // 10
                          // TODO: Replace return with return RecipeDetail()
                          return RecipeDetail(recipe: Recipe.samples[index]);

                        },
                      ),
                    );
                  },
                  // 11
                  child: buildRecipeCard(Recipe.samples[index]),
                );
              },
            ),
          ),
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  Widget buildRecipeCard(Recipe recipe) {
    return Card(
      // 1
      elevation: 2.0,
      // 2
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      // 3
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        // 4
        child: Column(
          children: <Widget>[
            Image(image: AssetImage(recipe.imageUrl)),
            // 5
            const SizedBox(
              height: 14.0,
            ),
            // 6
            Text(
              recipe.label,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'Palatino',
              ),
            )
          ],
        ),
      ),
    );
  }
}
