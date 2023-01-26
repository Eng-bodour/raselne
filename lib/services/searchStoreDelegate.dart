


import 'package:flutter/material.dart';

import '../view_presentation/widget/store/store_list_build.dart';

class searchStore extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
   return [
     IconButton(
       icon: Icon(Icons.close),
       onPressed: (){

        query='';
       },)
   ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return
      IconButton(
        icon: Icon(Icons.arrow_back_rounded),
        onPressed: (){
          close(context, null);
        },);
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return StoreListBuild(
      type: '',
      search: query,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    // throw UnimplementedError();
    return Text('');

  }
  
  
  
}