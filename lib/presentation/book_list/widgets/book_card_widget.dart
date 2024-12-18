import 'dart:ui';
import 'package:booker_app/core/fallback_fonts.dart';
import 'package:booker_app/data/model/book_model.dart';
import 'package:booker_app/presentation/book_details/view/book_details_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final Book book;

  const BookCard(this.book, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: 350,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Positioned(
            bottom: 0,
            child: Card(
              color: Colors.white,
              surfaceTintColor: Colors.amber,
              elevation: 6,
              child: Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.symmetric(vertical: 6),
                height: 125,
                width: MediaQuery.sizeOf(context).width - 75,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      book.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontFamilyFallback: FallbackFonts.list,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      book.authors.firstOrNull?.name ?? "Anonymous",
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontFamilyFallback: FallbackFonts.list,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 5,
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => BookDetailsView(book),
                ),
              ),
              child: Card(
                elevation: 10,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: CachedNetworkImage(
                    height: 250,
                    width: 165,
                    fit: BoxFit.fill,
                    imageUrl: book.formats.imageJpeg!,
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error_outline,
                    ),
                    placeholderFadeInDuration: const Duration(milliseconds: 1),
                    fadeOutDuration: const Duration(milliseconds: 500),
                    placeholder: (context, url) => ImageFiltered(
                      imageFilter: ImageFilter.blur(
                        sigmaX: 7,
                        sigmaY: 7,
                      ),
                      child: Image.asset(
                        "assets/images/book_placeholder.jpg",
                        height: 250,
                        width: 150,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
