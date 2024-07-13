


import 'dart:convert';

PhotoModel photoModelFromJson(String str) => PhotoModel.fromJson(json.decode(str));

String photoModelToJson(PhotoModel data) => json.encode(data.toJson());

class PhotoModel {
    int page;
    int perPage;
    List<Photo> photos;
    String nextPage;

    PhotoModel({
        required this.page,
        required this.perPage,
        required this.photos,
        required this.nextPage,
    });

    PhotoModel copyWith({
        int? page,
        int? perPage,
        List<Photo>? photos,
        String? nextPage,
    }) => 
        PhotoModel(
            page: page ?? this.page,
            perPage: perPage ?? this.perPage,
            photos: photos ?? this.photos,
            nextPage: nextPage ?? this.nextPage,
        );

    factory PhotoModel.fromJson(Map<String, dynamic> json) => PhotoModel(
        page: json["page"],
        perPage: json["per_page"],
        photos: List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
        nextPage: json["next_page"],
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
        "next_page": nextPage,
    };
}

class Photo {
    int id;
    int width;
    int height;
    String url;
    String photographer;
    String photographerUrl;
    int photographerId;
    String avgColor;
    Src src;
    bool liked;
    String alt;

    Photo({
        required this.id,
        required this.width,
        required this.height,
        required this.url,
        required this.photographer,
        required this.photographerUrl,
        required this.photographerId,
        required this.avgColor,
        required this.src,
        required this.liked,
        required this.alt,
    });

    Photo copyWith({
        int? id,
        int? width,
        int? height,
        String? url,
        String? photographer,
        String? photographerUrl,
        int? photographerId,
        String? avgColor,
        Src? src,
        bool? liked,
        String? alt,
    }) => 
        Photo(
            id: id ?? this.id,
            width: width ?? this.width,
            height: height ?? this.height,
            url: url ?? this.url,
            photographer: photographer ?? this.photographer,
            photographerUrl: photographerUrl ?? this.photographerUrl,
            photographerId: photographerId ?? this.photographerId,
            avgColor: avgColor ?? this.avgColor,
            src: src ?? this.src,
            liked: liked ?? this.liked,
            alt: alt ?? this.alt,
        );

    factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json["id"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
        photographer: json["photographer"],
        photographerUrl: json["photographer_url"],
        photographerId: json["photographer_id"],
        avgColor: json["avg_color"],
        src: Src.fromJson(json["src"]),
        liked: json["liked"],
        alt: json["alt"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "width": width,
        "height": height,
        "url": url,
        "photographer": photographer,
        "photographer_url": photographerUrl,
        "photographer_id": photographerId,
        "avg_color": avgColor,
        "src": src.toJson(),
        "liked": liked,
        "alt": alt,
    };
}

class Src {
    String original;
    String large2X;
    String large;
    String medium;
    String small;
    String portrait;
    String landscape;
    String tiny;

    Src({
        required this.original,
        required this.large2X,
        required this.large,
        required this.medium,
        required this.small,
        required this.portrait,
        required this.landscape,
        required this.tiny,
    });

    Src copyWith({
        String? original,
        String? large2X,
        String? large,
        String? medium,
        String? small,
        String? portrait,
        String? landscape,
        String? tiny,
    }) => 
        Src(
            original: original ?? this.original,
            large2X: large2X ?? this.large2X,
            large: large ?? this.large,
            medium: medium ?? this.medium,
            small: small ?? this.small,
            portrait: portrait ?? this.portrait,
            landscape: landscape ?? this.landscape,
            tiny: tiny ?? this.tiny,
        );

    factory Src.fromJson(Map<String, dynamic> json) => Src(
        original: json["original"],
        large2X: json["large2x"],
        large: json["large"],
        medium: json["medium"],
        small: json["small"],
        portrait: json["portrait"],
        landscape: json["landscape"],
        tiny: json["tiny"],
    );

    Map<String, dynamic> toJson() => {
        "original": original,
        "large2x": large2X,
        "large": large,
        "medium": medium,
        "small": small,
        "portrait": portrait,
        "landscape": landscape,
        "tiny": tiny,
    };
}
