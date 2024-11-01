import 'package:car_rental_ui/screens/Home%20Screen/Home_Widgets/car_container_list.dart';
import 'package:car_rental_ui/screens/Home%20Screen/Home_Widgets/header_widget.dart';
import 'package:car_rental_ui/screens/Home%20Screen/Home_Widgets/horizontal_list.dart';
import 'package:flutter/material.dart';

class HomeContent extends StatefulWidget {
  final String selectedBrand;
  final ValueChanged<String> onBrandSelected;

  const HomeContent({
    super.key,
    required this.selectedBrand,
    required this.onBrandSelected,
  });

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeaderWidget(),
        const SizedBox(height: 10),
        HorizontalList(
          onBrandSelected: widget.onBrandSelected,
        ),
        const SizedBox(height: 8),
        CarContainerList(selectedBrand: widget.selectedBrand),
      ],
    );
  }
}
