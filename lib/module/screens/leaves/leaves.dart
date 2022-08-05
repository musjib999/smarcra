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
                  label: Text('Age'),
                ),
                DataColumn(
                  label: Text('Gender'),
                ),
                DataColumn(
                  label: Text('Date'),
                )
              ],
              rows: const [
                DataRow(
                  cells: [
                    DataCell(
                      Text('John'),
                    ),
                    DataCell(
                      Text('21'),
                    ),
                    DataCell(
                      Text('Male'),
                    ),
                    DataCell(
                      Text('12-02-2021'),
                    ),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text('John'),
                    ),
                    DataCell(
                      Text('21'),
                    ),
                    DataCell(
                      Text('Male'),
                    ),
                    DataCell(
                      Text('12-02-2021'),
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
