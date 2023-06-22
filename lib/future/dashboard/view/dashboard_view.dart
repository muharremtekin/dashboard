// import 'package:flutter/material.dart';


// class DashboardView extends StatelessWidget {
//   const DashboardView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BaseView<DashboardViewModel>(
//       viewmodel: DashboardViewModel(),
//       onModelReady: (viewmodel) {
//         viewmodel.setContext(context);
//         viewmodel.init();
//       },
//       onPageBuilder: (BuildContext context, DashboardViewModel vm) =>
//           ScreenTypeLayout(
//         mobile: DashboardMobile(vm),
//         tablet: DashboardTabletDesktop(vm),
//       ),
//     );
//   }
// }