import 'package:flutter/material.dart';

import '../../../services/searchStoreDelegate.dart';

class SearchFormText extends StatelessWidget {
  const SearchFormText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      //controller: controller.searchTextController,
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      onChanged: (searchName) {
       // showSearch(context: context, delegate: searchStore());
        // controller.addSearchToList(searchName);
      },
      onTap: (){
        showSearch(context: context, delegate: searchStore());
        // controller.addSearchToList(searchName);
      },
      decoration: InputDecoration(
        fillColor: Colors.white,
        focusColor: Colors.red,
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.grey,
        ),
        suffixIcon:
            //  controller.searchTextController.text.isNotEmpty
            //     ?
            IconButton(
          onPressed: () {

            //  controller.clearSearch();
          },
          icon: const Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
        // : null,
        hintText: "Search with name & price",
        hintStyle: const TextStyle(
          color: Colors.black45,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
