import 'package:equatable/equatable.dart';
import 'package:pharma/data/data_resource/local_resource/data_store.dart';

// ignore: must_be_immutable
class GetSearchParams extends Equatable {
  String? textSearch;
  int? page;

  GetSearchParams({
    this.textSearch,
    this.page,
  });

  Map<String, dynamic> toJson() => {
        "search": textSearch,
        "page": page,
        'lang': DataStore.instance.lang,
      };

  factory GetSearchParams.fromGetVendorsParams(GetSearchParams params) =>
      GetSearchParams(
        textSearch: params.textSearch,
        page: params.page,
      );

  GetSearchParams setNewSortingValue(
      {required GetSearchParams getVendorsParams}) {
    return GetSearchParams(
      textSearch: getVendorsParams.textSearch ?? textSearch,

      ///PAGENATION

      page: getVendorsParams.page ?? page,
    );
  }

  GetSearchParams setNewFilteringValues(
      {required GetSearchParams getVendorsParams}) {
    return GetSearchParams(
      textSearch: textSearch,

      ///PAGENATION
      page: page,
    );
  }

  GetSearchParams copyWith({
    String? textSearch,
    int? skipCount,
  }) {
    return GetSearchParams(
      textSearch: textSearch ?? this.textSearch,

      ///PAGENATION

      page: skipCount ?? this.page,
    );
  }

  @override
  List<Object?> get props => [
        textSearch,
        page,
      ];
}
