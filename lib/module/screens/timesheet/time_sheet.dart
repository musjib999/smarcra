import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smarcra/shared/themes/colors.dart';
import 'package:smarcra/shared/widgets/buttons/action_button.dart';
import 'package:smarcra/shared/widgets/form/primary_text_field.dart';

import '../../../data/dummy_data.dart';
import '../../../shared/models/timesheet_model.dart';

class Timesheet extends StatefulWidget {
  const Timesheet({Key? key}) : super(key: key);

  @override
  State<Timesheet> createState() => _TimesheetState();
}

class _TimesheetState extends State<Timesheet> {
  bool isActionButtonVisible = false;
  List<bool> _selected = [];
  @override
  void initState() {
    super.initState();
    _selected = List<bool>.generate(timesheets.length, (int index) => false);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timesheets'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 65.h,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 5.sp),
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
                  DataTable(
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
                    rows: timesheets
                        .map(
                          (item) => DataRow(
                            selected: _selected[timesheets.indexOf(item)],
                            onSelectChanged: (value){
                                setState(() {
                                  _selected[timesheets.indexOf(item)] = value!;
                                  isActionButtonVisible = _selected[timesheets.indexOf(item)];
                                });
                            },
                            color: MaterialStateProperty.all(_selected[timesheets.indexOf(item)] == true ? AppColors.primaryColor.withOpacity(0.3): Colors.white54),
                        cells: [
                          DataCell(
                            Text(
                              item.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          DataCell(
                            Text(
                              item.mission,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          DataCell(
                            Text(
                              item.period,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          DataCell(
                            Text(
                              '${item.presence}d',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          DataCell(
                            Text(
                              '${item.absence}d',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    )
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        isActionButtonVisible == true ?  Container(
            margin: EdgeInsets.symmetric(horizontal: 8.sp),
            height: 15.h, child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                Expanded(
                    child: InkWell(
                      onTap: (){
                        setState(() {

                        });
                      },
                        child: const ActionButtion(title: 'Validate', icon: Icons.done,)
                    ),
                ),
              SizedBox(width: 5.sp),
              Expanded(
                child: InkWell(
                    onTap: (){},
                    child: const ActionButtion(title: 'Reject', icon: Icons.close,)
                ),
              ),
              SizedBox(width: 5.sp),
              Expanded(
                child: InkWell(
                    onTap: (){},
                    child: const ActionButtion(title: 'Edit', icon: Icons.edit_outlined,)
                ),
              ),
            ],
          ),) : Container(),
        ],
      ),
    );
  }
}



//DataRow(

//                         cells: const [
//                           DataCell(
//                             Text('John'),
//                           ),
//                           DataCell(
//                             Text('MMA'),
//                           ),
//                           DataCell(
//                             Text('Mai'),
//                           ),
//                           DataCell(
//                             Text('0d'),
//                           ),
//                         ],
//                       ),