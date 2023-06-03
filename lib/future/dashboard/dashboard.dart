import 'package:flutter/material.dart';

import 'components/custom_text.dart';
import 'components/stat_Card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with TickerProviderStateMixin {
  bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 924;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff171932),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Row(
      children: [
        // sol menü alanı
        _buildLeftMenu(),
        Expanded(
          flex: 8,
          child: Column(
            children: [
              // Header alanı
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.green,
                ),
              ),
              // Dashboard alanı başlangıcı
              Expanded(
                flex: 8,
                child: _buildDashboard(),
              ),
            ],
          ),
        )
      ],
    );
  }

  Container _buildDashboard() {
    return Container(
      color: Colors.grey.shade200,
      child: Column(
        children: [
          // Başlık alanı
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.centerLeft,
              child: const FittedBox(
                child: Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: CustomText(
                    title: 'Dashboard',
                    fontSize: 40,
                  ),
                ),
              ),
            ),
          ),
          // İstatistik alanı(Kare kartlar)
          Expanded(
            flex: 7,
            child: _buildStatCardRow(),
          ),
          // Üretim bilgi alanı
          Expanded(
            flex: 10,
            child: _buildProductInfo(),
          ),
        ],
      ),
    );
  }

  Container _buildProductInfo() {
    return Container(
      color: Colors.grey.shade200,
      child: const Row(
        children: [
          Expanded(
            child: StatCard(
              title: 'ÜRETİM',
              subtitle: 'TOPLAMI',
              value: '555',
              isaHaveChartData: true,
              valueFontSize: 120,
              isLeanLeft: true,
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: StatCard(
                    title: 'Montaj 1',
                    value: '80',
                    isaHaveChartData: true,
                    isLeanLeft: true,
                    valueFontSize: 50,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: StatCard(
                    title: 'Montaj 2',
                    value: '100',
                    isaHaveChartData: true,
                    isLeanLeft: true,
                    valueFontSize: 50,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Row _buildStatCardRow() {
    return const Row(
      children: [
        Expanded(
          child: StatCard(
            title: 'Alınan',
            subtitle: 'Sipariş',
            value: '12',
            isaHaveChartData: true,
            isLeanLeft: true,
          ),
        ),
        Expanded(
          child: StatCard(
            title: 'Sevke',
            subtitle: 'Hazır',
            value: '25',
            isaHaveChartData: true,
            isLeanLeft: true,
          ),
        ),
        Expanded(
          child: StatCard(
            title: 'Sevki',
            subtitle: 'Yapılan',
            value: '47',
            isaHaveChartData: true,
            isLeanLeft: true,
          ),
        ),
        Expanded(
          child: StatCard(
            title: 'Kurulumu',
            subtitle: 'Yapılan',
            value: '53',
            isaHaveChartData: true,
            isLeanLeft: true,
          ),
        )
      ],
    );
  }

  // Left menu
  /// Sol menü alanını oluşturur. 1/9 oranında genişliğe sahiptir.
  Expanded _buildLeftMenu() {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.blue,
      ),
    );
  }
}
