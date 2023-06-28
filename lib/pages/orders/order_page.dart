import 'package:flutter/material.dart';
import 'package:seafoods/Constant/colors.dart';
import 'package:seafoods/pages/container/app_bar_widget.dart';
import 'package:seafoods/pages/orders/confirm/confirm_page.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      implementBack: false,
      implementOrder: true,
      implementCart: true,
      scaffoldKey: _scaffoldKey,
      titleString: "My Order",
      tabBar: TabBar(
          dividerColor: AppColor.mainColor,
          indicatorColor: AppColor.mainColor,
          labelColor: AppColor.mainColor,
          controller: _tabController,
          tabs: [
            Tab(
              text: 'Xác nhận',
            ),
            Tab(
              text: 'Đang giao',
            ),
            Tab(
              text: 'Đã giao',
            ),
            Tab(
              text: 'Đã hủy',
            ),
          ]),
      child: Container(
        margin: EdgeInsets.only(top: 30),
        child: TabBarView(
          controller: _tabController,
          children: [
            new ConfirmPage(),
            new ConfirmPage(),
            new ConfirmPage(),
            new ConfirmPage(),
          ],
        ),
      ),
    );
  }
}
