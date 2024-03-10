// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:rick_and_morty/core/utils/extensions/colors.dart';
// import 'package:rick_and_morty/core/utils/extensions/theme/src/app_colors.dart';
// import 'package:rick_and_morty/core/utils/extensions/theme/src/app_fonts.dart';
// import 'package:rick_and_morty/core/utils/resources/resources.dart';
// import 'package:rick_and_morty/features/main/data/character_model.dart';
// import 'package:rick_and_morty/features/main/presentation/cubits/character_cubit.dart';
// import 'package:rick_and_morty/features/main/presentation/cubits/character_state.dart';

// class SearchCharacter extends SearchDelegate {
  

//   @override
//   ThemeData appBarTheme(BuildContext context) {
//     final ThemeData theme = Theme.of(context);
//     return theme.copyWith(
//       textTheme: const TextTheme(headline6: AppFonts.s16w400),
//       inputDecorationTheme: InputDecorationTheme(
//           filled: true,
//           fillColor: AppColors.textFieldColor,
//           hintStyle: AppFonts.s16w400.copyWith(color: AppColors.grey),
//           contentPadding: const EdgeInsets.symmetric(),
//           enabledBorder: const OutlineInputBorder(
//             borderSide: BorderSide(color: AppColors.textFieldColor),
//           ),
//           focusedBorder: const OutlineInputBorder(
//             borderSide: BorderSide(color: AppColors.darkTheme),
//           )),
//       appBarTheme: AppBarTheme(
//           backgroundColor:
//               AppColors.textFieldColor, // Customize app bar background color
//           elevation: 0, // Remove app bar elevation
//           iconTheme:
//               const IconThemeData(color: Colors.white), // Customize icon color
//           titleTextStyle: AppFonts.s12w400.copyWith(color: AppColors.grey)),
//     );
//   }

//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//           onPressed: () {
//             query = '';
//           },
//           icon: const Icon(Icons.clear))
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//       onPressed: () {
//         FocusManager.instance.primaryFocus?.unfocus();
//         close(context, "");
//       },
//       icon: const Icon(Icons.arrow_back_ios),
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
    
//     if (query.isNotEmpty) {
//       print(query);
//       String text = query;
//       // BlocProvider.of<CharacterCubit>(context).getCharacterResults(text);
//       return Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 23),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Результаты поиска",
//               style: AppFonts.s10w500.copyWith(color: AppColors.grey),
//             ),
//             const SizedBox(
//               height: 24,
//             ),
//             BlocBuilder<CharacterCubit, CharacterState>(
//               builder: (context, state) {
                
//                 if (state is CharacterLoading) {
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 } else if (state is CharacterSuccess) {
                  
//                   return Expanded(
//                     child: ListView.separated(
//                         itemBuilder: (context, index) {
//                           return ListTile(
//                             leading: Image.network(
//                               state.results?[index].image ?? "",
//                               width: 84,
//                             ),
//                             title: Text(
//                               state.results?[index].status ?? "",
//                               style: AppFonts.s10w500
//                                   .copyWith(color: setColor(text: "Alive")),
//                             ),
//                             subtitle: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   state.results?[index].name ?? "",
//                                   style: AppFonts.s16w500
//                                       .copyWith(color: AppColors.white),
//                                 ),
//                                 Text(
//                                   state.results?[index].species ?? "",
//                                   style: AppFonts.s12w400
//                                       .copyWith(color: AppColors.grey),
//                                 ),
//                               ],
//                             ),
//                           );
//                         },
//                         separatorBuilder: (context, index) {
//                           return const SizedBox(
//                             height: 24,
//                           );
//                         },
//                         itemCount: state.results?.length ?? 0),
//                   );
//                 } else if (state is CharacterError) {
//                   print(state.error.toUpperCase());
//                 }
//                 return const SizedBox.shrink();
//               },
//             ),
//           ],
//         ),
//       );
//     } else {
//       return Container();
//     }
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return const Center(
//       child: Text("suggested"),
//     );
//   }
// }
