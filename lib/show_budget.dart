import 'package:flutter/material.dart';
import 'package:counter_7/drawer.dart';
import 'package:counter_7/budget.dart';

class ShowBudgetPage extends StatelessWidget {
  const ShowBudgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Budget Data'),
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
          itemCount: budgets.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(budgets[index].judul),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(budgets[index].nominal.toString()),
                  Text(budgets[index].jenis),
                  Text("Tanggal: " +
                      budgets[index].tanggal.toString().substring(0, 10)),
                ],
              ),
            );
          }),
    );
  }
}
