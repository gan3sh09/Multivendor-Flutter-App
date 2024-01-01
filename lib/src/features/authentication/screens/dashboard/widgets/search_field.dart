import 'package:flutter/material.dart';
import 'package:market_hub/src/features/authentication/screens/dashboard/widgets/search_widget.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/size_config.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: SizeConfig.screenWidth * 0.6,
      // height: 50,
      decoration: BoxDecoration(
        color: secondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        onChanged: (val) {
          // search value
          showSearch(
            context: context,
            delegate: MySearchDelegate(),
          );
        },
        decoration: InputDecoration(
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: "Search Product",
            prefixIcon: const Icon(Icons.search),
            contentPadding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
              vertical: getProportionateScreenWidth(14),
            )),
      ),
    );
  }
}
