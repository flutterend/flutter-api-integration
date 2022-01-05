class Category {
  final Info info;
  final Item item;
  Category({required this.info, required this.item});
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      info: Info.fromJson(json),
      item: Item.fromJson(json),
    );
  }
}

class Info {
  final String postmanId;
  final String name;
  final String schema;

  Info({
    required this.postmanId,
    required this.name,
    required this.schema,
  });

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      postmanId: json['_postman_id'] as String,
      name: json['name'],
      schema: json['schema'],
    );
  }
}

class Item {
  final String name;
  final String id;
  final Request request;
  final String response;
  Item(
      {required this.name,
      required this.id,
      required this.request,
      required this.response});
  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
        name: json['name'],
        id: json['id'],
        request: Request.fromJson(json),
        response: json['response']);
  }
}

class Request {
  final String method;
  final Header header;
  final Body body;
  final String url;
  Request(
      {required this.method,
      required this.header,
      required this.body,
      required this.url});
  factory Request.fromJson(Map<String, dynamic> json) {
    return Request(
      method: json['method'],
      header: Header.fromJson(json),
      body: Body.fromJson(json),
      url: json['url'],
    );
  }
}

class Header {
  final Content content;
  Header({required this.content});
  factory Header.fromJson(Map<String, dynamic> json) {
    return Header(content: Content.fromJson(json));
  }
}

class Content {
  final String key;
  final String value;

  Content({
    required this.key,
    required this.value,
  });
  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
      key: json['key'],
      value: json['value'],
    );
  }
}

class Body {
  final String mode;
  // final List<Urlencoded> urlencoded;
  final Urlencoded urlencoded;
  final String url;
  Body({required this.mode, required this.urlencoded, required this.url});
  factory Body.fromJson(Map<String, dynamic> json) {
    return Body(
      mode: json['mode'],
      //     urlencoded: List <Urlencoded> urlencoded[0] = Urlencoded.fromJson(json),
      urlencoded: Urlencoded.fromJson(json),
      url: json['url'],
    );
  }
}

class Urlencoded {
  final Language language;
  final User user;
  Urlencoded({required this.language, required this.user});
  factory Urlencoded.fromJson(Map<String, dynamic> json) {
    return Urlencoded(
      language: Language.fromJson(json),
      user: User.fromJson(json),
    );
  }
}

class Language {
  final String key;
  final String value;
  final String type;

  Language({
    required this.key,
    required this.value,
    required this.type,
  });
  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      key: json['key'],
      value: json['value'],
      type: json['type'],
    );
  }
}

class User {
  final String key;
  final String value;
  final String type;
  final bool disabled;
  User(
      {required this.key,
      required this.value,
      required this.type,
      required this.disabled});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      key: json['key'],
      value: json['value'],
      type: json['type'],
      disabled: json['disabled'],
    );
  }
}
