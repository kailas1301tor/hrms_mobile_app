import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../utils/common_widgets/adaptive_refresh_indicator.dart';
import 'widgets/admin_request_card.dart';
import 'widgets/admin_request_tab_bar.dart';

class AdminRequestsScreen extends StatefulWidget {
  const AdminRequestsScreen({super.key});

  @override
  State<AdminRequestsScreen> createState() => _AdminRequestsScreenState();
}

class _AdminRequestsScreenState extends State<AdminRequestsScreen> {
  String _selectedTab = "LEAVE";

  final Map<String, List<Map<String, dynamic>>> _dummyData = {
    "LEAVE": [
      {
        "name": "Ahmed Mansoor",
        "id": "L-9982",
        "branch": "DUBAI HQ",
        "initial": "A",
        "requestType": "Annual Leave",
        "date": "2024-05-20",
        "reason": "Travel to home country",
        "status": "PENDING",
        "type": "LEAVE",
      },
      {
        "name": "Fatima Al Ali",
        "id": "L-8871",
        "branch": "DUBAI HQ",
        "initial": "F",
        "requestType": "Sick Leave",
        "date": "2024-05-18",
        "reason": "Medical appointment",
        "status": "APPROVED",
        "type": "LEAVE",
      },
    ],
    "ADVANCE": [
      {
        "name": "Sarah Jenkins",
        "id": "L-4412",
        "branch": "ABU DHABI",
        "initial": "S",
        "requestType": "Salary Advance",
        "date": "2024-05-21",
        "amount": "2,500",
        "reason": "School fees payment",
        "status": "PENDING",
        "type": "ADVANCE",
      },
    ],
    "LOAN": [
      {
        "name": "Rajesh Kumar",
        "id": "L-2231",
        "branch": "SHARJAH",
        "initial": "R",
        "requestType": "Personal Loan",
        "date": "2024-05-19",
        "amount": "15,000",
        "reason": "Car down payment",
        "status": "PENDING",
        "type": "LOAN",
      },
    ],
  };

  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    final requests = _dummyData[_selectedTab] ?? [];

    return AdaptiveRefreshIndicator(
      onRefresh: _onRefresh,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        children: [
          AdminRequestTabBar(
            selectedTab: _selectedTab,
            onTabChanged: (tab) {
              setState(() {
                _selectedTab = tab;
              });
            },
          ),
          24.verticalSpace,
          ...requests.map(
            (request) => AdminRequestCard(
              request: request,
              onApprove: () {
                // Simulate approval
              },
              onReject: () {
                // Simulate rejection
              },
            ),
          ),
          20.verticalSpace,
        ],
      ),
    );
  }
}
