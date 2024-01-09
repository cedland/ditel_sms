import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';

class FilePickerDemo extends StatefulWidget {
  const FilePickerDemo({super.key, required this.title});

  final String title;

  @override
  State<FilePickerDemo> createState() => _FilePickerDemoState();
}

class _FilePickerDemoState extends State<FilePickerDemo> {
  FilePickerResult? result;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("File picker demo"),
        ),
        body: Container(
          width: 505,
          color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (result != null)
                Container(
                  width: 120,
                  height: 40,
                  color: Colors.pink,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /*const Text(
                          'Selected file:',
                          style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10,),*/
                        ListView.separated(
                          shrinkWrap: true,
                          itemCount: result?.files.length ?? 0,
                          itemBuilder: (context, index) {
                            return Text(result?.files[index].name ?? '',
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold));
                          }, separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 5,);
                        },)
                      ],
                    ),
                  ),
                ),
              const Spacer(),
              GestureDetector(
                onTap: () async{
                  result =
                  await FilePicker.platform.pickFiles(allowMultiple: true);
                  if (result == null) {
                    print("No file selected");
                  } else {
                    setState(() {});
                    for (var element in result!.files) {
                      print(element.name);
                    }
                  }
                },
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: TColors.bg,
                        width: 1
                    ),
                    borderRadius: BorderRadius.circular(8),
                    color: TColors.txtbouttongrey,
                  ),
                  child: const Icon(Icons.more_horiz,size: 18,color: TColors.bgboutton,),

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}