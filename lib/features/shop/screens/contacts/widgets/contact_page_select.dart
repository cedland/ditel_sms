import 'package:flutter/material.dart';

class ContactPageSelect extends StatefulWidget {
  const ContactPageSelect({super.key});

  @override
  State<ContactPageSelect> createState() => _ContactPageSelectState();
}

class _ContactPageSelectState extends State<ContactPageSelect> {
  var currentPage = 0;
  final int totalPages = 10;

  @override
  Widget build(BuildContext context) {
    const int displayedPages = 5;
    final int startPage = (currentPage - displayedPages ~/ 2).clamp(0, totalPages - displayedPages);

    return Container(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 40,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey[300]!,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextButton.icon(
              onPressed: currentPage > 0
                  ? () {
                setState(() {
                  currentPage--;
                });
              }
                  : null,
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(16),
              ),
              icon: const Icon(
                Icons.arrow_back,
                color: Color.fromARGB(255, 128, 131, 163),
                size: 16,
              ),
              label: Text(
                "Retour",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: const Color.fromARGB(255, 128, 131, 163),fontFamily: "LatoBold",fontSize: 14),
              ),
            ),
          ),
          Row(
            children: List.generate(
              displayedPages,
                  (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    currentPage = startPage + index;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: currentPage == startPage + index
                        ? const Color.fromARGB(255, 107, 89, 204)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: const Color.fromARGB(100, 158, 158, 158),
                      width: 0.5,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      (startPage + index + 1).toString(),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: currentPage == startPage + index
                              ? Colors.white
                              : Colors.black),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 40,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey[300]!,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextButton.icon(
              onPressed: currentPage < totalPages - 1
                  ? () {
                setState(() {
                  currentPage++;
                });
              }
                  : null,
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(16),
              ),
              icon: const Icon(
                Icons.arrow_forward,
                color: Color.fromARGB(255, 128, 131, 163),
                size: 16,
              ),
              label: Text(
                "Suivant",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: const Color.fromARGB(255, 128, 131, 163),
                    fontFamily: "LatoBold",fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
