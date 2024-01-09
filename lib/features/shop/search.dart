import 'package:flutter/material.dart';
class Search extends StatefulWidget {
  const Search({super.key,});


  @override
  State<Search> createState() => _SearchState();
}
class _SearchState extends State<Search> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
              onPressed: (){
                showSearch(context: context,
                    delegate: CustomSearchDelegate());
              },
              icon: const Icon(Icons.search,color: Colors.black,))
        ],
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
class CustomSearchDelegate extends SearchDelegate{

  List<String> searchTerms =[
    'Apple',
    'Banane',
    'Orange'
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: (){
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: (){
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));

  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for(var fruit in searchTerms){
      if(fruit.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index){
          var result = matchQuery[index];
          return Padding(
            padding: const EdgeInsets.only(left: 1400.0),
            child: ListTile(
              title: Text(result),
            ),
          );
        }
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for(var fruit in searchTerms){
      if(fruit.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index){
          var result = matchQuery[index];
          return Padding(
            padding: const EdgeInsets.only(left: 1400.0),
            child: ListTile(
              title: Text(result),
            ),
          );
        }
    );
  }

}