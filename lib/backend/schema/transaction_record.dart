import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TransactionRecord extends FirestoreRecord {
  TransactionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "transaction_id" field.
  String? _transactionId;
  String get transactionId => _transactionId ?? '';
  bool hasTransactionId() => _transactionId != null;

  // "donator_ref" field.
  DocumentReference? _donatorRef;
  DocumentReference? get donatorRef => _donatorRef;
  bool hasDonatorRef() => _donatorRef != null;

  // "campaign_ref" field.
  DocumentReference? _campaignRef;
  DocumentReference? get campaignRef => _campaignRef;
  bool hasCampaignRef() => _campaignRef != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "recipient_ref" field.
  DocumentReference? _recipientRef;
  DocumentReference? get recipientRef => _recipientRef;
  bool hasRecipientRef() => _recipientRef != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  void _initializeFields() {
    _transactionId = snapshotData['transaction_id'] as String?;
    _donatorRef = snapshotData['donator_ref'] as DocumentReference?;
    _campaignRef = snapshotData['campaign_ref'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _recipientRef = snapshotData['recipient_ref'] as DocumentReference?;
    _amount = castToType<double>(snapshotData['amount']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('transaction');

  static Stream<TransactionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TransactionRecord.fromSnapshot(s));

  static Future<TransactionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TransactionRecord.fromSnapshot(s));

  static TransactionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TransactionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TransactionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TransactionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TransactionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TransactionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTransactionRecordData({
  String? transactionId,
  DocumentReference? donatorRef,
  DocumentReference? campaignRef,
  String? status,
  DateTime? createdAt,
  DocumentReference? recipientRef,
  double? amount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'transaction_id': transactionId,
      'donator_ref': donatorRef,
      'campaign_ref': campaignRef,
      'status': status,
      'created_at': createdAt,
      'recipient_ref': recipientRef,
      'amount': amount,
    }.withoutNulls,
  );

  return firestoreData;
}

class TransactionRecordDocumentEquality implements Equality<TransactionRecord> {
  const TransactionRecordDocumentEquality();

  @override
  bool equals(TransactionRecord? e1, TransactionRecord? e2) {
    return e1?.transactionId == e2?.transactionId &&
        e1?.donatorRef == e2?.donatorRef &&
        e1?.campaignRef == e2?.campaignRef &&
        e1?.status == e2?.status &&
        e1?.createdAt == e2?.createdAt &&
        e1?.recipientRef == e2?.recipientRef &&
        e1?.amount == e2?.amount;
  }

  @override
  int hash(TransactionRecord? e) => const ListEquality().hash([
        e?.transactionId,
        e?.donatorRef,
        e?.campaignRef,
        e?.status,
        e?.createdAt,
        e?.recipientRef,
        e?.amount
      ]);

  @override
  bool isValidKey(Object? o) => o is TransactionRecord;
}
