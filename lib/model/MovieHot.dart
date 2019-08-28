class MovieHot {
  int count;
  int start;
  List<Subjects> subjects;
  String title;
  int total;

  MovieHot({this.count, this.start, this.subjects, this.title, this.total});

  MovieHot.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    start = json['start'];
    if (json['subjects'] != null) {
      subjects = new List<Subjects>();
      json['subjects'].forEach((v) {
        subjects.add(new Subjects.fromJson(v));
      });
    }
    title = json['title'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['start'] = this.start;
    if (this.subjects != null) {
      data['subjects'] = this.subjects.map((v) => v.toJson()).toList();
    }
    data['title'] = this.title;
    data['total'] = this.total;
    return data;
  }
}

class Directors {
  String alt;
  Avatars avatars;
  String id;
  String name;
  String nameEn;

  Directors({this.alt, this.avatars, this.id, this.name, this.nameEn});

  Directors.fromJson(Map<String, dynamic> json) {
    alt = json['alt'];
    avatars =
        json['avatars'] != null ? new Avatars.fromJson(json['avatars']) : null;
    id = json['id'];
    name = json['name'];
    nameEn = json['name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alt'] = this.alt;
    if (this.avatars != null) {
      data['avatars'] = this.avatars.toJson();
    }
    data['id'] = this.id;
    data['name'] = this.name;
    data['name_en'] = this.nameEn;
    return data;
  }
}

class Avatars {
  String large;
  String medium;
  String small;

  Avatars({this.large, this.medium, this.small});

  Avatars.fromJson(Map<String, dynamic> json) {
    large = json['large'];
    medium = json['medium'];
    small = json['small'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['large'] = this.large;
    data['medium'] = this.medium;
    data['small'] = this.small;
    return data;
  }
}

class Images {
  String large;
  String medium;
  String small;

  Images({this.large, this.medium, this.small});

  Images.fromJson(Map<String, dynamic> json) {
    large = json['large'];
    medium = json['medium'];
    small = json['small'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['large'] = this.large;
    data['medium'] = this.medium;
    data['small'] = this.small;
    return data;
  }
}

class Subjects {
  String alt;
  List<Casts> casts;
  int collectCount;
  List<Directors> directors;
  List<String> durations;
  List<String> genres;
  bool hasVideo;
  String id;
  Images images;
  String mainlandPubdate;
  String originalTitle;
  List<String> pubdates;
  Rating rating;
  String subtype;
  String title;
  String year;

  Subjects(
      {this.alt,
      this.casts,
      this.collectCount,
      this.directors,
      this.durations,
      this.genres,
      this.hasVideo,
      this.id,
      this.images,
      this.mainlandPubdate,
      this.originalTitle,
      this.pubdates,
      this.rating,
      this.subtype,
      this.title,
      this.year});

  Subjects.fromJson(Map<String, dynamic> json) {
    alt = json['alt'];
    if (json['casts'] != null) {
      casts = new List<Casts>();
      json['casts'].forEach((v) {
        casts.add(new Casts.fromJson(v));
      });
    }
    collectCount = json['collect_count'];
    if (json['directors'] != null) {
      directors = new List<Directors>();
      json['directors'].forEach((v) {
        directors.add(new Directors.fromJson(v));
      });
    }
    durations = json['durations'].cast<String>();
    genres = json['genres'].cast<String>();
    hasVideo = json['has_video'];
    id = json['id'];
    images =
        json['images'] != null ? new Images.fromJson(json['images']) : null;
    mainlandPubdate = json['mainland_pubdate'];
    originalTitle = json['original_title'];
    pubdates = json['pubdates'].cast<String>();
    rating =
        json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
    subtype = json['subtype'];
    title = json['title'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alt'] = this.alt;
    if (this.casts != null) {
      data['casts'] = this.casts.map((v) => v.toJson()).toList();
    }
    data['collect_count'] = this.collectCount;
    if (this.directors != null) {
      data['directors'] = this.directors.map((v) => v.toJson()).toList();
    }
    data['durations'] = this.durations;
    data['genres'] = this.genres;
    data['has_video'] = this.hasVideo;
    data['id'] = this.id;
    if (this.images != null) {
      data['images'] = this.images.toJson();
    }
    data['mainland_pubdate'] = this.mainlandPubdate;
    data['original_title'] = this.originalTitle;
    data['pubdates'] = this.pubdates;
    if (this.rating != null) {
      data['rating'] = this.rating.toJson();
    }
    data['subtype'] = this.subtype;
    data['title'] = this.title;
    data['year'] = this.year;
    return data;
  }
}

class Casts {
  String alt;
  Avatars avatars;
  String id;
  String name;
  String nameEn;

  Casts({this.alt, this.avatars, this.id, this.name, this.nameEn});

  Casts.fromJson(Map<String, dynamic> json) {
    alt = json['alt'];
    avatars =
        json['avatars'] != null ? new Avatars.fromJson(json['avatars']) : null;
    id = json['id'];
    name = json['name'];
    nameEn = json['name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alt'] = this.alt;
    if (this.avatars != null) {
      data['avatars'] = this.avatars.toJson();
    }
    data['id'] = this.id;
    data['name'] = this.name;
    data['name_en'] = this.nameEn;
    return data;
  }
}

class Rating {
  int max;
  int min;
  num average;
  String stars;

  Rating({this.max, this.min, this.average, this.stars});

  Rating.fromJson(Map<String, dynamic> json) {
    max = json['max'];
    min = json['min'];
    average = json['average'];
    stars = json['stars'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['max'] = this.max;
    data['min'] = this.min;
    data['average'] = this.average;
    data['stars'] = this.stars;
    return data;
  }
}
