class LocationModel {
  Info? info;
  List<Results>? results;

  LocationModel({this.info, this.results});

  LocationModel.fromJson(Map<String, dynamic> json) {
    info = json['info'] != null ? Info.fromJson(json['info']) : null;
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (info != null) {
      data['info'] = this.info!.toJson();
    }
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Info {
  int? count;
  int? pages;
  String? next;
  Null? prev;

  Info({this.count, this.pages, this.next, this.prev});

  Info.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    pages = json['pages'];
    next = json['next'];
    prev = json['prev'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['pages'] = pages;
    data['next'] = next;
    data['prev'] = prev;
    return data;
  }
}

class Results {
  int? id;
  String? name;
  String? type;
  String? dimension;
  List<String>? residents;
  String? url;
  String? created;

  Results(
      {this.id,
      this.name,
      this.type,
      this.dimension,
      this.residents,
      this.url,
      this.created});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    dimension = json['dimension'];
    residents = json['residents'].cast<String>();
    url = json['url'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    data['dimension'] = this.dimension;
    data['residents'] = this.residents;
    data['url'] = this.url;
    data['created'] = this.created;
    return data;
  }
}
