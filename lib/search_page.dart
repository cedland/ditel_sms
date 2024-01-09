import 'package:flutter/material.dart';

import 'classes/contact.dart';
import 'data/dummy_data.dart';
class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  final List<Contact> _allUsers = contacts;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Contact> _foundUsers = [];
  @override
  initState() {
    _foundUsers = widget._allUsers;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Contact> results = [];
    if (enteredKeyword.isEmpty) {
      results = widget._allUsers;
    } else {
      results = widget._allUsers
          .where((user) =>
          user.name.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kindacode.com'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                  labelText: 'Search', suffixIcon: Icon(Icons.search)),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _foundUsers.isNotEmpty
                  ? ListView.builder(
                itemCount: _foundUsers.length,
                itemBuilder: (context, index) => Card(
                  key: ValueKey(_foundUsers[index].name),
                  color: Colors.amberAccent,
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: Text(
                      _foundUsers[index].name.toString(),
                      style: const TextStyle(fontSize: 24),
                    ),
                    title: Text(_foundUsers[index].name),
                    subtitle: Text(
                        '${_foundUsers[index].name} years old'),
                  ),
                ),
              )
                  : const Text(
                'No results found',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}