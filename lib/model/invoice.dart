import 'package:hive_flutter/hive_flutter.dart';
import 'package:room_manager/model/debit.dart';
import 'package:room_manager/model/room.dart';

import '../database/database_setting.dart';

part 'invoice.g.dart';

@HiveType(typeId: 5, adapterName: "InvoiceAdapter")
class Invoice extends HiveObject {
  @HiveField(0)
  int? newElectricityNumber;

  @HiveField(1)
  int? newWaterNumber;

  @HiveField(2)
  int? currentElectricityNumber;

  @HiveField(3)
  int? currentWaterNumber;

  @HiveField(4)
  DateTime? invoiceCreateDate;

  @HiveField(5)
  int? amountAlreadyPay;

  @HiveField(6)
  String? note;
  
  @HiveField(7)
  int? surcharge;

  @HiveField(8)
  HiveList<Debit>? debit;

  @HiveField(9)
  int? totalAmount;

  @HiveField(10)
  int? wifiAmount;

  Invoice(this.newElectricityNumber, this.newWaterNumber, this.invoiceCreateDate, this.amountAlreadyPay , this.surcharge);

  // Constructor
  Invoice.createInvoice(Room room) {
    invoiceCreateDate = DateTime.now();
    wifiAmount = 0;
    if (room.currentElectricityNumber != 0 && room.currentWaterNumber != 0) {
      currentElectricityNumber = room.currentElectricityNumber;
      currentWaterNumber = room.currentWaterNumber;
    }
    if (room.invoices.isNotEmpty) {
      amountAlreadyPay = room.invoices.last.amountAlreadyPay;
      wifiAmount = room.invoices.last.wifiAmount;
    }
    debit = HiveList(debitBox);
  }

  getRoom() {
    return roomBox.values.where((room) => room.invoices.contains(this)).first;
  }
}
