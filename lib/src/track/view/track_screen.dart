import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms_mobile/res/enums/enums.dart';
import 'package:hrms_mobile/src/track/notifier/track_notifier.dart';
import 'package:hrms_mobile/src/track/view/widgets/advances_section.dart';
import 'package:hrms_mobile/src/track/view/widgets/filing_tab_selector.dart';
import 'package:hrms_mobile/src/track/view/widgets/leaves_section.dart';
import 'package:hrms_mobile/src/track/view/widgets/loans_section.dart';
import 'package:hrms_mobile/src/track/view/new_advance_request_screen.dart';
import 'package:hrms_mobile/src/track/view/new_leave_request_screen.dart';
import 'package:hrms_mobile/src/track/view/new_loan_request_screen.dart';
import 'package:hrms_mobile/src/track/view/widgets/track_header.dart';
import 'package:hrms_mobile/utils/common_widgets/common_switch_state.dart';

class TrackScreen extends ConsumerStatefulWidget {
  const TrackScreen({super.key});

  @override
  ConsumerState<TrackScreen> createState() => _TrackScreenState();
}

final ValueNotifier<int> selectedIndex = ValueNotifier<int>(0);

class _TrackScreenState extends ConsumerState<TrackScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final notifier = ref.read(trackProvider.notifier);
      notifier.fetchLeaveTypes();
      notifier.fetchLeaveRequests();
      notifier.fetchAdvanceRequests();
      notifier.fetchLoanRequests();
    });
  }

  @override
  void dispose() {
    selectedIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFF8F9FB),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: CommonSwitchState(
          loaderState: LoaderState.loaded,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ValueListenableBuilder<int>(
                  valueListenable: selectedIndex,
                  builder: (context, value, child) {
                    return TrackHeader(
                      selectedIndex: value,
                      onNewEntry: () => _onNewEntry(context),
                    );
                  },
                ),
                ValueListenableBuilder<int>(
                  valueListenable: selectedIndex,
                  builder: (context, value, child) {
                    return FilingTabSelector(
                      selectedIndex: value,
                      onTabSelected: (index) {
                        selectedIndex.value = index;
                      },
                    );
                  },
                ),
                Expanded(
                  child: ValueListenableBuilder<int>(
                    valueListenable: selectedIndex,
                    builder: (context, value, child) {
                      return _buildSection(value);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onNewEntry(BuildContext context) {
    switch (selectedIndex.value) {
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const NewLeaveRequestScreen()),
        );
        break;
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const NewAdvanceRequestScreen()),
        );
        break;
      case 2:
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (_) => const NewLoanRequestScreen()));
        break;
      default:
        break;
    }
  }

  Widget _buildSection(int index) {
    switch (index) {
      case 0:
        return const LeavesSection();
      case 1:
        return const AdvancesSection();
      case 2:
        return const LoansSection();
      default:
        return const LeavesSection();
    }
  }
}
