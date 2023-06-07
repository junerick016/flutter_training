import 'package:flutter/material.dart';

class AddPlaceScreen extends StatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleCotnroller = TextEditingController();

  @override
  void dispose() {
    _titleCotnroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new place'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                controller: _titleCotnroller,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                )),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton.icon(
                icon: const Icon(Icons.add),
                onPressed: () {},
                label: const Text('Add Place'))
          ],
        ),
      ),
    );
  }
}
