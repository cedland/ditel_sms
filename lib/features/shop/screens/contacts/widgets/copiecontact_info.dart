import 'package:flutter/material.dart';

import '../../../../../classes/contact.dart';


class ContactInfo extends StatelessWidget {
  const ContactInfo(
      {super.key, required this.contact, required this.onClosePressed});

  final Contact contact;
  final VoidCallback onClosePressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.3),
        width: MediaQuery.of(context).size.width * 0.25,
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildLabel("", context),
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.network(
                          contact.image,
                          width: 90,
                          height: 90,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: const Color.fromARGB(255, 236, 238, 245),
                            width: 1,
                          ),
                        ),
                        child: IconButton(
                          onPressed: onClosePressed,
                          icon: const Icon(
                            Icons.close,
                            color: Color.fromARGB(255, 128, 131, 163),
                            size: 18,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildLabel("", context),
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    contact.name,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildLabel("", context),
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    contact.function,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: const Color.fromARGB(255, 128, 131, 163)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildLabel("", context),
                Container(
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 107, 89, 204),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextButton.icon(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(16),
                          ),
                          icon: const Icon(
                            Icons.mail,
                            color: Colors.white,
                            size: 16,
                          ),
                          label: Text(
                            "Message",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      _buildRowIcon(Icons.edit),
                      const SizedBox(
                        width: 5,
                      ),
                      _buildRowIcon(Icons.drive_folder_upload),
                      const SizedBox(
                        width: 5,
                      ),
                      _buildRowIcon(Icons.delete),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildLabel("Tel", context),
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Text(
                        contact.phoneNumber[0],
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 243, 244, 249),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Défaut",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                              color:
                              const Color.fromARGB(255, 128, 131, 163),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildLabel("Email", context),
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  alignment: Alignment.centerLeft,
                  child: Text(contact.email,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildLabel("Groupe", context),
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  alignment: Alignment.centerLeft,
                  child: Text(contact.group,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildLabel("Enterprise", context),
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  alignment: Alignment.centerLeft,
                  child: Text(contact.business,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildLabel("Adresse", context),
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  alignment: Alignment.centerLeft,
                  child: Text(contact.address,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildLabel("Complément", context),
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  alignment: Alignment.centerLeft,
                  child: Text(contact.complement,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildLabel("Code postal", context),
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  alignment: Alignment.centerLeft,
                  child: Text(contact.postalCode,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildLabel("Ville", context),
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  alignment: Alignment.centerLeft,
                  child: Text(contact.city,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildLabel("Pays", context),
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  alignment: Alignment.centerLeft,
                  child: Text(contact.country,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildLabel("Commentaire", context),
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  alignment: Alignment.centerLeft,
                  child: Text(contact.comment,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildLabel(String label, context) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.1,
    alignment: Alignment.centerRight,
    child: Text(
      label,
      style: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(color: const Color.fromARGB(255, 128, 131, 163)),
    ),
  );
}

Widget _buildRowIcon(IconData icon) {
  return Container(
    height: 30,
    width: 30,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(
        color: Colors.grey[300]!,
        width: 0.5,
      ),
    ),
    child: IconButton(
      onPressed: () {},
      icon: Icon(
        icon,
        size: 14,
        color: Colors.grey,
      ),
    ),
  );
}
