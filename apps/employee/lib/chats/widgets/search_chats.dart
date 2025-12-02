import 'package:flutter/material.dart';
import 'package:theme/theming/colors/light_colors.dart';

class SearchChats extends StatelessWidget {
  const SearchChats({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'البحث في المحادثات....',
        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Colors.grey
        ),
        suffixIcon: Icon(Icons.search,color: Colors.grey,),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
                color: Colors.grey

            )
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Colors.grey

          )
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
                color: LightColors.blow,
              width: 1.5
            )
        )
      ),
      
    );
  }
}
