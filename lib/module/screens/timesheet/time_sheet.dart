import 'package:adaptive_scrollbar/adaptive_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:smarcra/core/service_injector.dart';
import 'package:smarcra/module/screens/timesheet/edit_timesheet.dart';
import 'package:smarcra/shared/themes/colors.dart';
import 'package:smarcra/shared/widgets/buttons/action_button.dart';
import 'package:smarcra/shared/widgets/form/primary_text_field.dart';

import '../../../shared/models/timesheet_model.dart';

class Timesheet extends StatefulWidget {
  const Timesheet({Key? key}) : super(key: key);

  @override
  State<Timesheet> createState() => _TimesheetState();
}

class _TimesheetState extends State<Timesheet> {
  late Future<List<TimeSheetModel>> allTimeSheets;
  bool isActionButtonVisible = false;
  List<bool> _selected = [];
  List<TimeSheetModel> selectedTimesheet = [];

  final ScrollController horizontalScroll = ScrollController();
  final ScrollController verticalScroll = ScrollController();

  @override
  void initState() {
    super.initState();
    allTimeSheets = si.timeSheetService.getTimeSheets(context);
    allTimeSheets.then((value) => _selected = List<bool>.generate(value.length, (int index) => false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timesheets'),
      ),
      body: FutureBuilder<List<TimeSheetModel>>(
        future: allTimeSheets,
        builder: (context, snapshot) {
          if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            );
          } else if (snapshot.hasError || snapshot.data!.isEmpty) {
            return Column(
              children: [
                SizedBox(height: 20.h),
                Center(
                    child: SvgPicture.asset(
                      'assets/svg/no-data.svg',
                      width: 50.w,
                    )),
                SizedBox(height: 15.sp),
                const Text(
                  'No TimeSheet Available!',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Roboto',
                  ),
                ),
              ],
            );
          }
          List<TimeSheetModel> timeSheets = snapshot.data as List<TimeSheetModel>;
          return Column(
            children: [
             Column(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Padding(
                   padding: const EdgeInsets.all(15.0),
                   child: PrimaryTextField(
                     controller: TextEditingController(),
                     label: 'Search',
                     hintText: 'Search',
                     prefixIcon: Icons.search,
                   ),
                 ),
                 SizedBox(
                   height: 55.h,
                   child: SingleChildScrollView(
                     child: AdaptiveScrollbar(
                       controller: verticalScroll,
                       width: 10,
                       child: AdaptiveScrollbar(
                         controller: horizontalScroll,
                         width: 10,
                         position: ScrollbarPosition.bottom,
                         sliderDecoration: const BoxDecoration(
                           color: Colors.white54,
                           borderRadius: BorderRadius.all(
                             Radius.circular(12.0),
                           ),
                         ),
                         sliderActiveDecoration: const BoxDecoration(
                           color: Colors.white54,
                           borderRadius: BorderRadius.all(
                             Radius.circular(12.0),
                           ),
                         ),
                         underSpacing: const EdgeInsets.only(bottom: 8),
                         child: SingleChildScrollView(
                           controller: horizontalScroll,
                           scrollDirection: Axis.horizontal,
                           child: DataTable(
                             columns: const [
                               DataColumn(
                                 label: Text('Name'),
                               ),
                               DataColumn(
                                 label: Text('Mission'),
                               ),
                               DataColumn(
                                 label: Text('Period'),
                               ),
                               DataColumn(
                                 label: Text('Presence'),
                               ),
                               DataColumn(
                                 label: Text('Absence'),
                               )
                             ],
                             rows: timeSheets
                                 .map(
                                   (item) => DataRow(
                                 selected:
                                 _selected[timeSheets.indexOf(item)],
                                 onSelectChanged: (value){
                                   setState(() {
                                     _selected[timeSheets.indexOf(item)] = value!;
                                     isActionButtonVisible = _selected[timeSheets.indexOf(item)];
                                     if(_selected[timeSheets.indexOf(item)] == true){
                                       selectedTimesheet.add(item);
                                     }else{
                                       selectedTimesheet.remove(item);
                                     }

                                   });
                                 },
                                 color: MaterialStateProperty.all(
                                     _selected[timeSheets.indexOf(item)] ==
                                         true
                                         ? AppColors.primaryColor
                                         .withOpacity(0.3)
                                         : Colors.white54),
                                 cells: [
                                   DataCell(
                                     Text(
                                       '${item.lastName} ${item.firstName}',
                                       maxLines: 1,
                                       overflow: TextOverflow.ellipsis,
                                     ),
                                   ),
                                   DataCell(
                                     Text(
                                       item.missionName,
                                       maxLines: 1,
                                       overflow: TextOverflow.ellipsis,
                                     ),
                                   ),
                                   DataCell(
                                     Text(
                                       item.monthLabel,
                                       maxLines: 1,
                                       overflow: TextOverflow.ellipsis,
                                     ),
                                   ),
                                   DataCell(
                                     Text(
                                       '${item.totalPresence.toInt()}d',
                                       maxLines: 1,
                                       overflow: TextOverflow.ellipsis,
                                     ),
                                   ),
                                   DataCell(
                                     Text(
                                       '${item.totalSickness.toInt()}d',
                                       maxLines: 1,
                                       overflow: TextOverflow.ellipsis,
                                     ),
                                   ),
                                 ],
                               ),
                             )
                                 .toList(),
                           ),
                         ),
                       ),
                     ),
                   ),
                 ),
               ],
             ),
              SizedBox(height: 8.sp),
              isActionButtonVisible == true
                  ? Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.sp),
                      height: 7.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: InkWell(
                                onTap: () async{
                                  await si.timeSheetService.validateTimeSheet(context, timeSheets: selectedTimesheet);
                                  // si.dialogService.successSnackBar(
                                  //     context, 'Timesheet validated', false,
                                  // );
                                },
                                child: const ActionButton(
                                  title: 'Validate',
                                  icon: Icons.done,
                                )),
                          ),
                          SizedBox(width: 5.sp),
                          Expanded(
                            child: InkWell(
                                onTap: () {
                                  si.dialogService.successSnackBar(
                                      context, 'Timesheet Rejected', true);
                                },
                                child: const ActionButton(
                                  title: 'Reject',
                                  icon: Icons.close,
                                )),
                          ),
                          SizedBox(width: 5.sp),
                        selectedTimesheet.length == 1 ? Expanded(
                            child: InkWell(
                                onTap: () {
                                  si.routerService.nextRoute(
                                      context: context,
                                      EditTimeSheet(
                                          timeSheetId: selectedTimesheet[0].timesheetId,
                                      ),
                                  );
                                },
                                child: const ActionButton(
                                  title: 'Edit',
                                  icon: Icons.edit_outlined,
                                ),
                            ),
                          ): Container(),
                        ],
                      ),
                    )
                  : Container(),
            ],
          );
        }
      ),
    );
  }
}
