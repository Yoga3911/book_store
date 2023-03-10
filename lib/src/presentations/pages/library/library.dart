import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:test_nusantara/src/data/models/book/book_model.dart';
import 'package:test_nusantara/src/presentations/providers/book/book_provider.dart';
import 'package:test_nusantara/src/routes/route.dart';
import 'package:test_nusantara/src/widgets/item_list_tile.dart';

import '../../../core/app_color.dart';
import '../../../data/storage/storage.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BookProvider(),
      builder: (ctx, __) {
        final prov = ctx.read<BookProvider>();
        return FutureBuilder<List<BookModel>>(
          future: prov.getAll(),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColor.primary,
                ),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, idx) {
                final book = snapshot.data?[idx];
                return AppItemListTile(
                  onTap: () => Navigator.pushNamed(
                    context,
                    Routes.edit,
                    arguments: book,
                  ),
                  onDelete: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        backgroundColor: AppColor.black,
                        title: Text(
                          "Warning!",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        content: Text(
                          "Are you sure want delete this book?",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 14.sp,
                          ),
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.grey,
                            ),
                            child: Text(
                              "Cancel",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              prov.delete(bookId: book?.id ?? 0).then(
                                (value) async {
                                  if (value) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          "Delete book success",
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
                            },
                            child: Text(
                              "Yes",
                              style: GoogleFonts.poppins(
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  title: book?.title ?? "",
                  subtitle: book?.subtitle ?? "",
                );
              },
            );
          },
        );
      },
    );
  }
}
