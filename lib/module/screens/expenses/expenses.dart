import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/widgets/form/primary_text_field.dart';

class Expenses extends StatefulWidget {
  const Expenses({Key? key}) : super(key: key);

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses'),
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
