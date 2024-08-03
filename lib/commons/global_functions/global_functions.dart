/// Returns a string for [props].
String mapPropsToString(Type runtimeType, List<Object?> props) =>
    '$runtimeType(${props.map((Object? prop) => prop.toString()).join(', ')})';