import 'package:clean_architecture/core/constants/app_text_style.dart';
import 'package:clean_architecture/core/utils/helper.dart';
import 'package:clean_architecture/core/utils/widgets/nodata_widget.dart';
import 'package:clean_architecture/features/shopping/presentation/cubit/history/history_cubit.dart';
import 'package:clean_architecture/features/shopping/presentation/widgets/bill_product_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(context),
    );
  }

  _buildAppbar() {
    return AppBar(
      title: const Text("History"),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent, // Ẩn đường gạch ngang
      ),
      child: BlocBuilder<HistoryCubit, HistoryState>(
        builder: (context, state) {
          if (state is HistoryInitial) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          } else if (state is HistoryLoaded) {
            return ListView.builder(
                itemCount: state.orderList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: ExpansionTile(
                          title: Text(
                              "Mã đơn hàng: ${state.orderList[index].id}",
                              style: AppText.titleSM),
                          subtitle: Text(
                              Helper.formatDate(state.orderList[index].updatedAt
                                  .toString()
                                  .toString()),
                              style: AppText.bodySM),
                          children: [
                            ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount:
                                    state.orderList[index].orderItems!.length,
                                itemBuilder: (context, id) {
                                  final int productId = state.orderList[index]
                                          .orderItems![id].productId ??
                                      0;
                                  return BillProductInfo(productId);
                                })
                          ]),
                    ),
                  );
                });
          } else {
            return const NoDataWidget();
          }
        },
      ),
    );
  }
}
