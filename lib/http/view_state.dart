import 'package:leshua/http/mixin_listview_state.dart';

class ListViewState<T> with ListViewStateMixin<T> {
  const factory ListViewState.loading() = Loading;

  const factory ListViewState.empty() = Empty;

  const factory ListViewState.ready(T data) = Ready<T>;

  const factory ListViewState.error(String error) = Error;
}

class Loading<T> implements ListViewState<T> {
  const Loading();

  @override
  TResult when<TResult extends Object>(
      {required TResult Function() loading,
      required TResult Function() empty,
      required TResult Function(T data) ready,
      required TResult Function(String error) error}) {
    return loading.call();
  }
}

class Empty<T> implements ListViewState<T> {
  const Empty();

  @override
  TResult when<TResult extends Object>(
      {required TResult Function() loading,
      required TResult Function() empty,
      required TResult Function(T data) ready,
      required TResult Function(String error) error}) {
    return empty();
  }
}

class Ready<T> implements ListViewState<T> {
  final T data;

  const Ready(this.data);

  @override
  TResult when<TResult extends Object>(
      {required TResult Function() loading,
      required TResult Function() empty,
      required TResult Function(T data) ready,
      required TResult Function(String error) error}) {
    return ready(data);
  }
}

class Error<T> implements ListViewState<T> {
  final String error;

  const Error(this.error);

  @override
  TResult when<TResult extends Object>(
      {required TResult Function() loading,
      required TResult Function() empty,
      required TResult Function(T data) ready,
      required TResult Function(String error) error}) {
    return error(this.error);
  }
}
