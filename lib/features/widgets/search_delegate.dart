import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/utils/resources/resources.dart';
import 'package:rick_and_morty/features/widgets/grid_list_item.dart';

class SearchCharacter extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, "");
      },
      icon: const Icon(Icons.arrow_back_ios),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text('Результаты поиска для "$query"'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) {
            return const GridItem(
                img: Images.rick,
                status: "Alive",
                name: "Rick Sanchez",
                species: "Human",
                gender: "Male");
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 24,
            );
          },
          itemCount: 5),
    );
  }
}
