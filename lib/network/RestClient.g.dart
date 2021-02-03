// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RestClient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewUser _$NewUserFromJson(Map<String, dynamic> json) {
  return NewUser(
    id: json['id'] as int,
    email: json['email'] as String,
    username: json['username'] as String,
    name: json['name'] as String,
    roles: json['roles'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$NewUserToJson(NewUser instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'username': instance.username,
      'roles': instance.roles,
      'name': instance.name,
      'password': instance.password,
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as int,
    email: json['email'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'password': instance.password,
    };

Article _$ArticleFromJson(Map<String, dynamic> json) {
  return Article(
    id: json['id'] as int,
    title: json['title'] as String,
    content: json['content'] as String,
  );
}

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
    };

RDV _$RDVFromJson(Map<String, dynamic> json) {
  return RDV(
    id: json['id'] as int,
    title: json['title'] as String,
    status: json['status'] as int,
    date: json['date'] as String,
    isExpanded: json['isExpanded'] as bool,
  );
}

Map<String, dynamic> _$RDVToJson(RDV instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'date': instance.date,
      'status': instance.status,
      'isExpanded': instance.isExpanded,
    };

Visite _$VisiteFromJson(Map<String, dynamic> json) {
  return Visite(
    id: json['id'] as int,
    date: json['date'] as String,
    object: json['object'] as String,
    patient: json['patient'] as String,
    medecin: json['medecin'] as String,
    nurse: json['nurse'] as String,
    report: json['report'] as String,
    isExpanded: json['isExpanded'] as bool,
  );
}

Map<String, dynamic> _$VisiteToJson(Visite instance) => <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'object': instance.object,
      'patient': instance.patient,
      'medecin': instance.medecin,
      'nurse': instance.nurse,
      'report': instance.report,
      'isExpanded': instance.isExpanded,
    };

Report _$ReportFromJson(Map<String, dynamic> json) {
  return Report(
    id: json['id'] as int,
    heat: json['heat'] as int,
    pressure: json['pressure'] as int,
    bsl: json['bsl'] as int,
    neuro: json['neuro'] as String,
  );
}

Map<String, dynamic> _$ReportToJson(Report instance) => <String, dynamic>{
      'id': instance.id,
      'heat': instance.heat,
      'pressure': instance.pressure,
      'bsl': instance.bsl,
      'neuro': instance.neuro,
    };

Wound _$WoundFromJson(Map<String, dynamic> json) {
  return Wound(
    id: json['id'] as int,
    date: json['date'] as String,
    redness: json['redness'] as bool,
    heat: json['heat'] as int,
    pain: json['pain'] as int,
    odour: json['odour'] as String,
    flow: json['flow'] as int,
    ost: json['ost'] as int,
  );
}

Map<String, dynamic> _$WoundToJson(Wound instance) => <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'redness': instance.redness,
      'heat': instance.heat,
      'pain': instance.pain,
      'odour': instance.odour,
      'flow': instance.flow,
      'ost': instance.ost,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'https://cicatplus.com/api';
  }

  final Dio _dio;

  String baseUrl;

  @override
  getUser() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request('/users',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = User.fromJson(_result.data);
    return value;
  }

  @override
  getListUser() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request('/users',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => User.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  getTasks() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request('/articles',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Article.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  getVisite() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request('/visites',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Visite.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  getRDV() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request('/rdvs',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => RDV.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  getReport() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request('/reports',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Report.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  getWound() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request('/wounds',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Wound.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  postUser(email, password) async {
    ArgumentError.checkNotNull(email, 'email');
    ArgumentError.checkNotNull(password, 'password');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'email': email, 'password': password};
    _data.removeWhere((k, v) => v == null);
    final Response<Map<String, dynamic>> _result = await _dio.request('/login',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = User.fromJson(_result.data);
    return value;
  }

  @override
  postNewUser(email, username, roles, name, password) async {
    ArgumentError.checkNotNull(email, 'email');
    ArgumentError.checkNotNull(username, 'username');
    ArgumentError.checkNotNull(roles, 'roles');
    ArgumentError.checkNotNull(name, 'name');
    ArgumentError.checkNotNull(password, 'password');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {
      'email': email,
      'username': username,
      'roles': roles,
      'name': name,
      'password': password
    };
    _data.removeWhere((k, v) => v == null);
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/users/create',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = NewUser.fromJson(_result.data);
    return value;
  }

  @override
  postArticle(title, author, content, publishedAt) async {
    ArgumentError.checkNotNull(title, 'title');
    ArgumentError.checkNotNull(author, 'author');
    ArgumentError.checkNotNull(content, 'content');
    ArgumentError.checkNotNull(publishedAt, 'publishedAt');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {
      'title': title,
      'author': author,
      'content': content,
      'publishedAt': publishedAt
    };
    _data.removeWhere((k, v) => v == null);
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/articles',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Article.fromJson(_result.data);
    return value;
  }

  @override
  postRDV(title, date, status) async {
    ArgumentError.checkNotNull(title, 'title');
    ArgumentError.checkNotNull(date, 'date');
    ArgumentError.checkNotNull(status, 'status');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'title': title, 'date': date, 'status': status};
    _data.removeWhere((k, v) => v == null);
    final Response<Map<String, dynamic>> _result = await _dio.request('/rdvs',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = RDV.fromJson(_result.data);
    return value;
  }

  @override
  postVisite(date, object) async {
    ArgumentError.checkNotNull(date, 'date');
    ArgumentError.checkNotNull(object, 'object');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'date': date, 'object': object};
    _data.removeWhere((k, v) => v == null);
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/visites',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Visite.fromJson(_result.data);
    return value;
  }

  @override
  postReport(heat, pressure, bsl, neuro) async {
    ArgumentError.checkNotNull(heat, 'heat');
    ArgumentError.checkNotNull(pressure, 'pressure');
    ArgumentError.checkNotNull(bsl, 'bsl');
    ArgumentError.checkNotNull(neuro, 'neuro');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {
      'heat': heat,
      'pressure': pressure,
      'bsl': bsl,
      'neuro': neuro
    };
    _data.removeWhere((k, v) => v == null);
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/reports',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Report.fromJson(_result.data);
    return value;
  }

  @override
  postWound(date, redness, heat, pain, odour, flow, ost) async {
    ArgumentError.checkNotNull(date, 'date');
    ArgumentError.checkNotNull(redness, 'redness');
    ArgumentError.checkNotNull(heat, 'heat');
    ArgumentError.checkNotNull(pain, 'pain');
    ArgumentError.checkNotNull(odour, 'odour');
    ArgumentError.checkNotNull(flow, 'flow');
    ArgumentError.checkNotNull(ost, 'ost');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {
      'date': date,
      'redness': redness,
      'heat': heat,
      'pain': pain,
      'odour': odour,
      'flow': flow,
      'ost': ost
    };
    _data.removeWhere((k, v) => v == null);
    final Response<Map<String, dynamic>> _result = await _dio.request('/wounds',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Wound.fromJson(_result.data);
    return value;
  }

  @override
  updateTask(id, title, author, content) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(title, 'title');
    ArgumentError.checkNotNull(author, 'author');
    ArgumentError.checkNotNull(content, 'content');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/tasks/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Article.fromJson(_result.data);
    return value;
  }

  @override
  deleteArticle(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/articles/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'DELETE',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Article.fromJson(_result.data);
    return value;
  }

  @override
  deleteVisite(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/visites/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'DELETE',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Visite.fromJson(_result.data);
    return value;
  }

  @override
  deleteRDV(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/rdvs/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'DELETE',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = RDV.fromJson(_result.data);
    return value;
  }

  @override
  deleteReport(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/reports/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'DELETE',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Report.fromJson(_result.data);
    return value;
  }

  @override
  deleteWound(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/wounds/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'DELETE',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Wound.fromJson(_result.data);
    return value;
  }
}
