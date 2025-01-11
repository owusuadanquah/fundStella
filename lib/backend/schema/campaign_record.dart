import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CampaignRecord extends FirestoreRecord {
  CampaignRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "campaign_id" field.
  String? _campaignId;
  String get campaignId => _campaignId ?? '';
  bool hasCampaignId() => _campaignId != null;

  // "campaign_name" field.
  String? _campaignName;
  String get campaignName => _campaignName ?? '';
  bool hasCampaignName() => _campaignName != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "target_amount" field.
  double? _targetAmount;
  double get targetAmount => _targetAmount ?? 0.0;
  bool hasTargetAmount() => _targetAmount != null;

  // "amount_raised" field.
  double? _amountRaised;
  double get amountRaised => _amountRaised ?? 0.0;
  bool hasAmountRaised() => _amountRaised != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "end_date" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  bool hasEndDate() => _endDate != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "admin_review_status" field.
  String? _adminReviewStatus;
  String get adminReviewStatus => _adminReviewStatus ?? '';
  bool hasAdminReviewStatus() => _adminReviewStatus != null;

  // "tags" field.
  List<String>? _tags;
  List<String> get tags => _tags ?? const [];
  bool hasTags() => _tags != null;

  // "visibility" field.
  bool? _visibility;
  bool get visibility => _visibility ?? false;
  bool hasVisibility() => _visibility != null;

  // "payment_methods" field.
  List<String>? _paymentMethods;
  List<String> get paymentMethods => _paymentMethods ?? const [];
  bool hasPaymentMethods() => _paymentMethods != null;

  // "creator_id" field.
  DocumentReference? _creatorId;
  DocumentReference? get creatorId => _creatorId;
  bool hasCreatorId() => _creatorId != null;

  // "campaign_image_url" field.
  String? _campaignImageUrl;
  String get campaignImageUrl => _campaignImageUrl ?? '';
  bool hasCampaignImageUrl() => _campaignImageUrl != null;

  // "blur_hash" field.
  String? _blurHash;
  String get blurHash => _blurHash ?? '';
  bool hasBlurHash() => _blurHash != null;

  // "donor_list" field.
  List<DonorListStruct>? _donorList;
  List<DonorListStruct> get donorList => _donorList ?? const [];
  bool hasDonorList() => _donorList != null;

  void _initializeFields() {
    _campaignId = snapshotData['campaign_id'] as String?;
    _campaignName = snapshotData['campaign_name'] as String?;
    _description = snapshotData['description'] as String?;
    _category = snapshotData['category'] as String?;
    _targetAmount = castToType<double>(snapshotData['target_amount']);
    _amountRaised = castToType<double>(snapshotData['amount_raised']);
    _status = snapshotData['status'] as String?;
    _endDate = snapshotData['end_date'] as DateTime?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _updatedAt = snapshotData['updated_at'] as DateTime?;
    _adminReviewStatus = snapshotData['admin_review_status'] as String?;
    _tags = getDataList(snapshotData['tags']);
    _visibility = snapshotData['visibility'] as bool?;
    _paymentMethods = getDataList(snapshotData['payment_methods']);
    _creatorId = snapshotData['creator_id'] as DocumentReference?;
    _campaignImageUrl = snapshotData['campaign_image_url'] as String?;
    _blurHash = snapshotData['blur_hash'] as String?;
    _donorList = getStructList(
      snapshotData['donor_list'],
      DonorListStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('campaign');

  static Stream<CampaignRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CampaignRecord.fromSnapshot(s));

  static Future<CampaignRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CampaignRecord.fromSnapshot(s));

  static CampaignRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CampaignRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CampaignRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CampaignRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CampaignRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CampaignRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCampaignRecordData({
  String? campaignId,
  String? campaignName,
  String? description,
  String? category,
  double? targetAmount,
  double? amountRaised,
  String? status,
  DateTime? endDate,
  DateTime? createdAt,
  DateTime? updatedAt,
  String? adminReviewStatus,
  bool? visibility,
  DocumentReference? creatorId,
  String? campaignImageUrl,
  String? blurHash,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'campaign_id': campaignId,
      'campaign_name': campaignName,
      'description': description,
      'category': category,
      'target_amount': targetAmount,
      'amount_raised': amountRaised,
      'status': status,
      'end_date': endDate,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'admin_review_status': adminReviewStatus,
      'visibility': visibility,
      'creator_id': creatorId,
      'campaign_image_url': campaignImageUrl,
      'blur_hash': blurHash,
    }.withoutNulls,
  );

  return firestoreData;
}

class CampaignRecordDocumentEquality implements Equality<CampaignRecord> {
  const CampaignRecordDocumentEquality();

  @override
  bool equals(CampaignRecord? e1, CampaignRecord? e2) {
    const listEquality = ListEquality();
    return e1?.campaignId == e2?.campaignId &&
        e1?.campaignName == e2?.campaignName &&
        e1?.description == e2?.description &&
        e1?.category == e2?.category &&
        e1?.targetAmount == e2?.targetAmount &&
        e1?.amountRaised == e2?.amountRaised &&
        e1?.status == e2?.status &&
        e1?.endDate == e2?.endDate &&
        e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.adminReviewStatus == e2?.adminReviewStatus &&
        listEquality.equals(e1?.tags, e2?.tags) &&
        e1?.visibility == e2?.visibility &&
        listEquality.equals(e1?.paymentMethods, e2?.paymentMethods) &&
        e1?.creatorId == e2?.creatorId &&
        e1?.campaignImageUrl == e2?.campaignImageUrl &&
        e1?.blurHash == e2?.blurHash &&
        listEquality.equals(e1?.donorList, e2?.donorList);
  }

  @override
  int hash(CampaignRecord? e) => const ListEquality().hash([
        e?.campaignId,
        e?.campaignName,
        e?.description,
        e?.category,
        e?.targetAmount,
        e?.amountRaised,
        e?.status,
        e?.endDate,
        e?.createdAt,
        e?.updatedAt,
        e?.adminReviewStatus,
        e?.tags,
        e?.visibility,
        e?.paymentMethods,
        e?.creatorId,
        e?.campaignImageUrl,
        e?.blurHash,
        e?.donorList
      ]);

  @override
  bool isValidKey(Object? o) => o is CampaignRecord;
}
