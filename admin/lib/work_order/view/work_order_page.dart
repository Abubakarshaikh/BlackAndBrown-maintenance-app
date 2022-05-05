import 'package:admin/work_order/bloc/work_order_bloc.dart';
import 'package:admin/work_order/widgets/widgets.dart';
import 'package:admin/work_order_details/bloc/work_order_details_bloc.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:admin/app/app.dart';
import 'package:maintenance_repository/maintenance_repository.dart';
import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'dart:io';
import 'package:intl/intl.dart';

class WorkOrderPage extends StatelessWidget {
  static Page page() => const MaterialPage<void>(child: WorkOrderPage());

  const WorkOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          BlocBuilder<WorkOrderBloc, WorkOrderState>(builder: (context, state) {
        if (state is StateWorkOrderLoaded) {
          return CustomScrollView(
            slivers: [
              WorkOrderAppBar1(onEvent: () {
                exportToExcel(state.workOrders);
              }),
              WorkOrderAppBar2(workOrders: state.workOrders),
              const SliverToBoxAdapter(child: SizedBox(height: 5.5)),
              state.workOrders.isEmpty
                  ? SliverToBoxAdapter(
                      child: Center(
                      child: Text("No Data Available",
                          style: Theme.of(context).textTheme.headline4),
                    ))
                  : SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return WorkOrderTile(
                            workOrder: state.workOrders[index],
                            onTap: () {
                              context.read<WorkOrderDetailsBloc>().add(
                                  LoadWorkOrderDetails(
                                      workOrder: state.workOrders[index]));
                              context
                                  .flow<String>()
                                  .update((state) => PageState.detailed);
                            },
                          );
                        },
                        childCount: state.workOrders.length,
                      ),
                    ),
              const SliverToBoxAdapter(child: SizedBox(height: 96)),
            ],
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }

  Future<void> exportToExcel(List<WorkOrder> workorder) async {
    final excel = Excel.createExcel();
    final Sheet sheet1 = excel[excel.getDefaultSheet()!];
    final Sheet sheet2 = excel["sheet2"];

    final corrective =
        workorder.where((element) => element.workType == "Corrective").toList();
    for (var i = 0; i < corrective.length; i++) {
      sheet1
          .cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 0))
          .value = 'S.no';
      sheet1
          .cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 0))
          .value = 'Branch';
      sheet1
          .cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: 0))
          .value = 'Issue';
      sheet1
          .cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: 0))
          .value = 'Material';
      sheet1
          .cell(CellIndex.indexByColumnRow(columnIndex: 4, rowIndex: 0))
          .value = 'Issue Date&Time';
      sheet1
          .cell(CellIndex.indexByColumnRow(columnIndex: 5, rowIndex: 0))
          .value = 'Resolved Date&Time';
      sheet1
          .cell(CellIndex.indexByColumnRow(columnIndex: 6, rowIndex: 0))
          .value = 'Name';
      sheet1
          .cell(CellIndex.indexByColumnRow(columnIndex: 7, rowIndex: 0))
          .value = "Remark's";
      sheet1
          .cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: i))
          .value = i + 1;
      sheet1
          .cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: i))
          .value = workorder[i].branch;
      sheet1
          .cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: i))
          .value = workorder[i].works[1].status.first;
      sheet1
          .cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: i))
          .value = workorder[i].works[2].status.first;
      sheet1
          .cell(CellIndex.indexByColumnRow(columnIndex: 4, rowIndex: i))
          .value;

      sheet1
              .cell(CellIndex.indexByColumnRow(columnIndex: 5, rowIndex: i))
              .value =
          DateFormat('yyyy-MM-dd – h:mm a').format(workorder[i].startingTime);
      sheet1
          .cell(CellIndex.indexByColumnRow(columnIndex: 6, rowIndex: i))
          .value = workorder[i].fullName;
      sheet1
          .cell(CellIndex.indexByColumnRow(columnIndex: 7, rowIndex: i))
          .value = workorder[i].desc;
    }

    final preventive =
        workorder.where((element) => element.workType == "Preventive").toList();
    var index = 0;
    sheet2
        .cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: index))
        .value = "Branch";
    sheet2
        .cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: index))
        .value = "Time";
    sheet2
        .cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: index))
        .value = "Names";
    sheet2
        .cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: index))
        .value = "Desc";
    for (var order in preventive) {
      var shet$index = excel["$index"];
      sheet2
          .cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: index + 1))
          .value = order.branch;
      sheet2
          .cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: index + 1))
          .value = DateFormat('yyyy-MM-dd – h:mm a').format(order.startingTime);
      sheet2
          .cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: index + 1))
          .value = order.fullName;
      sheet2
          .cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: index + 1))
          .value = order.desc;

      shet$index
          .cell(CellIndex.indexByColumnRow(columnIndex: 4, rowIndex: index))
          .value = order.works;
      index++;
    }

    excel.save(fileName: "MyData.xlsx");
    var fileBytes = excel.save();
    final String path = (await getApplicationSupportDirectory()).path;
    final String fileName = '$path/output_file_name.xlsx';
    final File file = File(fileName);
    await file.writeAsBytes(fileBytes!, flush: true);
    OpenFile.open(fileName);
  }
}
