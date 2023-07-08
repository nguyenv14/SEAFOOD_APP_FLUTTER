import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seafoods/localStorage/user_save.dart';
import 'package:seafoods/pages/evaluate/evaluate_page.dart';
import 'package:seafoods/pages/orders/order_provider.dart';
import 'package:seafoods/widgets/item_order_widget.dart';

class DeliveriedPage extends StatefulWidget {
  const DeliveriedPage({super.key});

  @override
  State<DeliveriedPage> createState() => _DeliveriedPageState();
}

class _DeliveriedPageState extends State<DeliveriedPage> {
  bool _isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      _isLoading = true;
    });
    Provider.of<OrderProvider>(context, listen: false)
        .fetchOrders(CustomerDB.getCustomer()!.customer_id, 4)
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
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EvaluatePage(
                            order: orderList[index],
                          ))).then((value) => _orderList.fetchOrders(
                  CustomerDB.getCustomer()!.customer_id, 4));
            },
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
