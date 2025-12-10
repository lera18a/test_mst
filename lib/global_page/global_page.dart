import 'package:flutter/material.dart';
import 'package:test_mst/global_page/card_of_exercise.dart';

class GlobalPage extends StatelessWidget {
  const GlobalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Упражнения', style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: GridView.count(
          childAspectRatio: 0.83,
          padding: EdgeInsets.zero,
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          children: [
            CardOfExercise(
              title: 'Боковой пресс',
              imagePath: 'assets/abdominals.jpg',
            ),
            CardOfExercise(
              title: 'Тяга верхнего блока',
              imagePath: 'assets/hands1.jpg',
            ),
            CardOfExercise(title: 'Жим лёжа', imagePath: 'assets/hands2.jpg'),
            CardOfExercise(
              title: 'Сведение рук ',
              imagePath: 'assets/hands3.jpg',
            ),
            CardOfExercise(
              title: 'Разгибания ног',
              imagePath: 'assets/legs.jpg',
            ),
            CardOfExercise(title: 'Кардио', imagePath: 'assets/run.jpg'),
          ],
        ),
      ),
    );
  }
}
