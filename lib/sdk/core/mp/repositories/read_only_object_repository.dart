abstract class ReadOnlyObjectRepository<M> {
  Future<M> get();

  Future<bool> exists();
}
