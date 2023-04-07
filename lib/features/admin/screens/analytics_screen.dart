import 'package:amazon_clone_tutorial/common/widgets/custom_button.dart';
import 'package:amazon_clone_tutorial/common/widgets/loader.dart';
import 'package:amazon_clone_tutorial/features/account/services/account_services.dart';
import 'package:amazon_clone_tutorial/features/admin/models/sales.dart';
import 'package:amazon_clone_tutorial/features/admin/service/admin_service.dart';
import 'package:amazon_clone_tutorial/features/admin/widgets/category_product_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  final AdminService adminService = AdminService();
  int? totalSales;
  List<Sales>? earnings;

  @override
  void initState() {
    super.initState();
    getEarnings();
  }

  getEarnings() async {
    var earningData = await adminService.getEarnings(context);
    totalSales = earningData['totalEarnings'];
    earnings = earningData['sales'];
    setState(() {});
    print('${earnings![0].label} : ${earnings![0].earning}');
  }

  final AccountServices accountServices = AccountServices();
  void logOut() {
    accountServices.logOut(context);
  }

  @override
  Widget build(BuildContext context) {
    return earnings == null || totalSales == null
        ? const Loader()
        : Column(
            children: [
              Text(
                '\$$totalSales',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              CategoryProductsChart(data: earnings!),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                  onTap: () {
                    logOut();
                  },
                  text: 'Log Out')
            ],
          );
  }
}
