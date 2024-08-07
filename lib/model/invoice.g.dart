// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InvoiceAdapter extends TypeAdapter<Invoice> {
  @override
  final int typeId = 5;

  @override
  Invoice read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Invoice(
      fields[0] as int?,
      fields[1] as int?,
      fields[4] as DateTime?,
      fields[5] as int?,
      fields[7] as int?,
    )
      ..currentElectricityNumber = fields[2] as int?
      ..currentWaterNumber = fields[3] as int?
      ..note = fields[6] as String?
      ..debit = (fields[8] as HiveList?)?.castHiveList()
      ..totalAmount = fields[9] as int?
      ..wifiAmount = fields[10] as int?;
  }

  @override
  void write(BinaryWriter writer, Invoice obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.newElectricityNumber)
      ..writeByte(1)
      ..write(obj.newWaterNumber)
      ..writeByte(2)
      ..write(obj.currentElectricityNumber)
      ..writeByte(3)
      ..write(obj.currentWaterNumber)
      ..writeByte(4)
      ..write(obj.invoiceCreateDate)
      ..writeByte(5)
      ..write(obj.amountAlreadyPay)
      ..writeByte(6)
      ..write(obj.note)
      ..writeByte(7)
      ..write(obj.surcharge)
      ..writeByte(8)
      ..write(obj.debit)
      ..writeByte(9)
      ..write(obj.totalAmount)
      ..writeByte(10)
      ..write(obj.wifiAmount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InvoiceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
