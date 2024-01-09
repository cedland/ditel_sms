
import 'package:ditel_sms_app/features/shop/screens/campagne/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../dashboard/widgets/drawer_screen.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => AddEventState();
}

class AddEventState extends State<AddEvent> {
  var isSearchExpanded = false;
  var pageId = 0;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  String eventName = '';
  String eventDescription = '';

  final TextEditingController _eventNameController = TextEditingController();
  final TextEditingController _eventDescriptionController =
  TextEditingController();

  @override
  void dispose() {
    _eventNameController.dispose();
    _eventDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> selectDate(BuildContext context) async {
      final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      );
      if (pickedDate != null && pickedDate != selectedDate) {
        setState(() {
          selectedDate = pickedDate;
        });
      }
    }

    Future<void> selectTime(BuildContext context) async {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: selectedTime,
      );

      if (pickedTime != null && pickedTime != selectedTime) {
        setState(() {
          selectedTime = pickedTime;
        });
      }
    }

    void openPromoWidgetDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(8),
                color: Colors.white,
              ),
              width: MediaQuery.of(context).size.width / 4,
              height: MediaQuery.of(context).size.width / 3,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        eventName,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(8),
                            border: Border.all(width: 0.1)),
                        child: IconButton(
                          icon: const Icon(Icons.close, size: 18),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Résumé",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: const Color.fromARGB(255, 128, 131, 163),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(eventDescription,
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Date",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                  color: const Color.fromARGB(
                                      255, 128, 131, 163),
                                ),
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: DateFormat().add_MMMMEEEEd().format(selectedDate),
                                  suffixIcon: const Icon(
                                    Icons.calendar_today,
                                    size: 18,
                                    color: Color.fromARGB(255, 128, 131, 163),
                                  ),
                                ),
                                readOnly: true,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          width: 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Début",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                  color: const Color.fromARGB(
                                      255, 128, 131, 163),
                                ),
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: selectedTime.format(context),
                                  suffixIcon: const Icon(
                                    Icons.calendar_today,
                                    size: 18,
                                    color: Color.fromARGB(255, 128, 131, 163),
                                  ),
                                ),
                                readOnly: true,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color.fromARGB(255, 246, 246, 246),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Annuler",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                color: const Color.fromARGB(
                                    255, 128, 131, 163)),
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color.fromARGB(255, 107, 89, 204),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Valider",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      body: Row(
        children: [
          const DrawerScreen(),
          Expanded(
            child: Column(
              children: [
                const SearchTextFieldExtension(title: "Nouvelle campagne"),
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              color: Color.fromARGB(100, 158, 158, 158),
                              width: 1.5,
                            ),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.height - 80,
                        child: Column(
                          children: [
                            Container(
                              child: Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color:
                                  const Color.fromARGB(255, 236, 238, 245),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.calendar_today_rounded,
                                    color: Color.fromARGB(255, 128, 131, 163),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    pageId = 0;
                                  });
                                },
                                child: pageId == 0
                                    ? Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(8),
                                      color: const Color.fromARGB(
                                          255, 248, 249, 252)),
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(15),
                                  child: Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(20),
                                            color: const Color.fromARGB(
                                                255, 107, 89, 204)),
                                        child: const Icon(
                                          Icons.person,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Paramètres campagne",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                fontWeight:
                                                FontWeight.bold,
                                                fontSize: 12,
                                                color: const Color
                                                    .fromARGB(255,
                                                    107, 89, 204)),
                                          ),
                                          Text(
                                            "Nom, contacts, planning",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                              color: const Color
                                                  .fromARGB(
                                                  255, 128, 131, 163),
                                              fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                                    : Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(8),
                                  ),
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(15),
                                  child: Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(20),
                                          color: const Color.fromARGB(
                                              255, 128, 131, 163),
                                        ),
                                        child: const Icon(
                                          Icons.person,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Paramètres campagne",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                              fontWeight:
                                              FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            "Nom, contacts, planning",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                              color: const Color
                                                  .fromARGB(
                                                  255, 128, 131, 163),
                                              fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                            Container(
                              margin: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color.fromARGB(255, 236, 238, 245),
                                    width: 1.5,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  pageId = 1;
                                });
                              },
                              child: pageId == 1
                                  ? Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(8),
                                    color: const Color.fromARGB(
                                        255, 248, 249, 252)),
                                width: double.infinity,
                                padding: const EdgeInsets.all(15),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.mail,
                                      color: Color.fromARGB(
                                          255, 107, 89, 204),
                                      size: 18,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Rédaction message",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                              fontWeight:
                                              FontWeight.bold,
                                              fontSize: 12,
                                              color: const Color
                                                  .fromARGB(
                                                  255, 107, 89, 204)),
                                        ),
                                        Text(
                                          "Le contenu de votre campagne",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                            color:
                                            const Color.fromARGB(
                                                255,
                                                128,
                                                131,
                                                163),
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                                  : Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                width: double.infinity,
                                padding: const EdgeInsets.all(15),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.mail,
                                      color: Color.fromARGB(
                                          255, 174, 174, 174),
                                      size: 18,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Rédaction message",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                            fontWeight:
                                            FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          "Le contenu de votre campagne",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                            color:
                                            const Color.fromARGB(
                                                255,
                                                128,
                                                131,
                                                163),
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color.fromARGB(255, 236, 238, 245),
                                    width: 1.5,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  pageId = 2;
                                });
                              },
                              child: pageId == 2
                                  ? Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(8),
                                    color: const Color.fromARGB(
                                        255, 248, 249, 252)),
                                width: double.infinity,
                                padding: const EdgeInsets.all(15),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.calendar_today_rounded,
                                      color: Color.fromARGB(
                                          255, 107, 89, 204),
                                      size: 18,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Importer campagne (Excel, CSV)",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                              fontWeight:
                                              FontWeight.bold,
                                              fontSize: 12,
                                              color: const Color
                                                  .fromARGB(
                                                  255, 107, 89, 204)),
                                        ),
                                        Text(
                                          "Importer votre campagne",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                            color:
                                            const Color.fromARGB(
                                                255,
                                                128,
                                                131,
                                                163),
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                                  : Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                width: double.infinity,
                                padding: const EdgeInsets.all(15),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.calendar_today_rounded,
                                      color: Color.fromARGB(
                                          255, 174, 174, 174),
                                      size: 18,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Importer campagne (Excel, CSV)",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                            fontWeight:
                                            FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          "Importer votre campagne",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                            color:
                                            const Color.fromARGB(
                                                255,
                                                128,
                                                131,
                                                163),
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      pageId == 0
                          ? Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Paramètres campagne",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Nom campagne",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                            color:
                                            const Color.fromARGB(
                                                255,
                                                128,
                                                131,
                                                163)),
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context)
                                            .size
                                            .width /
                                            3,
                                        child: TextField(
                                          controller:
                                          _eventNameController,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                              fontWeight:
                                              FontWeight.bold),
                                          onChanged: (text) {
                                            setState(() {
                                              eventName = text;
                                            });
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Date campagne",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                            color:
                                            const Color.fromARGB(
                                                255,
                                                128,
                                                131,
                                                163)),
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context)
                                            .size
                                            .width /
                                            6,
                                        child: TextField(
                                          decoration: InputDecoration(
                                            suffixIcon: GestureDetector(
                                              onTap: () =>
                                                  selectDate(context),
                                              child: const Icon(
                                                Icons.calendar_today,
                                                size: 18,
                                                color: Color.fromARGB(
                                                    255, 128, 131, 163),
                                              ),
                                            ),
                                          ),
                                          readOnly: true,
                                          controller:
                                          TextEditingController(
                                              text: DateFormat(
                                                  'd/MM/yyyy')
                                                  .format(
                                                  selectedDate)),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                              fontWeight:
                                              FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Heure campagne",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                            color:
                                            const Color.fromARGB(
                                                255,
                                                128,
                                                131,
                                                163)),
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context)
                                            .size
                                            .width /
                                            6,
                                        child: TextField(
                                          decoration: InputDecoration(
                                            suffixIcon: InkWell(
                                              onTap: () {
                                                selectTime(context);
                                              },
                                              child: const Icon(
                                                Icons
                                                    .watch_later_outlined,
                                                size: 18,
                                                color: Color.fromARGB(
                                                    255, 128, 131, 163),
                                              ),
                                            ),
                                          ),
                                          readOnly: true,
                                          controller:
                                          TextEditingController(
                                            text: selectedTime
                                                .format(context),
                                          ),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                              fontWeight:
                                              FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Résumé campagne",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                        color: const Color.fromARGB(
                                            255, 128, 131, 163)),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context)
                                        .size
                                        .width /
                                        1.3,
                                    child: TextField(
                                      controller:
                                      _eventDescriptionController,
                                      decoration: const InputDecoration(
                                        suffixIcon: Icon(
                                          Icons.mark_email_read_outlined,
                                          size: 18,
                                          color: Color.fromARGB(
                                              255, 128, 131, 163),
                                        ),
                                      ),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                          fontWeight:
                                          FontWeight.bold),
                                      onChanged: (text) {
                                        setState(() {
                                          eventDescription = text;
                                        });
                                      },
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Groupe clients",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                            color:
                                            const Color.fromARGB(
                                                255,
                                                128,
                                                131,
                                                163)),
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context)
                                            .size
                                            .width /
                                            3,
                                        child: TextField(
                                          readOnly: true,
                                          decoration: InputDecoration(
                                            hintText: "Sélection groupe",
                                            hintStyle: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                fontWeight:
                                                FontWeight.bold),
                                            suffixIcon: const Icon(
                                              Icons
                                                  .keyboard_arrow_down_rounded,
                                              size: 18,
                                              color: Color.fromARGB(
                                                  255, 128, 131, 163),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Text(
                                            "Ajouter fichiers destinataires (XLS, CSV) ",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                color: const Color
                                                    .fromARGB(255,
                                                    128, 131, 163)),
                                          ),
                                          Container(
                                            width: 35,
                                            height: 35,
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  255, 240, 238, 250),
                                              borderRadius:
                                              BorderRadiusDirectional
                                                  .circular(8),
                                            ),
                                            child: IconButton(
                                              icon: const Icon(
                                                Icons.more_horiz,
                                                size: 18,
                                                color: Color.fromARGB(
                                                    255, 107, 89, 204),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .pop();
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context)
                                            .size
                                            .width /
                                            3,
                                        child: TextField(
                                          readOnly: true,
                                          decoration: InputDecoration(
                                            hintText: "Sélection fichier",
                                            hintStyle: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                fontWeight:
                                                FontWeight.bold),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 100,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(8),
                                      color: const Color.fromARGB(
                                          255, 246, 246, 246),
                                    ),
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Annuler",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                            color:
                                            const Color.fromARGB(
                                                255,
                                                128,
                                                131,
                                                163)),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    width: 200,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(8),
                                      color: const Color.fromARGB(
                                          255, 107, 89, 204),
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        setState(() {
                                          ++pageId;
                                        });
                                      },
                                      child: Text(
                                        "Suivant",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                          : pageId == 1
                          ? Expanded(
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(40),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Rédiger message",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                          fontWeight:
                                          FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment:
                                        Alignment.topCenter,
                                        child: Container(
                                          height: 400,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(
                                                8),
                                            color:
                                            const Color.fromARGB(
                                                255,
                                                243,
                                                244,
                                                249),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          width: 100,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(
                                                8),
                                            color:
                                            const Color.fromARGB(
                                                255,
                                                246,
                                                246,
                                                246),
                                          ),
                                          child: TextButton(
                                            onPressed: () {
                                              setState(() {
                                                --pageId;
                                              });
                                            },
                                            child: Text(
                                              "Prédécent",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                  color: const Color
                                                      .fromARGB(
                                                      255,
                                                      128,
                                                      131,
                                                      163)),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Container(
                                          width: 200,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(
                                                8),
                                            color:
                                            const Color.fromARGB(
                                                255,
                                                107,
                                                89,
                                                204),
                                          ),
                                          child: TextButton(
                                            onPressed: () {
                                              setState(() {
                                                ++pageId;
                                              });
                                            },
                                            child: Text(
                                              "Suivant",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                  color: Colors
                                                      .white),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(50),
                              decoration: const BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                    color: Color.fromARGB(
                                        100, 158, 158, 158),
                                    width: 1.5,
                                  ),
                                ),
                              ),
                              width:
                              MediaQuery.of(context).size.width *
                                  0.2,
                              height:
                              MediaQuery.of(context).size.height -
                                  80,
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Liste shortcodes",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                        fontWeight:
                                        FontWeight.bold),
                                  ),
                                  const SizedBox(height: 50),
                                  Text(
                                    "#Name#",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                      color: const Color.fromARGB(
                                          255, 128, 131, 163),
                                    ),
                                  ),
                                  Text(
                                    "#Surname#",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                      color: const Color.fromARGB(
                                          255, 128, 131, 163),
                                    ),
                                  ),
                                  Text(
                                    "#Product#",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                      color: const Color.fromARGB(
                                          255, 128, 131, 163),
                                    ),
                                  ),
                                  Text(
                                    "#Deliverydate#",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                      color: const Color.fromARGB(
                                          255, 128, 131, 163),
                                    ),
                                  ),
                                  Text(
                                    "#Birthday#",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                      color: const Color.fromARGB(
                                          255, 128, 131, 163),
                                    ),
                                  ),
                                  Text(
                                    "#Discount#",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                      color: const Color.fromARGB(
                                          255, 128, 131, 163),
                                    ),
                                  ),
                                  Text(
                                    "#City#",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                      color: const Color.fromARGB(
                                          255, 128, 131, 163),
                                    ),
                                  ),
                                  Text(
                                    "#Email#",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                      color: const Color.fromARGB(
                                          255, 128, 131, 163),
                                    ),
                                  ),
                                  Text(
                                    "#Phone1#",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                      color: const Color.fromARGB(
                                          255, 128, 131, 163),
                                    ),
                                  ),
                                  Text(
                                    "#Phone2#",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                      color: const Color.fromARGB(
                                          255, 128, 131, 163),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                          : pageId == 2
                          ? Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Paramètres campagne",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                    fontWeight:
                                    FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Nom campagne",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                            color: const Color
                                                .fromARGB(
                                                255,
                                                128,
                                                131,
                                                163)),
                                      ),
                                      SizedBox(
                                        width:
                                        MediaQuery.of(context)
                                            .size
                                            .width /
                                            3,
                                        child: TextField(
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                              fontWeight:
                                              FontWeight
                                                  .bold),
                                        ),
                                      )
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Date campagne",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                            color: const Color
                                                .fromARGB(
                                                255,
                                                128,
                                                131,
                                                163)),
                                      ),
                                      SizedBox(
                                        width:
                                        MediaQuery.of(context)
                                            .size
                                            .width /
                                            6,
                                        child: TextField(
                                          decoration:
                                          InputDecoration(
                                            suffixIcon:
                                            GestureDetector(
                                              onTap: () =>
                                                  selectDate(
                                                      context),
                                              child: const Icon(
                                                Icons
                                                    .calendar_today,
                                                size: 18,
                                                color: Color
                                                    .fromARGB(
                                                    255,
                                                    128,
                                                    131,
                                                    163),
                                              ),
                                            ),
                                          ),
                                          readOnly: true,
                                          controller: TextEditingController(
                                              text: DateFormat(
                                                  'd/MM/yyyy')
                                                  .format(
                                                  selectedDate)),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                              fontWeight:
                                              FontWeight
                                                  .bold),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Heure campagne",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                            color: const Color
                                                .fromARGB(
                                                255,
                                                128,
                                                131,
                                                163)),
                                      ),
                                      SizedBox(
                                        width:
                                        MediaQuery.of(context)
                                            .size
                                            .width /
                                            6,
                                        child: TextField(
                                          decoration:
                                          InputDecoration(
                                            suffixIcon: InkWell(
                                              onTap: () {
                                                selectTime(
                                                    context);
                                              },
                                              child: const Icon(
                                                Icons
                                                    .watch_later_outlined,
                                                size: 18,
                                                color: Color
                                                    .fromARGB(
                                                    255,
                                                    128,
                                                    131,
                                                    163),
                                              ),
                                            ),
                                          ),
                                          readOnly: true,
                                          controller:
                                          TextEditingController(
                                            text: selectedTime
                                                .format(context),
                                          ),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                              fontWeight:
                                              FontWeight
                                                  .bold),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Résumé campagne",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                        color: const Color
                                            .fromARGB(255,
                                            128, 131, 163)),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context)
                                        .size
                                        .width /
                                        1.3,
                                    child: TextField(
                                      decoration:
                                      const InputDecoration(
                                        suffixIcon: Icon(
                                          Icons
                                              .mark_email_read_outlined,
                                          size: 18,
                                          color: Color.fromARGB(
                                              255, 128, 131, 163),
                                        ),
                                      ),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                          fontWeight:
                                          FontWeight
                                              .bold),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Ajouter fichiers destinataires (XLS, CSV) ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                            color: const Color
                                                .fromARGB(
                                                255,
                                                128,
                                                131,
                                                163)),
                                      ),
                                      Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                          color: const Color
                                              .fromARGB(
                                              255, 240, 238, 250),
                                          borderRadius:
                                          BorderRadiusDirectional
                                              .circular(8),
                                        ),
                                        child: IconButton(
                                          icon: const Icon(
                                            Icons.more_horiz,
                                            size: 18,
                                            color: Color.fromARGB(
                                                255,
                                                107,
                                                89,
                                                204),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pop();
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context)
                                        .size
                                        .width /
                                        3,
                                    child: TextField(
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        hintText:
                                        "Sélection fichier",
                                        hintStyle: Theme.of(
                                            context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                            fontWeight:
                                            FontWeight
                                                .bold),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const Spacer(),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 100,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(
                                          8),
                                      color: const Color.fromARGB(
                                          255, 246, 246, 246),
                                    ),
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Annuler",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                            color: const Color
                                                .fromARGB(
                                                255,
                                                128,
                                                131,
                                                163)),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    width: 200,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(
                                          8),
                                      color: const Color.fromARGB(
                                          255, 107, 89, 204),
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        openPromoWidgetDialog(
                                            context);
                                      },
                                      child: Text(
                                        "Suivant",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                            color:
                                            Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                          : Container()
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
