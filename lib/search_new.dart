import 'package:flutter/material.dart';
class SearchNew extends StatefulWidget {
  @override
  _SearchNewState createState() => _SearchNewState();
}
class _SearchNewState extends State {
  String txt = 'Click Here';
  TextEditingController editingController = TextEditingController();
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    print("Selected TXT Value ${txt}");
    newDataList.addAll(mainDataList);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Cities"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                  margin: EdgeInsets.all(25),
                  child:
                  StatefulBuilder(
                      builder: (context, setState) {
                        return new TextButton(
                         // height: 30.0,
                          child: Text(txt,
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          //color: Colors.blueAccent,
                          //textColor: Colors.white,
                          onPressed: () {
                            setState(() {
                              _showCitiesDialog();
                            });
                          },
                        );
                      }
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
  static List mainDataList = [
    "Apple",
    "Apricot",
    "Banana",
    "Blackberry",
    "Coconut",
    "Date",
    "Fig",
    "Gooseberry",
    "Grapes",
    "Lemon",
    "Litchi",
    "Mango",
    "Orange",
    "Papaya",
    "Peach",
    "Pineapple",
    "Pomegranate",
    "Starfruit"
  ];
  void _showCitiesDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (context, setState)
              {
                return AlertDialog(
                  title: Text('Favorite Color'),
                  content: Container(
                      width: double.minPositive,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              onChanged: (value) {
                                setState(() {
                                  isLoading = true;
                                  filterSearchResults(value);
                                });
                              },
                              controller: editingController,
                              decoration: InputDecoration(
                                  labelText: "Search",
                                  hintText: "Search",
                                  prefixIcon: Icon(Icons.search),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(25.0)))),
                            ),
                          ),
                          Expanded(
                            child: !isLoading ? ListView.builder(
                              shrinkWrap: true,
                              itemCount: newDataList == null ? 0 : newDataList
                                  ?.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                  title: Text(newDataList[index]),
                                  onTap: () => onSelectedValue(index),
                                );
                              },
                            ) : Text("No records found"),
                          ),
                        ],
                      )),
                );
              });
        });
  }
  // List newDataList = List.from(mainDataList);
  List newDataList = [];
  void filterSearchResults(String query) {
    setState(() {
      newDataList = mainDataList
          .where((string) => string.toLowerCase().contains(query.toLowerCase()))
          .toList();
      debugPrint("Checking Fruit Name ${newDataList.toString()}");
      isLoading = false;
    });
  }
  onSelectedValue(int index)  {
    setState(() {
      print("Slected dialog value is....${newDataList[index]}");
      Navigator.pop(context, newDataList[index]);
      txt = newDataList[index];
    });
  }
}