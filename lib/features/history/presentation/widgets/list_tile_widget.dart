import 'package:eco_market_app/config/config.dart';
import 'package:flutter/material.dart';

class ListTileleWidget extends StatelessWidget {
  const ListTileleWidget({
    Key? key,
    required this.leading,
    required this.title,
    required this.subtitle,
    required this.trailing,
    this.onTap,
    required this.itemCount,
  }) : super(key: key);
  final Widget leading;

  final String title;
  final String subtitle;
  final String trailing;
  final Function()? onTap;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: itemCount,
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        height: 8,
      ),
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          onTap: onTap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          tileColor: AppColors.lightGrey,
          leading: leading,
          title: Text(
            title,
            style: const TextStyle(
              color: Color(0xFF1E1E1E),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: const TextStyle(
              color: AppColors.darkGrey,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          trailing: Text(
            trailing,
            style: const TextStyle(
              color: AppColors.green,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
        );
      },
    );
  }
}
