import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Два экрана',
    home: FirstScreen(),
  ));
}

class FirstScreen extends StatelessWidget {
  FirstScreen({Key? key}) : super(key: key);

  final SecondScreen _secondScreen = SecondScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Первая страница'),

      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: Text('Переход на вторую : ' + _secondScreen.secondScreenName),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => _secondScreen),
                );
              },
            ),
            Text('Текст второго экрана : ' + _secondScreen._myController.text),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  SecondScreen({Key? key}) : super(key: key);

  final String secondScreenName = "name Второй экран";
  TextEditingController _myController = TextEditingController(text: 'Enter here edited text');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Второй экран" + secondScreenName),
      ),
      body: Center(
        child: Row(
          children: [
            TextFormField(
              key: Key('name'),
              controller: _myController,
              decoration: InputDecoration(
                  labelText: 'Name'
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate back to first route when tapped.
                Navigator.pop(context);
              },
              child: Text('Назад на первый'),
            ),
          ],
        ),
      ),
    );
  }

}