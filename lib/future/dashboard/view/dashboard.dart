import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:new_dashboard/future/dashboard/components/toggle_text_button.dart';
//import 'package:new_dashboard/future/dashboard/viewModel/dashboard_viewModel.dart';
import 'package:new_dashboard/core/enums/sizes_enum.dart';
import '../../flip_card/dashboard_flip_card.dart';
import '../components/custom_text.dart';
import '../components/stat_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with TickerProviderStateMixin {
  //final DashboardViewModel _viewModel = DashboardViewModel();
  bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 924;

  FlipCardController uretimController = FlipCardController();

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
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
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
      child: Padding(
        padding: EdgeInsets.only(right: Sizes.size8.size),
        child: Column(
          children: [
            // Başlık alanı
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Sizes.size16.size),
                child: const SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FittedBox(
                        child: CustomText(
                          title: 'Dashboard',
                          fontSize: 40,
                        ),
                      ),
                      FittedBox(child: TimeToggleButtons())
                    ],
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
    );
  }

  Container _buildProductInfo() {
    return Container(
      color: Colors.grey.shade200,
      child: Row(
        children: [
          Expanded(
            // FLIP CARD
            child: DashboardFlipCard(
              title: 'Üretim',
            ),
            // FLIP CARD END
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: StatCard(
                    title: 'Montaj 1',
                    value: '80',
                    valueFontSize: 50,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: StatCard(
                    title: 'Montaj 2',
                    value: '100',
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
          child: StatCard(
            title: 'Alınan',
            subtitle: 'Sipariş',
            value: '12',
          ),
        ),
        Expanded(
          child: StatCard(
            title: 'Sevke',
            subtitle: 'Hazır',
            value: '25',
          ),
        ),
        Expanded(
          child: StatCard(
            title: 'Sevki',
            subtitle: 'Yapılan',
            value: '47',
          ),
        ),
        Expanded(
          child: StatCard(
            title: 'Kurulumu',
            subtitle: 'Yapılan',
            value: '53',
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
