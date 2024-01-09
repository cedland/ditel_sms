
import 'package:flutter/material.dart';

import '../../../../../classes/contact.dart';
import '../../../../../utils/constants/colors.dart';

class ContactDetailed extends StatefulWidget {
  const ContactDetailed({super.key, required this.contact, required this.connected});

  final Contact contact;
  final bool connected;

  @override
  ContactDetailedState createState() => ContactDetailedState();
}

class ContactDetailedState extends State<ContactDetailed> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: isHovered
              ? [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 5,
              offset: const Offset(0, 2), // Bottom shadow
            ),
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 5,
              offset: const Offset(2, 0), // Right shadow
            ),
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 5,
              offset: const Offset(-2, 0), // Left shadow
            ),
          ]
              : [],
        ),
        child: Container(
          //color: Colors.red,
          height: 44,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              widget.contact.image,
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 25,
                          top: 27,
                          child: Container(
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: TColors.bg,
                            ),
                            child: Container(
                              margin: EdgeInsets.all(3),
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: widget.connected ? Colors.green : Colors.orange,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.contact.name,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(
                            color: TColors.title,
                            fontSize: 14,fontWeight: FontWeight.bold,fontFamily: "LatoBold"),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.contact.function,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(
                          color: TColors.txtbouttongreydark,
                          fontSize: 13,
                          fontFamily: "LatoRegular"
                      )
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(widget.contact.phoneNumber[0],style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(
                      color: TColors.txtbouttongreydark,
                      fontSize: 13,
                      fontFamily: "LatoRegular"
                  )),
                ),
              ),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 240, 238, 250),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                  ),
                  child: Text(
                    "Entreprises",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(
                          color: TColors.bgboutton,
                          fontSize: 13,
                          fontFamily: "LatoBold"
                      )
                  ),
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: isHovered
                            ? const Color.fromARGB(255, 240, 238, 250)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color.fromARGB(100, 158, 158, 158),
                          width: 0.5,
                        ),
                      ),
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          isHovered
                              ? const Color.fromARGB(255, 107, 89, 204)
                              : const Color.fromARGB(255, 128, 131, 163),
                          BlendMode.srcIn,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.chat_bubble,
                            size: 14,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: isHovered
                            ? const Color.fromARGB(255, 240, 238, 250)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color.fromARGB(100, 158, 158, 158),
                          width: 0.5,
                        ),
                      ),
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          isHovered
                              ? const Color.fromARGB(255, 107, 89, 204)
                              : const Color.fromARGB(255, 128, 131, 163),
                          BlendMode.srcIn,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.search,
                            size: 14,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: isHovered
                            ? const Color.fromARGB(255, 240, 238, 250)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color.fromARGB(100, 158, 158, 158),
                          width: 0.5,
                        ),
                      ),
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          isHovered
                              ? const Color.fromARGB(255, 107, 89, 204)
                              : const Color.fromARGB(255, 128, 131, 163),
                          BlendMode.srcIn,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.more_horiz,
                            size: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
