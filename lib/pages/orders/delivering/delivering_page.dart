import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seafoods/localStorage/user_save.dart';
import 'package:seafoods/pages/orders/order_provider.dart';
import 'package:seafoods/widgets/item_order_widget.dart';

class DeliveringPage extends StatefulWidget {
  const DeliveringPage({super.key});

  @override
  State<DeliveringPage> createState() => _DeliveringPageState();
}

class _DeliveringPageState extends State<DeliveringPage> {
  bool _isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      _isLoading = true;
    });
    Provider.of<OrderProvider>(context, listen: false)
        .fetchOrders(CustomerDB.getCustomer()!.customer_id, 1)
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
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Colors.white,
                      elevation: 0,
                      title: Text("Thông báo"),
                      content: Text(
                          "Bạn đã nhận hàng thành công? Lưu ý bạn sẽ không hoàn đơn hàng lại được!"),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("No",
                                style: TextStyle(color: Colors.black38))),
                        TextButton(
                            onPressed: () {
                              _orderList
                                  .orderReceive(orderList[index].orderCode!);
                              Navigator.of(context).pop();
                              CherryToast.success(
                                      title: Text(
                                          "Đã xác nhận đơn hàng giao thành công"))
                                  .show(context);
                            },
                            child: Text(
                              "Yes",
                              style: TextStyle(color: Colors.redAccent),
                            ))
                      ],
                    );
                  });
            },
          );
        },
      ),
    );
  }
}
