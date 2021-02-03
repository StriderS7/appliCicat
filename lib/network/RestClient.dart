import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

// Source code generation in Dart works by creating a new file which contains a "companion class".
// In order for the source gen to know which file to generate and which files are "linked", you need to use the part keyword.
part 'RestClient.g.dart';

@RestApi(baseUrl: 'https://cicatplus.com/api')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/users")
  Future<User> getUser();

  @GET("/users")
  Future<List<User>> getListUser();

  @GET("/articles")
  Future<List<Article>> getTasks();

  @GET("/visites")
  Future<List<Visite>> getVisite();

  @GET("/rdvs")
  Future<List<RDV>> getRDV();

  @GET("/reports")
  Future<List<Report>> getReport();

  @GET("/wounds")
  Future<List<Wound>> getWound();

  @POST("/login")
  Future<User> postUser(@Field() String email, @Field() String password);

  @POST("/users/create")
  Future<NewUser> postNewUser(@Field() String email, @Field() String username,
      @Field() String roles, @Field() String name, @Field() String password);

  @POST("/articles")
  Future<Article> postArticle(@Field() String title, @Field() String author,
      @Field() String content, @Field() String publishedAt);

  @POST("/rdvs")
  Future<RDV> postRDV(
      @Field() String title, @Field() String date, @Field() int status);

  @POST("/visites")
  Future<Visite> postVisite(
    @Field() String date,
    @Field() String object,
    //@Field() String nurse,
    //@Field() String report
  );
  @POST("/reports")
  Future<Report> postReport(
    //@Field() String date,
    @Field() int heat,
    @Field() int pressure,
    @Field() int bsl,
    @Field() String neuro,
  );
  @POST("/wounds")
  Future<Wound> postWound(
    //@Field() String date,
    @Field() String date,
    @Field() bool redness,
    @Field() int heat,
    @Field() int pain,
    @Field() String odour,
    @Field() int flow,
    @Field() int ost,
  );
  @PUT("/tasks/{id}")
  Future<Article> updateTask(
      @Path() int id, String title, String author, String content);

  @DELETE("/articles/{id}")
  Future<Article> deleteArticle(@Path() int id);

  @DELETE("/visites/{id}")
  Future<Visite> deleteVisite(@Path() int id);

  @DELETE("/rdvs/{id}")
  Future<RDV> deleteRDV(@Path() int id);

  @DELETE("/reports/{id}")
  Future<Report> deleteReport(@Path() int id);

  @DELETE("/wounds/{id}")
  Future<Wound> deleteWound(@Path() int id);
}

@JsonSerializable()
class NewUser {
  int id;
  String email;
  String username;
  String roles;
  String name;
  String password;

  NewUser(
      {this.id,
      this.email,
      this.username,
      this.name,
      this.roles,
      this.password});

  factory NewUser.fromJson(Map<String, dynamic> json) =>
      _$NewUserFromJson(json);
  Map<String, dynamic> toJson() => _$NewUserToJson(this);
}

@JsonSerializable()
class User {
  int id;
  String email;
  String password;

  User({this.id, this.email, this.password});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Article {
  int id;
  String title;
  String content;

  Article({this.id, this.title, this.content});

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}

@JsonSerializable()
class RDV {
  int id;
  String title;
  String date;
  int status;
  bool isExpanded;

  RDV({this.id, this.title, this.status, this.date, this.isExpanded = false});

  factory RDV.fromJson(Map<String, dynamic> json) => _$RDVFromJson(json);
  Map<String, dynamic> toJson() => _$RDVToJson(this);
}

@JsonSerializable()
class Visite {
  int id;
  String date;
  String object;
  String patient;
  String medecin;
  String nurse;
  String report;
  bool isExpanded;

  Visite(
      {this.id,
      this.date,
      this.object,
      this.patient,
      this.medecin,
      this.nurse,
      this.report,
      this.isExpanded = false});

  factory Visite.fromJson(Map<String, dynamic> json) => _$VisiteFromJson(json);
  Map<String, dynamic> toJson() => _$VisiteToJson(this);
}

@JsonSerializable()
class Report {
  int id;
  int heat;
  int pressure;
  int bsl;
  String neuro;

  Report({this.id, this.heat, this.pressure, this.bsl, this.neuro});

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);
  Map<String, dynamic> toJson() => _$ReportToJson(this);
}

@JsonSerializable()
class Wound {
  int id;
  String date;
  bool redness;
  int heat;
  int pain;
  String odour;
  int flow;
  int ost;

  Wound(
      {this.id,
      this.date,
      this.redness,
      this.heat,
      this.pain,
      this.odour,
      this.flow,
      this.ost});

  factory Wound.fromJson(Map<String, dynamic> json) => _$WoundFromJson(json);
  Map<String, dynamic> toJson() => _$WoundToJson(this);
}
