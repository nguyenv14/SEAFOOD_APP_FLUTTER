import 'package:flutter/material.dart';
import 'package:seafoods/widgets/item_order_widget.dart';

class ConfirmPage extends StatefulWidget {
  const ConfirmPage({super.key});

  @override
  State<ConfirmPage> createState() => _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> {
  @override
  Widget build(BuildContext context) {
    print("haha");
    return Container(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 4,
        itemBuilder: (context, index) {
          return new ItemOrderWidget();
        },
      ),
    );
  }
}
