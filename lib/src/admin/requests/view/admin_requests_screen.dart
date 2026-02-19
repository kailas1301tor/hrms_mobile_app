import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms_mobile/src/admin/requests/notifier/admin_requests_notifier.dart';
import 'package:hrms_mobile/utils/common_widgets/adaptive_refresh_indicator.dart';

import 'widgets/admin_request_tab_bar.dart';
import 'widgets/advance_requests_list_view.dart';
import 'widgets/leave_requests_list_view.dart';
import 'widgets/loan_requests_list_view.dart';

class AdminRequestsScreen extends ConsumerStatefulWidget {
  const AdminRequestsScreen({super.key});

  @override
  ConsumerState<AdminRequestsScreen> createState() =>
      _AdminRequestsScreenState();
}

class _AdminRequestsScreenState extends ConsumerState<AdminRequestsScreen> {
  final ScrollController _scrollController = ScrollController();
  static const _loadMoreThreshold = 200.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(adminRequestsProvider.notifier).fetchLeaveRequests();
      ref.read(adminRequestsProvider.notifier).fetchAdvanceRequests();
      ref.read(adminRequestsProvider.notifier).fetchLoanRequests();
    });
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final position = _scrollController.position;
    if (position.pixels < position.maxScrollExtent - _loadMoreThreshold) return;
    final s = ref.read(adminRequestsProvider);
    final notifier = ref.read(adminRequestsProvider.notifier);
    if (s.selectedTab == 'LEAVE') {
      final hasMore =
          s.leaveTotalPages == null || s.leavePage < s.leaveTotalPages!;
      if (hasMore && !s.leaveLoadingMore) notifier.loadMoreLeaveRequests();
    } else if (s.selectedTab == 'ADVANCE') {
      final hasMore =
          s.advanceTotalPages == null || s.advancePage < s.advanceTotalPages!;
      if (hasMore && !s.advanceLoadingMore) notifier.loadMoreAdvanceRequests();
    } else if (s.selectedTab == 'LOAN') {
      final hasMore =
          s.loanTotalPages == null || s.loanPage < s.loanTotalPages!;
      if (hasMore && !s.loanLoadingMore) notifier.loadMoreLoanRequests();
    }
  }

  Future<void> _onRefresh() async {
    final selectedTab = ref.read(
      adminRequestsProvider.select((s) => s.selectedTab),
    );
    final notifier = ref.read(adminRequestsProvider.notifier);
    if (selectedTab == 'LEAVE') {
      await notifier.fetchLeaveRequests();
    } else if (selectedTab == 'ADVANCE') {
      await notifier.fetchAdvanceRequests();
    } else {
      await notifier.fetchLoanRequests();
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedTab = ref.watch(
      adminRequestsProvider.select((s) => s.selectedTab),
    );
    final notifier = ref.read(adminRequestsProvider.notifier);

    return AdaptiveRefreshIndicator(
      onRefresh: _onRefresh,
      child: ListView(
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(
          parent: ClampingScrollPhysics(),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        children: [
          AdminRequestTabBar(
            selectedTab: selectedTab,
            onTabChanged: (tab) => notifier.setSelectedTab(tab),
          ),
          24.verticalSpace,
          if (selectedTab == 'LEAVE')
            const LeaveRequestsListView()
          else if (selectedTab == 'ADVANCE')
            const AdvanceRequestsListView()
          else
            const LoanRequestsListView(),
          20.verticalSpace,
        ],
      ),
    );
  }
}
