import 'package:booker_app/presentation/book_list/widgets/search_widget.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: const Color.fromARGB(255, 193, 167, 146),
      //const Color(0XFFC7B29F),
      pinned: true,
      snap: true,
      floating: true,
      expandedHeight: 175,
      flexibleSpace: FlexibleSpaceBar(
        expandedTitleScale: 1,
        centerTitle: false,
        titlePadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
        title: const SearchWidget(),
        background: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          child: Image.asset(
            "assets/images/banner.jpeg",
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
