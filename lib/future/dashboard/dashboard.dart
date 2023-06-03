import 'package:flutter/material.dart';
import 'package:new_dashboard/future/dashboard/build_line_chart.dart';
import 'package:new_dashboard/product/sizes_enum.dart';

import 'custom_text.dart';

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
        body: Row(
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
                    child: Container(
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
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _buildProductInfo() {
    return Container(
      color: Colors.grey.shade200,
      child: Row(
        children: [
          Expanded(
            child: _buildStatCard(
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
                  child: _buildStatCard(
                    title: 'Montaj 1',
                    value: '80',
                    isaHaveChartData: true,
                    isLeanLeft: true,
                    valueFontSize: 50,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: _buildStatCard(
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
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            title: 'Alınan',
            subtitle: 'Sipariş',
            value: '12',
            isaHaveChartData: true,
            isLeanLeft: true,
          ),
        ),
        Expanded(
          child: _buildStatCard(
            title: 'Sevke',
            subtitle: 'Hazır',
            value: '25',
            isaHaveChartData: true,
            isLeanLeft: true,
          ),
        ),
        Expanded(
          child: _buildStatCard(
            title: 'Sevki',
            subtitle: 'Yapılan',
            value: '47',
            isaHaveChartData: true,
            isLeanLeft: true,
          ),
        ),
        Expanded(
          child: _buildStatCard(
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

// test branch
  Padding _buildStatCard({
    required String title,
    required String value,
    required bool isaHaveChartData,
    bool isLeanLeft = false,
    double valueFontSize = 70,
    String? subtitle,
  }) {
    return Padding(
      padding: EdgeInsets.all(Sizes.size16.size),
      child: Container(
        width: isLeanLeft ? double.infinity : null,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.size16.size),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.all(Sizes.size16.size),
          child: Column(
            crossAxisAlignment: isLeanLeft
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Başlık alanı
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(title),
                          if (subtitle != null) Text(subtitle),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Değer alanı
              Expanded(
                flex: 3,
                child: FittedBox(
                    child: CustomText(title: value, fontSize: valueFontSize)),
              ),
              // Grafik alanı
              if (isaHaveChartData)
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    width: isLeanLeft ? double.infinity : null,
                    child: const BuildLineChart(),
                  ),
                )
            ],
          ),
        ),
      ),
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
