import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sample extends StatefulWidget {
  const Sample({super.key});

  @override
  State<Sample> createState() => _SampleState();
}

class _SampleState extends State<Sample> {
  final List<String> countries = <String>[
    'Belgium',
    'France',
    'Italy',
    'Germany',
    'Spain',
    'Portugal'
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showDialog();
    });
  }

  _showDialog() async {
    await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('Please select'),
          actions: <Widget>[
            CupertinoDialogAction(
              isDestructiveAction: true,
              onPressed: () {
                Navigator.of(context).pop('Cancel');
              },
              child: const Text('Cancel'),
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              onPressed: () {
                Navigator.of(context).pop('Accept');
              },
              child: const Text('Accept'),
            ),
          ],
          content: SingleChildScrollView(
            child: Material(
              child: MyDialogContent(countries: countries),
            ),
          ),
        );
      },
      barrierDismissible: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MyDialogContent extends StatefulWidget {
  const MyDialogContent({
    super.key,
    required this.countries,
  });

  final List<String> countries;

  @override
  State<MyDialogContent> createState() => _MyDialogContentState();
}

class _MyDialogContentState extends State<MyDialogContent> {
  int _selectedIndex = 0;

  Widget _getContent() {
    if (widget.countries.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      children: List<RadioListTile<int>>.generate(
        widget.countries.length,
            (int index) {
          return RadioListTile<int>(
            value: index,
            groupValue: _selectedIndex,
            title: Text(widget.countries[index]),
            onChanged: (int? value) {
              if (mounted) {
                setState(() {
                  _selectedIndex = value!;
                });
              }
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _getContent();
  }
}