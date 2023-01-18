import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_nusantara/src/core/no_glow.dart';
import 'package:test_nusantara/src/data/models/book/add_book_model.dart';
import 'package:test_nusantara/src/presentations/providers/book/add_book_provider.dart';
import 'package:test_nusantara/src/routes/route.dart';
import 'package:test_nusantara/src/widgets/book_text_field.dart';

import '../../../core/app_color.dart';
import '../../../data/storage/storage.dart';

class AddBookPage extends StatefulWidget {
  const AddBookPage({super.key});

  @override
  State<AddBookPage> createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  final formKey = GlobalKey<FormState>();

  DateTime? now = DateTime.now();
  Future<void> selectDate() async {
    now = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.parse("2000-12-12"),
      lastDate: DateTime.parse("2100-12-12"),
    );
  }

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
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: TextFormField(
                        readOnly: true,
                        validator: (value) {
                          if (value == "") {
                            return "Field can't null";
                          }
                          return null;
                        },
                        controller: prov.publishedController,
                        cursorColor: AppColor.primary,
                        decoration: InputDecoration(
                          hintText: "Published",
                          suffixIcon: IconButton(
                            onPressed: () {
                              selectDate().then((value) {
                                prov.publishedController.text = now.toString();
                              });
                            },
                            icon: const Icon(Icons.calendar_month),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: const BorderSide(
                              color: AppColor.primary,
                            ),
                          ),
                          isDense: true,
                          contentPadding: EdgeInsets.all(20.h),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
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
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "Insert book success",
                                    ),
                                    backgroundColor: Colors.green,
                                  ),
                                );
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
