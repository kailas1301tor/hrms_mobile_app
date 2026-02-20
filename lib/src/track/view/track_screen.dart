import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms_mobile/res/enums/enums.dart';
import 'package:hrms_mobile/src/track/notifier/track_notifier.dart';
import 'package:hrms_mobile/src/track/view/widgets/advances_section.dart';
import 'package:hrms_mobile/src/track/view/widgets/filing_tab_selector.dart';
import 'package:hrms_mobile/src/track/view/widgets/leaves_section.dart';
import 'package:hrms_mobile/src/track/view/widgets/loans_section.dart';
import 'package:hrms_mobile/src/track/view/widgets/new_advance_request_dialog.dart';
import 'package:hrms_mobile/src/track/view/widgets/new_leave_request_dialog.dart';
import 'package:hrms_mobile/src/track/view/widgets/new_loan_request_dialog.dart';
import 'package:hrms_mobile/src/track/view/widgets/track_header.dart';
import 'package:hrms_mobile/utils/common_widgets/common_switch_state.dart';

class TrackScreen extends ConsumerStatefulWidget {
  const TrackScreen({super.key});

  @override
  ConsumerState<TrackScreen> createState() => _TrackScreenState();
}

class _TrackScreenState extends ConsumerState<TrackScreen> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(0);

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
    _selectedIndex.dispose();
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
                  valueListenable: _selectedIndex,
                  builder: (context, value, child) {
                    return TrackHeader(
                      selectedIndex: value,
                      onNewEntry: () => _onNewEntry(context),
                    );
                  },
                ),
                ValueListenableBuilder<int>(
                  valueListenable: _selectedIndex,
                  builder: (context, value, child) {
                    return FilingTabSelector(
                      selectedIndex: value,
                      onTabSelected: (index) {
                        _selectedIndex.value = index;
                      },
                    );
                  },
                ),
                Expanded(
                  child: ValueListenableBuilder<int>(
                    valueListenable: _selectedIndex,
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
    switch (_selectedIndex.value) {
      case 0:
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => const NewLeaveRequestDialog(),
        );
        break;
      case 1:
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => const NewAdvanceRequestDialog(),
        );
        break;
      case 2:
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) => const NewLoanRequestDialog(),
        );
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
