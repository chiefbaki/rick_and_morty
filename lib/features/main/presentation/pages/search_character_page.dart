import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rick_and_morty/core/utils/extensions/colors.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_colors.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_fonts.dart';
import 'package:rick_and_morty/core/utils/resources/resources.dart';

class SearchCharacter extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      textTheme: TextTheme(headline6: AppFonts.s12w400),
      inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.textFieldColor,
          hintStyle: AppFonts.s16w400.copyWith(color: AppColors.grey),
          contentPadding: const EdgeInsets.symmetric(),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.textFieldColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.textFieldColor),
          )),
      appBarTheme: AppBarTheme(
          backgroundColor:
              AppColors.textFieldColor, // Customize app bar background color
          elevation: 0, // Remove app bar elevation
          iconTheme:
              const IconThemeData(color: Colors.white), // Customize icon color
          titleTextStyle: AppFonts.s12w400.copyWith(color: AppColors.grey)),
    );
  }

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
        FocusManager.instance.primaryFocus?.unfocus();
        close(context, "");
      },
      icon: const Icon(Icons.arrow_back_ios),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 23),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Результаты поиска",
            style: AppFonts.s10w500.copyWith(color: AppColors.grey),
          ),
          const SizedBox(
            height: 24,
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.asset(
                      Images.rick,
                      width: 84,
                    ),
                    title: Text(
                      "Alive",
                      style: AppFonts.s10w500
                          .copyWith(color: setColor(text: "Alive")),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Rick",
                          style:
                              AppFonts.s16w500.copyWith(color: AppColors.white),
                        ),
                        Text(
                          "Human, Male",
                          style:
                              AppFonts.s12w400.copyWith(color: AppColors.grey),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 24,
                  );
                },
                itemCount: 5),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 23),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Результаты поиска",
            style: AppFonts.s10w500.copyWith(color: AppColors.grey),
          ),
          const SizedBox(
            height: 24,
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.asset(
                      Images.rick,
                      width: 84,
                    ),
                    title: Text(
                      "Alive",
                      style: AppFonts.s10w500
                          .copyWith(color: setColor(text: "Alive")),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Rick",
                          style:
                              AppFonts.s16w500.copyWith(color: AppColors.white),
                        ),
                        Text(
                          "Human, Male",
                          style:
                              AppFonts.s12w400.copyWith(color: AppColors.grey),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 24,
                  );
                },
                itemCount: 5),
          ),
        ],
      ),
    );
  }
}
