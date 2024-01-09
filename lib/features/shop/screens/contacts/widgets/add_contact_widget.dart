import 'package:flutter/material.dart';

import 'add_contact_field.dart';

class AddContact2 extends StatefulWidget {
  const AddContact2({super.key});

  @override
  State<AddContact2> createState() => AddContact2State();
}

class AddContact2State extends State<AddContact2> {
  var isSearchExpanded = false;
  var pageId = 0;

  void openWidget(BuildContext context) {
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
            height: MediaQuery.of(context).size.width / 4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Import contact",
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
                          border: Border.all(width: 0.1)
                      ),
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
                Text(
                    "Import your contacts from XLS or CSV files. Make sure to follow the conditions.",
                    style: Theme.of(context).textTheme.bodySmall
                ),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Importer contacts (XLS, CSV)",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: const Color.fromARGB(255, 128, 131, 163),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Sélection fichier",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.bold)),
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 240, 238, 250),
                            borderRadius: BorderRadiusDirectional.circular(8),

                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.more_horiz,
                              size: 18,
                              color: Color.fromARGB(255, 107, 89, 204),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        )
                      ],
                    )
                  ],
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
                              color:
                              const Color.fromARGB(255, 128, 131, 163)),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          //const DrawerWeb(),
          Expanded(
            child: Column(
              children: [
                Container(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Row(
                              children: [
                                Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: const Color.fromARGB(
                                          100, 158, 158, 158),
                                      width: 0.5,
                                    ),
                                  ),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.menu,
                                      size: 18,
                                      color: Color.fromARGB(255, 128, 131, 163),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Ajouter un nouveau contact',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color:
                                  const Color.fromARGB(100, 158, 158, 158),
                                  width: 0.5,
                                ),
                              ),
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.person_add,
                                  color: Color.fromARGB(255, 128, 131, 163),
                                  size: 18,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const SizedBox(
                              height: 25,
                              child: VerticalDivider(
                                color: Color.fromARGB(255, 236, 238, 245),
                                width: 5,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: const Color.fromARGB(
                                        100, 158, 158, 158),
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
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.search,
                                        color:
                                        Color.fromARGB(255, 128, 131, 163),
                                        size: 18,
                                      ),
                                    ),
                                    if (isSearchExpanded)
                                      Container(
                                        margin: const EdgeInsets.only(left: 36),
                                        width: 400,
                                        child: const TextField(),
                                      ),
                                  ],
                                ),
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
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color.fromARGB(
                                          255, 236, 238, 245),
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.cloud_upload,
                                        color:
                                        Color.fromARGB(255, 128, 131, 163),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "John Doe",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  Text(
                                    "Developer",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                        color: const Color.fromARGB(
                                            255, 128, 131, 163),
                                        fontSize: 12),
                                  )
                                ],
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
                                            "Information générales",
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
                                            "Photo, nom, adresse",
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
                                            "Information générales",
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
                                            "Photo, nom, adresse",
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
                                      Icons.notifications,
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
                                          "Contact",
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
                                          "N° tel, email",
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
                                      Icons.notifications,
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
                                          "Contact",
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
                                          "N° tel, email",
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
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 250,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: const Color.fromARGB(
                                          255, 107, 89, 204),
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        openWidget(context);
                                      },
                                      child: Text(
                                        "Import contacts XLS, CSV",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      pageId == 0
                          ? Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          height: MediaQuery.of(context).size.height - 80,
                          child: Column(
                            children: [
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      "Information contact",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                          fontWeight:
                                          FontWeight.bold),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            AddContactField(
                                                fieldName: "Civilité",
                                                icon: Icons.person),
                                            AddContactField(
                                                fieldName: "Entreprise",
                                                icon: Icons.domain),
                                            AddContactField(
                                                fieldName:
                                                "Date naissance",
                                                icon:
                                                Icons.calendar_month),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            AddContactField(
                                                fieldName: "Nom prénom",
                                                icon: Icons.person),
                                            AddContactField(
                                                fieldName: "Fonction",
                                                icon: Icons
                                                    .record_voice_over_rounded),
                                            AddContactField(
                                                fieldName:
                                                "Groupe clients",
                                                icon: Icons
                                                    .keyboard_arrow_down_rounded),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      "Adresse",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                          fontWeight:
                                          FontWeight.bold),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            AddContactField(
                                                fieldName: "Addresse",
                                                icon: Icons.location_on),
                                            AddContactField(
                                                fieldName: "Code postal",
                                                icon: Icons.location_on),
                                            /*Row(
                                              children: [

                                                AddContactField(
                                                    fieldName: "Ville",
                                                    icon: Icons.location_on),
                                              ],
                                            )*/
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            AddContactField(
                                                fieldName: "Complément",
                                                icon: Icons.location_on),
                                            AddContactField(
                                                fieldName: "Pays",
                                                icon: Icons
                                                    .keyboard_arrow_down_rounded),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Row(
                                    children: [
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
                                          onPressed: () {},
                                          child: Text(
                                            "Enregister",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      Container(
                                        width: 100,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 236, 238, 245),
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(8),
                                          color: Colors.white,
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
                                                  255, 128, 131, 163),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                          : Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          height: MediaQuery.of(context).size.height - 80,
                          child: Column(
                            children: [
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      "Email & Tel",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                          fontWeight:
                                          FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        const Expanded(
                                          child: Column(
                                            children: [
                                              AddContactField(
                                                  fieldName: "Email",
                                                  icon: Icons.mail),
                                              AddContactField(
                                                  fieldName: "Tel",
                                                  icon: Icons.phone),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 50,
                                        ),
                                        Expanded(
                                          child: Container(
                                            padding:
                                            const EdgeInsets.only(
                                                top: 20),
                                            child: Column(
                                              children: [
                                                Container(
                                                  padding:
                                                  const EdgeInsets
                                                      .only(
                                                      bottom: 5),
                                                  child: Row(children: [
                                                    const Icon(
                                                      Icons.add_circle,
                                                      color:
                                                      Color.fromARGB(
                                                          255,
                                                          128,
                                                          131,
                                                          163),
                                                      size: 18,
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    Text(
                                                      "Ajouter email",
                                                      style: Theme.of(
                                                          context)
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
                                                  ]),
                                                ),
                                                const SizedBox(
                                                    height: 50),
                                                Container(
                                                  child: Row(children: [
                                                    const Icon(
                                                      Icons.add_circle,
                                                      color:
                                                      Color.fromARGB(
                                                          255,
                                                          128,
                                                          131,
                                                          163),
                                                      size: 18,
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    Text(
                                                      "Ajouter un numéro",
                                                      style: Theme.of(
                                                          context)
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
                                                  ]),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      "Email & Tel",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                          fontWeight:
                                          FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    child: const Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            children: [
                                              AddContactField(
                                                  fieldName: "Social",
                                                  icon: Icons
                                                      .keyboard_arrow_down_rounded),
                                              AddContactField(
                                                  fieldName: "Social",
                                                  icon: Icons
                                                      .keyboard_arrow_down_rounded),
                                              AddContactField(
                                                  fieldName: "Social",
                                                  icon: Icons
                                                      .keyboard_arrow_down_rounded),
                                              AddContactField(
                                                  fieldName: "Social",
                                                  icon: Icons
                                                      .keyboard_arrow_down_rounded),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 50,
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              AddContactField(
                                                  fieldName: "Lien",
                                                  icon: Icons.link),
                                              AddContactField(
                                                  fieldName: "Lien",
                                                  icon: Icons.link),
                                              AddContactField(
                                                  fieldName: "Lien",
                                                  icon: Icons.link),
                                              AddContactField(
                                                  fieldName: "Lien",
                                                  icon: Icons.link),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Row(
                                    children: [
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
                                          onPressed: () {},
                                          child: Text(
                                            "Enregister",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      Container(
                                        width: 100,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 236, 238, 245),
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(8),
                                          color: Colors.white,
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
                                                  255, 128, 131, 163),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
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
