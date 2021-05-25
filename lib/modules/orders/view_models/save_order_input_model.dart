class SaveOrderInputModel {
  int userId;
  String address;
  String paymentType;
  List<int> itemsId;
  String note;

  SaveOrderInputModel({
    this.userId,
    this.address,
    this.paymentType,
    this.itemsId,
    this.note,
  });
}
