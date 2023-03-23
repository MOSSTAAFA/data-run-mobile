/// Represents a tuple of objects.
/// It is useful for implementing a function returning a trio of objects.
class Trio<F, S, T> {

  const Trio(this.first, this.second, this.third);
  Trio.fromJson(List json): this(json[0] as F, json[1] as S, json[2] as T);
  final F first;
  final S second;
  final T third;

  T get last => third;

  List toJson() => [first, second, third];

  @override
  int get hashCode => Object.hash(first, second, third);
  @override
  bool operator==(Object o) => o is Trio && first == o.first
      && second == o.second && third == o.third;
  @override
  String toString() => toJson().toString();
}
