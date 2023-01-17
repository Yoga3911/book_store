import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_nusantara/src/core/no_glow.dart';
import 'package:test_nusantara/src/data/models/book/add_book_model.dart';
import 'package:test_nusantara/src/presentations/providers/book/add_book_provider.dart';
import 'package:test_nusantara/src/routes/route.dart';
import 'package:test_nusantara/src/widgets/book_text_field.dart';

import '../../../data/storage/storage.dart';

class AddBookPage extends StatefulWidget {
  const AddBookPage({super.key});

  @override
  State<AddBookPage> createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Book"),
        elevation: 0,
      ),
      body: ScrollConfiguration(
        behavior: NoGlow(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Form(
            key: formKey,
            child: ChangeNotifierProvider(
              create: (_) => AddBookProvider(),
              builder: (ctx, __) {
                final prov = ctx.read<AddBookProvider>();
                return ListView(
                  children: [
                    AppBookTextField(
                      hint: "ISBN",
                      controller: prov.isbnController,
                    ),
                    AppBookTextField(
                      hint: "Title",
                      controller: prov.titleController,
                    ),
                    AppBookTextField(
                      hint: "Subtitle",
                      controller: prov.subtitleController,
                    ),
                    AppBookTextField(
                      hint: "Author",
                      controller: prov.authorController,
                    ),
                    AppBookTextField(
                      hint: "Published",
                      controller: prov.publishedController,
                    ),
                    AppBookTextField(
                      hint: "Publisher",
                      controller: prov.publisherController,
                    ),
                    AppBookTextField(
                      hint: "Pages",
                      controller: prov.pagesController,
                    ),
                    AppBookTextField(
                      hint: "Description",
                      controller: prov.descriptionController,
                    ),
                    AppBookTextField(
                      hint: "Website",
                      controller: prov.websiteController,
                    ),
                    SizedBox(height: 10.h),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          final pages = int.tryParse(prov.pagesController.text);
                          prov
                              .insert(
                            model: AddBookModel(
                              isbn: prov.isbnController.text,
                              title: prov.titleController.text,
                              subtitle: prov.subtitleController.text,
                              author: prov.authorController.text,
                              published: prov.publishedController.text,
                              publisher: prov.publisherController.text,
                              pages: pages,
                              description: prov.descriptionController.text,
                              website: prov.websiteController.text,
                            ),
                          )
                              .then(
                            (value) async {
                              if (value) {
                                return Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  Routes.main,
                                  (route) => false,
                                );
                              }

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    await AppStorage.load("error"),
                                  ),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            },
                          );
                        }
                      },
                      child: const Text("Insert"),
                    ),
                    SizedBox(height: 10.h),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
