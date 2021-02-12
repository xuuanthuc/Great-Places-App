import 'package:flutter/material.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routerName = '/add-place-screen';

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add A New Place'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('User Inputs...'),
            RaisedButton.icon(
              icon: Icon(Icons.add),
              label: Text('Add Place'),
              onPressed: null,
            ),
          ],
        ),
      ),
    );
  }
}
