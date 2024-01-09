import 'package:flutter/material.dart';

class SearchTextFieldExtension extends StatefulWidget {
  const SearchTextFieldExtension({super.key, required this.title});

  final String title;

  @override
  SearchTextFieldExtensionState createState() =>
      SearchTextFieldExtensionState();
}

class SearchTextFieldExtensionState extends State<SearchTextFieldExtension> {
  bool isSearchExpanded = false;
  final FocusNode _searchFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    _searchFocus.addListener(() {
      if (!_searchFocus.hasFocus) {
        setState(() {
          isSearchExpanded = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_searchFocus.hasFocus) {
          _searchFocus.unfocus();
        } else if (isSearchExpanded) {
          setState(() {
            isSearchExpanded = false;
          });
        }
      },
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color.fromARGB(100, 158, 158, 158),
              width: 1.5,
            ),
          ),
        ),
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: const Color.fromARGB(100, 158, 158, 158),
                        width: 0.5,
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {
                        // Handle button press
                      },
                      icon: const Icon(
                        Icons.menu,
                        size: 16,
                        color: Color.fromARGB(255, 128, 131, 163),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.title,
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: const Color.fromARGB(100, 158, 158, 158),
                        width: 0.5,
                      ),
                    ),
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isSearchExpanded = !isSearchExpanded;
                              if (isSearchExpanded) {
                                _searchFocus.requestFocus();
                              }
                            });
                          },
                          icon: const Icon(
                            Icons.search,
                            color: Color.fromARGB(255, 128, 131, 163),
                            size: 18,
                          ),
                        ),
                        if (isSearchExpanded)
                          Container(
                            margin: const EdgeInsets.only(left: 36),
                            width: 100,
                            child: TextField(
                              focusNode: _searchFocus,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search',
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      'https://th.bing.com/th/id/OIP.PztowP3ljup0SM75tkDimQHaHa?w=199&h=199&c=7&r=0&o=5&dpr=1.3&pid=1.7',
                      width: 35,
                      height: 35,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
