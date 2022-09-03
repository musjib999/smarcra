import 'package:adaptive_scrollbar/adaptive_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:smarcra/core/service_injector.dart';
import 'package:smarcra/module/screens/leaves/add_leave.dart';
import 'package:smarcra/shared/models/leave_model.dart';

import '../../../shared/themes/colors.dart';
import '../../../shared/widgets/buttons/action_button.dart';
import '../../../shared/widgets/form/primary_text_field.dart';

class Leaves extends StatefulWidget {
  const Leaves({Key? key}) : super(key: key);

  @override
  State<Leaves> createState() => _LeavesState();
}

class _LeavesState extends State<Leaves> {
  late Future<List<LeaveModel>> allLeaves;
  bool isActionButtonVisible = false;
  List<bool> _selected = [];
  LeaveModel? _selectedLeave;

  final ScrollController horizontalScroll = ScrollController();
  final ScrollController verticalScroll = ScrollController();

  @override
  void initState() {
    super.initState();
    allLeaves = si.leaveService.getLeaves(context);
    allLeaves.then((value) => _selected = List<bool>.generate(value.length, (int index) => false));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leaves'),
      ),
      body: Column(
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
          const SizedBox(height: 15),
          FutureBuilder<List<LeaveModel>>(
            future: allLeaves,
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/svg/no-data.svg', width: 50.w,),
                    SizedBox(height: 15.sp),
                    const Text(
                      'No Leave Available!',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                );
              }
              List<LeaveModel> leaves = snapshot.data as List<LeaveModel>;
              return SizedBox(
                height: 58.h,
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
                        borderRadius: BorderRadius.all(Radius.circular(12.0),
                        ),
                      ),
                      sliderActiveDecoration: const BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.all(Radius.circular(12.0),
                        ),
                      ),
                      underSpacing: const EdgeInsets.only(bottom: 10),
                      child: SingleChildScrollView(
                        controller: horizontalScroll,
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columns: const [
                            DataColumn(
                              label: Text('Name'),
                            ),
                            DataColumn(
                              label: Text('Start'),
                            ),
                            DataColumn(
                              label: Text('End'),
                            ),
                            DataColumn(
                              label: Text('Status'),
                            )
                          ],
                          rows: leaves.map(
                                (leave) => DataRow(
                              selected: _selected[leaves.indexOf(leave)],
                              onSelectChanged: (value){
                                setState(() {
                                  _selected[leaves.indexOf(leave)] = value!;
                                  isActionButtonVisible = _selected[leaves.indexOf(leave)];
                                  _selectedLeave = leave;
                                });
                              },
                              color: MaterialStateProperty.all(_selected[leaves.indexOf(leave)] == true ? AppColors.primaryColor.withOpacity(0.3): Colors.white54),
                              cells: [
                                DataCell(Text('${leave.resourceFirstName} ${leave.resourceLastName}')),
                                DataCell(Text('${leave.startDate.year}-${leave.startDate.month}-${leave.startDate.day}')),
                                DataCell(Text('${leave.endDate.year}-${leave.endDate.month}-${leave.endDate.day}')),
                                DataCell(Text(leave.statusCode)),
                              ],
                            ),
                          ).toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }
          ),
          isActionButtonVisible == true ?  Container(
            margin: EdgeInsets.symmetric(horizontal: 8.sp),
            height: 8.h, child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: InkWell(
                    onTap: (){
                      si.dialogService.successSnackBar(context, 'Leave validated', false);
                    },
                    child: const ActionButton(title: 'Validate', icon: Icons.done,)
                ),
              ),
              SizedBox(width: 5.sp),
              Expanded(
                child: InkWell(
                    onTap: (){
                      si.dialogService.successSnackBar(context, 'Leave Rejected', true);
                    },
                    child: const ActionButton(title: 'Reject', icon: Icons.close,)
                ),
              ),
            ],
          ),) : Container(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // si.dialogService.bottomSheet(
          //   context,
          //   body: const AddLeave(),
          // );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}


// DataTable(
//                     columns: const [
//                       DataColumn(
//                         label: Text('Name'),
//                       ),
//                       DataColumn(
//                         label: Text('Start'),
//                       ),
//                       DataColumn(
//                         label: Text('End'),
//                       ),
//                       DataColumn(
//                         label: Text('Status'),
//                       )
//                     ],
//                     rows: leaves.map(
//                           (leave) => DataRow(
//                             selected: _selected[leaves.indexOf(leave)],
//                             onSelectChanged: (value){
//                               setState(() {
//                                 _selected[leaves.indexOf(leave)] = value!;
//                                 isActionButtonVisible = _selected[leaves.indexOf(leave)];
//                                 _selectedLeave = leave;
//                               });
//                             },
//                             color: MaterialStateProperty.all(_selected[leaves.indexOf(leave)] == true ? AppColors.primaryColor.withOpacity(0.3): Colors.white54),
//                             cells: [
//                           DataCell(Text(leave.name)),
//                           DataCell(Text('${leave.startDate.day}-${leave.startDate.month}-${leave.startDate.year}')),
//                           DataCell(Text('${leave.stopDate.day}-${leave.stopDate.month}-${leave.stopDate.year}')),
//                           DataCell(Text(leave.status)),
//                         ],
//                       ),
//                     ).toList(),
//                   ),

//