import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WalletRecord extends FirestoreRecord {
  WalletRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "wallet_balance" field.
  double? _walletBalance;
  double get walletBalance => _walletBalance ?? 0.0;
  bool hasWalletBalance() => _walletBalance != null;

  // "seller_id" field.
  DocumentReference? _sellerId;
  DocumentReference? get sellerId => _sellerId;
  bool hasSellerId() => _sellerId != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "traction_id" field.
  List<DocumentReference>? _tractionId;
  List<DocumentReference> get tractionId => _tractionId ?? const [];
  bool hasTractionId() => _tractionId != null;

  // "transaction_amount" field.
  List<double>? _transactionAmount;
  List<double> get transactionAmount => _transactionAmount ?? const [];
  bool hasTransactionAmount() => _transactionAmount != null;

  void _initializeFields() {
    _walletBalance = castToType<double>(snapshotData['wallet_balance']);
    _sellerId = snapshotData['seller_id'] as DocumentReference?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _tractionId = getDataList(snapshotData['traction_id']);
    _transactionAmount = getDataList(snapshotData['transaction_amount']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('wallet');

  static Stream<WalletRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WalletRecord.fromSnapshot(s));

  static Future<WalletRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WalletRecord.fromSnapshot(s));

  static WalletRecord fromSnapshot(DocumentSnapshot snapshot) => WalletRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WalletRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WalletRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WalletRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WalletRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWalletRecordData({
  double? walletBalance,
  DocumentReference? sellerId,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'wallet_balance': walletBalance,
      'seller_id': sellerId,
      'created_at': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class WalletRecordDocumentEquality implements Equality<WalletRecord> {
  const WalletRecordDocumentEquality();

  @override
  bool equals(WalletRecord? e1, WalletRecord? e2) {
    const listEquality = ListEquality();
    return e1?.walletBalance == e2?.walletBalance &&
        e1?.sellerId == e2?.sellerId &&
        e1?.createdAt == e2?.createdAt &&
        listEquality.equals(e1?.tractionId, e2?.tractionId) &&
        listEquality.equals(e1?.transactionAmount, e2?.transactionAmount);
  }

  @override
  int hash(WalletRecord? e) => const ListEquality().hash([
        e?.walletBalance,
        e?.sellerId,
        e?.createdAt,
        e?.tractionId,
        e?.transactionAmount
      ]);

  @override
  bool isValidKey(Object? o) => o is WalletRecord;
}
