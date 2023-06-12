mixin ListViewStateMixin<T> {
  TResult when<TResult extends Object>({
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(T data) ready,
    required TResult Function(String error) error,
  }) => throw UnsupportedError('...');
}