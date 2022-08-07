import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/widgets/form/primary_text_field.dart';

class Leaves extends StatefulWidget {
  const Leaves({Key? key}) : super(key: key);

  @override
  State<Leaves> createState() => _LeavesState();
}

class _LeavesState extends State<Leaves> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leaves'),
      ),
      body: SingleChildScrollView(
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
                  label: Text('Start', style: TextStyle(fontSize: 13)),
                ),
                DataColumn(
                  label: Text('End'),
                ),
                DataColumn(
                  label: Text('Status'),
                )
              ],
              rows: const [
                DataRow(
                  cells: [
                    DataCell(
                      Text('MArc'),
                    ),
                    DataCell(
                      Text('11-Mai-2020'),
                    ),
                    DataCell(
                      Text('30-Mai-2021'),
                    ),
                    DataCell(
                      Text('Validated'),
                    ),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text('MArc'),
                    ),
                    DataCell(
                      Text('11-Mai-2020'),
                    ),
                    DataCell(
                      Text('30-Mai-2021'),
                    ),
                    DataCell(
                      Text('Validated'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
