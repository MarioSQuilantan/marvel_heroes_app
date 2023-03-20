import '../../domain/entities/original_issue_entity.dart';

class OriginalIssueModel extends OriginalIssue {
  const OriginalIssueModel({
    required super.resourceUri,
    required super.name,
  });

  factory OriginalIssueModel.fromJson(Map<String, dynamic> json) => OriginalIssueModel(
        resourceUri: json["resourceURI"],
        name: json["name"],
      );

  factory OriginalIssueModel.fromEntity(OriginalIssue originalIssue) => OriginalIssueModel(
        resourceUri: originalIssue.resourceUri,
        name: originalIssue.name,
      );

  Map<String, dynamic> toJson() => {
        "resourceURI": resourceUri,
        "name": name,
      };
}
