
import 'package:flutter/material.dart';

import '../../../../../classes/contact.dart';
import '../../../../../utils/constants/colors.dart';

class SearchWidget extends StatefulWidget {
  final Contact contact;
  final bool connect;

  const SearchWidget({super.key, required this.contact, required this.connect});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {

  List<Contact> _foundContact = [];

  @override
  initState() {
    _foundContact = widget.contact as List<Contact>;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Contact> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = widget.contact as List<Contact>;
    } else {
      results = (widget.contact as List<Contact>).where((user) => user.name.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
      // we use the toLowerCase() method to make it case-insensitive
    }
    setState(() {
      _foundContact = results;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 9),
                child: Container(
                  width: 38,
                  height: 38,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      widget.contact.image,
                      width: 36,
                      height: 36,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 35,
                left: 35,
                child: Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(15),
                      color: TColors.bg,
                    ),
                    child: Container(
                      height: 12,
                      width: 12,
                      margin: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(5),
                        color: widget.connect ? Colors.green : Colors.orange,
                      ),
                    )
                ),
              )
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.contact.name,style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold)),
                Text(widget.contact.function, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: const Color.fromARGB(255, 128, 131, 163),),),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.zero,
            width: 30,
            height: 30,
            margin: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color.fromARGB(100, 158, 158, 158),
                width: 0.5,
              ),
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_horiz_outlined,
                    size: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
