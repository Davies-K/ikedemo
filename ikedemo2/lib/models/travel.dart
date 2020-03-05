
class Travel{

  final String coverType;
  final String startDate;
  final String endDate;
  final String distination;
  final String ageRange;
  //final url = 'http://10.0.2.2/PROJECTHANA/INSURANCE/v1/travel/index';
  final url = 'http://insurance.jilsoft.org/travel/index';
  
  Travel({this.coverType,this.distination,this.ageRange,this.startDate, this.endDate});

  factory Travel.fromJson(Map<String, dynamic> json){
    return Travel(
      coverType: json['coverType'],
      distination:json['distination'],
      ageRange: json['ageRange'],
      startDate: json['startDate'],
      endDate: json['endDate'],
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["coverType"]   = coverType;
    map["distination"] = distination;
    map["ageRange"]    = ageRange;
    map["startDate"]   = startDate;
    map["endDate"]     = endDate;

    return map;
  }
  
}

/*Future<Post> createPost(String url, {Map body}) async {
  return http.post(url, body: body).then((http.Response response) {
    final int statusCode = response.statusCode;
     body  = json.decode(response.body);

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    print(body["message"]);

    //print(Post.fromJson(json.decode(response.body)));
  });
} */

