/// Returns a string for [props].
String mapPropsToString(Type runtimeType, List<Object?> props) =>
    '$runtimeType(${props.map((prop) => prop.toString()).join(', ')})';