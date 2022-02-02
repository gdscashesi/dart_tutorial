class Candidate {
  String name;
  static int candidateCounts = 0;
  late int votes;
  // int _votes;

  Candidate({required this.name, required this.votes}) {
    candidateCounts++;
  }

  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is Candidate && name == other.name;
  }

  @override
  String toString() {
    return "$name => $votes";
  }
  // Candidate(this.name, this._votes) {
  // votes = _votes;
  // }
}
