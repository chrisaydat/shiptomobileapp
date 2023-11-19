import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ParcelsRecord extends FirestoreRecord {
  ParcelsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "DeliveryDate" field.
  DateTime? _deliveryDate;
  DateTime? get deliveryDate => _deliveryDate;
  bool hasDeliveryDate() => _deliveryDate != null;

  // "Dimensions" field.
  String? _dimensions;
  String get dimensions => _dimensions ?? '';
  bool hasDimensions() => _dimensions != null;

  // "Dropofflocation" field.
  String? _dropofflocation;
  String get dropofflocation => _dropofflocation ?? '';
  bool hasDropofflocation() => _dropofflocation != null;

  // "Item" field.
  String? _item;
  String get item => _item ?? '';
  bool hasItem() => _item != null;

  // "ItemDescription" field.
  String? _itemDescription;
  String get itemDescription => _itemDescription ?? '';
  bool hasItemDescription() => _itemDescription != null;

  // "Pickuplocation" field.
  String? _pickuplocation;
  String get pickuplocation => _pickuplocation ?? '';
  bool hasPickuplocation() => _pickuplocation != null;

  // "PostedDate" field.
  DateTime? _postedDate;
  DateTime? get postedDate => _postedDate;
  bool hasPostedDate() => _postedDate != null;

  // "Status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "Weight" field.
  double? _weight;
  double get weight => _weight ?? 0.0;
  bool hasWeight() => _weight != null;

  void _initializeFields() {
    _deliveryDate = snapshotData['DeliveryDate'] as DateTime?;
    _dimensions = snapshotData['Dimensions'] as String?;
    _dropofflocation = snapshotData['Dropofflocation'] as String?;
    _item = snapshotData['Item'] as String?;
    _itemDescription = snapshotData['ItemDescription'] as String?;
    _pickuplocation = snapshotData['Pickuplocation'] as String?;
    _postedDate = snapshotData['PostedDate'] as DateTime?;
    _status = snapshotData['Status'] as String?;
    _weight = castToType<double>(snapshotData['Weight']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Parcels');

  static Stream<ParcelsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ParcelsRecord.fromSnapshot(s));

  static Future<ParcelsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ParcelsRecord.fromSnapshot(s));

  static ParcelsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ParcelsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ParcelsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ParcelsRecord._(reference, mapFromFirestore(data));

  static ParcelsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      ParcelsRecord.getDocumentFromData(
        {
          'DeliveryDate': convertAlgoliaParam(
            snapshot.data['DeliveryDate'],
            ParamType.DateTime,
            false,
          ),
          'Dimensions': snapshot.data['Dimensions'],
          'Dropofflocation': snapshot.data['Dropofflocation'],
          'Item': snapshot.data['Item'],
          'ItemDescription': snapshot.data['ItemDescription'],
          'Pickuplocation': snapshot.data['Pickuplocation'],
          'PostedDate': convertAlgoliaParam(
            snapshot.data['PostedDate'],
            ParamType.DateTime,
            false,
          ),
          'Status': snapshot.data['Status'],
          'Weight': convertAlgoliaParam(
            snapshot.data['Weight'],
            ParamType.double,
            false,
          ),
        },
        ParcelsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<ParcelsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'Parcels',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'ParcelsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ParcelsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createParcelsRecordData({
  DateTime? deliveryDate,
  String? dimensions,
  String? dropofflocation,
  String? item,
  String? itemDescription,
  String? pickuplocation,
  DateTime? postedDate,
  String? status,
  double? weight,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'DeliveryDate': deliveryDate,
      'Dimensions': dimensions,
      'Dropofflocation': dropofflocation,
      'Item': item,
      'ItemDescription': itemDescription,
      'Pickuplocation': pickuplocation,
      'PostedDate': postedDate,
      'Status': status,
      'Weight': weight,
    }.withoutNulls,
  );

  return firestoreData;
}

class ParcelsRecordDocumentEquality implements Equality<ParcelsRecord> {
  const ParcelsRecordDocumentEquality();

  @override
  bool equals(ParcelsRecord? e1, ParcelsRecord? e2) {
    return e1?.deliveryDate == e2?.deliveryDate &&
        e1?.dimensions == e2?.dimensions &&
        e1?.dropofflocation == e2?.dropofflocation &&
        e1?.item == e2?.item &&
        e1?.itemDescription == e2?.itemDescription &&
        e1?.pickuplocation == e2?.pickuplocation &&
        e1?.postedDate == e2?.postedDate &&
        e1?.status == e2?.status &&
        e1?.weight == e2?.weight;
  }

  @override
  int hash(ParcelsRecord? e) => const ListEquality().hash([
        e?.deliveryDate,
        e?.dimensions,
        e?.dropofflocation,
        e?.item,
        e?.itemDescription,
        e?.pickuplocation,
        e?.postedDate,
        e?.status,
        e?.weight
      ]);

  @override
  bool isValidKey(Object? o) => o is ParcelsRecord;
}
