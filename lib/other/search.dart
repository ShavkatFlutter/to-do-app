import 'package:flutter/material.dart';

class SearchData extends StatefulWidget {
  final String text;
  final void Function(String)? onChanged;
  final String? hintText;
  const SearchData({super.key, required this.text, this.onChanged, this.hintText});

  @override
  State<SearchData> createState() => _SearchDataState();
}

class _SearchDataState extends State<SearchData> {

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[800],
        border: Border.all(color: Colors.white),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          icon: const Icon(Icons.search),
          suffixIcon: widget.text.isNotEmpty
          ? GestureDetector(
            child: Icon(Icons.close),
            onTap: (){
              controller.clear();
              widget.onChanged!("");
              FocusScope.of(context).requestFocus(FocusNode());
            },
          ) : null,
          hintText: "Search",
        ),
        onChanged: widget.onChanged,
      ),
    );
  }
}
