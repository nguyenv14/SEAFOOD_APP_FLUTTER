import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seafoods/localStorage/user_save.dart';
import 'package:seafoods/pages/orders/order_provider.dart';
import 'package:seafoods/widgets/item_order_widget.dart';

// class ConfirmPage extends StatefulWidget {
//   const ConfirmPage({super.key});

//   @override
//   State<ConfirmPage> createState() => _ConfirmPageState();
// }

// class _ConfirmPageState extends State<ConfirmPage> {
//   @override
//   Widget build(BuildContext context) {
//     print("haha");
//     return Container(
//       child: ListView.builder(
//         padding: EdgeInsets.zero,
//         itemCount: 4,
//         itemBuilder: (context, index) {
//           return new ItemOrderWidget();
//         },
//       ),
//     );
//   }
// }

class CancelPage extends StatefulWidget {
  const CancelPage({super.key});

  @override
  State<CancelPage> createState() => _CancelPageState();
}

class _CancelPageState extends State<CancelPage> {
  bool _isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      _isLoading = true;
    });
    Provider.of<OrderProvider>(context, listen: false)
        .fetchOrders(CustomerDB.getCustomer()!.customer_id, -1)
        .then((value) {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();

    // Pro
  }

  @override
  Widget build(BuildContext context) {
    final _orderList = Provider.of<OrderProvider>(context);
    final orderList = _orderList.orderList;
    return Container(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: orderList.length,
        itemBuilder: (context, index) {
          return new ItemOrderWidget(
            order: orderList[index],
            onTap: () {},
          );
        },
      ),
    );
  }
}

// class ConfirmPage extends StatelessWidget {
//   const ConfirmPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     bool isLoading = true;
//     final _orderList = Provider.of<OrderProvider>(context);
//     _orderList
//         .fetchOrders(CustomerDB.getCustomer()!.customer_id, 0)
//         .then((value) => isLoading = false);
//     final orderList = _orderList.orderList;
//     return Container(
//       child: ListView.builder(
//         padding: EdgeInsets.zero,
//         itemCount: orderList.length,
//         itemBuilder: (context, index) {
//           return new ItemOrderWidget();
//         },
//       ),
//     );
//   }
// }
