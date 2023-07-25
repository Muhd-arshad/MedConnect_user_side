
import 'dart:convert';

Departmentmodel departmentmodelFromJson(String str) => Departmentmodel.fromJson(json.decode(str));

String departmentmodelToJson(Departmentmodel data) => json.encode(data.toJson());

class Departmentmodel {
     List<Department> departments=[];

    Departmentmodel({
        required this.departments,
    });

    factory Departmentmodel.fromJson(Map<String, dynamic> json) => Departmentmodel(
        departments: List<Department>.from(json["departments"].map((x) => Department.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "departments": List<dynamic>.from(departments.map((x) => x.toJson())),
    };
}

class Department {
    final String? id;
    final String? departmentName;
    final String? departmentDiscription;
    final String? departmentImage;
    final bool? show;
    final int? v;

    Department({
       this.id,
       this.departmentName,
       this.departmentDiscription,
       this.departmentImage,
       this.show,
       this.v,
    });

    factory Department.fromJson(Map<String, dynamic> json) => Department(
        id: json["_id"],
        departmentName: json["departmentName"],
        departmentDiscription: json["departmentDiscription"],
        departmentImage: json["departmentImage"],
        show: json["show"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "departmentName": departmentName,
        "departmentDiscription": departmentDiscription,
        "departmentImage": departmentImage,
        "show": show,
        "__v": v,
    };
}