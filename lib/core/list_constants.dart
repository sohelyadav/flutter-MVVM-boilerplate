class ListConstants {
  // static List<ListClass> signupDescribe = [
  //   ListClass(texts: "", values: ""),
  // ];

}

class ListClass {
  String? text;
  String? value;
  ListClass({String? texts, String? values}) {
    text = texts!;
    value = values;
  }
}
