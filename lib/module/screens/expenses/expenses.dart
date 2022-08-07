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
                  label: Text('Name',style: TextStyle(fontSize: 13)),
                ),
                DataColumn(
                  label: Text('Start',style: TextStyle(fontSize: 13)),
                ),
                DataColumn(
                  label: Text('Type',style: TextStyle(fontSize: 13)),
                ),
                DataColumn(
                  label: Text('Amount',style: TextStyle(fontSize: 13)),
                ),
                DataColumn(
                  label: Text('Status',style: TextStyle(fontSize: 13)),
                )
              ],
              rows: const [
                DataRow(

                  cells:  [
                    DataCell(
                      Text('John',style: TextStyle(fontSize: 13)),
                    ),
                    DataCell(
                      Text('21-Mai-2021',style: TextStyle(fontSize: 13)),
                    ),
                    DataCell(
                      Text('Hotel fees',style: TextStyle(fontSize: 13)),
                    ),
                    DataCell(
                      Text('20USD',style: TextStyle(fontSize: 13)),
                    ),
                    DataCell(
                      Text('Validated',style: TextStyle(fontSize: 13)),
                    ),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text('John',style: TextStyle(fontSize: 13)),
                    ),
                    DataCell(
                      Text('21-Mai-2021', style: TextStyle(fontSize: 13),),
                    ),
                    DataCell(
                      Text('Hotel fees',style: TextStyle(fontSize: 13)),
                    ),
                    DataCell(
                      Text('20USD',style: TextStyle(fontSize: 13)),
                    ),
                    DataCell(
                      Text('Validated',style: TextStyle(fontSize: 13)),
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
