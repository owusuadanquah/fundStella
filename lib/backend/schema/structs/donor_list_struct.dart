// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DonorListStruct extends FFFirebaseStruct {
  DonorListStruct({
    DocumentReference? userId,
    double? amount,
    DateTime? createAt,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _userId = userId,
        _amount = amount,
        _createAt = createAt,
        super(firestoreUtilData);

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  set userId(DocumentReference? val) => _userId = val;

  bool hasUserId() => _userId != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  set amount(double? val) => _amount = val;

  void incrementAmount(double amount) => amount = amount + amount;

  bool hasAmount() => _amount != null;

  // "create_at" field.
  DateTime? _createAt;
  DateTime? get createAt => _createAt;
  set createAt(DateTime? val) => _createAt = val;

  bool hasCreateAt() => _createAt != null;

  static DonorListStruct fromMap(Map<String, dynamic> data) => DonorListStruct(
        userId: data['user_id'] as DocumentReference?,
        amount: castToType<double>(data['amount']),
        createAt: data['create_at'] as DateTime?,
      );

  static DonorListStruct? maybeFromMap(dynamic data) => data is Map
      ? DonorListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'user_id': _userId,
        'amount': _amount,
        'create_at': _createAt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'user_id': serializeParam(
          _userId,
          ParamType.DocumentReference,
        ),
        'amount': serializeParam(
          _amount,
          ParamType.double,
        ),
        'create_at': serializeParam(
          _createAt,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static DonorListStruct fromSerializableMap(Map<String, dynamic> data) =>
      DonorListStruct(
        userId: deserializeParam(
          data['user_id'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        amount: deserializeParam(
          data['amount'],
          ParamType.double,
          false,
        ),
        createAt: deserializeParam(
          data['create_at'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'DonorListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DonorListStruct &&
        userId == other.userId &&
        amount == other.amount &&
        createAt == other.createAt;
  }

  @override
  int get hashCode => const ListEquality().hash([userId, amount, createAt]);
}

DonorListStruct createDonorListStruct({
  DocumentReference? userId,
  double? amount,
  DateTime? createAt,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DonorListStruct(
      userId: userId,
      amount: amount,
      createAt: createAt,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DonorListStruct? updateDonorListStruct(
  DonorListStruct? donorList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    donorList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDonorListStructData(
  Map<String, dynamic> firestoreData,
  DonorListStruct? donorList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (donorList == null) {
    return;
  }
  if (donorList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && donorList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final donorListData = getDonorListFirestoreData(donorList, forFieldValue);
  final nestedData = donorListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = donorList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDonorListFirestoreData(
  DonorListStruct? donorList, [
  bool forFieldValue = false,
]) {
  if (donorList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(donorList.toMap());

  // Add any Firestore field values
  donorList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDonorListListFirestoreData(
  List<DonorListStruct>? donorLists,
) =>
    donorLists?.map((e) => getDonorListFirestoreData(e, true)).toList() ?? [];
