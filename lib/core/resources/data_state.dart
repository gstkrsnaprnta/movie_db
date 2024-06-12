enum DataStateStatus { initial, loading, success, error }

class DataState<T> {
  final DataStateStatus status;
  final T? data;
  final String? error;

  const DataState._({required this.status, this.data, this.error});

  factory DataState.initial() =>
      const DataState._(status: DataStateStatus.initial);

  factory DataState.loading() =>
      const DataState._(status: DataStateStatus.loading);

  factory DataState.success(T data) =>
      DataState._(status: DataStateStatus.success, data: data);

  factory DataState.error(String error) =>
      DataState._(status: DataStateStatus.error, error: error);
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data)
      : super._(status: DataStateStatus.success, data: data);
}
