import 'dart:ui';
import 'package:booker_app/core/fallback_fonts.dart';
import 'package:booker_app/data/model/book_model.dart';
import 'package:booker_app/presentation/book_details/widgets/custom_list_tile_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:language_code/language_code.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView(this.bookData, {super.key});

  final Book bookData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/book_placeholder.jpg"),
                fit: BoxFit.fill,
              ),
            ),
            height: MediaQuery.of(context).size.height,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.40),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).padding.top,
              horizontal: 24,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.32,
                  child: Material(
                    borderRadius: BorderRadius.circular(12),
                    elevation: 7,
                    clipBehavior: Clip.antiAlias,
                    child: CachedNetworkImage(
                      imageUrl: bookData.formats.imageJpeg!,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  bookData.title,
                  textScaler: TextScaler.linear(
                    bookData.title.length > 40 ? 0.85 : 1,
                  ),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 26,
                    color: Colors.amberAccent,
                    fontFamily: 'Roboto',
                    fontFamilyFallback: FallbackFonts.list,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 18),
                CustomListTileWidget(
                  "Author",
                  bookData.authors.map(
                    (e) => Text("${e.name} (${e.birthYear} - ${e.deathYear})"),
                  ),
                ),
                CustomListTileWidget(
                  "Languages",
                  bookData.languages.map(
                    (e) => Text(LanguageCodes.fromCode(e).englishName),
                  ),
                ),
                CustomListTileWidget(
                  "Subjects",
                  bookData.subjects.map((e) => Text(e)),
                ),
                CustomListTileWidget(
                  "Bookshelves",
                  bookData.bookshelves.map((e) => Text(e)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
