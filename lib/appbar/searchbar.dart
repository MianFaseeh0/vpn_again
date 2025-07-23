import 'package:flutter/material.dart';

class Searchbar extends StatelessWidget {
  const Searchbar({super.key});

  @override
  Widget build(context) {
    return SearchBar(
      hintText: 'Search For Country Or City',
      textStyle: const WidgetStatePropertyAll(
        TextStyle(
          fontFamily: 'gilroy',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Color(0x6600091F),
        ),
      ),
      trailing: [Icon(Icons.search, color: Color(0x6600091F))],
      shape: const WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
      elevation: const WidgetStatePropertyAll(0),
      backgroundColor: const WidgetStatePropertyAll(Color(0xFFFFFFFF)),
    );
  }
}
