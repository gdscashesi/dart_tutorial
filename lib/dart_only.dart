import 'dart:io';

import 'package:dart_only/candidate.dart';

List<Candidate> candidateList = [];
main() {
  while (true) {
    displayOptions();
    getOptionInput();
  }
}

//returns true if the candidate was successfully added
bool createCandidate() {
  print("Enter the candidate's name");
  String? name = stdin.readLineSync();
  if (name == null) {
    print("Cannot enter a blank name for the candidate");
    return false;
  } else {
    Candidate newCandidate = Candidate(name: name, votes: 0);

    for (Candidate current in candidateList) {
      if (current == newCandidate) {
        return false;
      }
    }
    candidateList.add(newCandidate);
    resetVoteCount();
  }

  return true;
}

void displayOptions() {
  print("\n");
  print("\n");
  print("Select an option to continue");
  print("1. Add a new Candidate");
  print("2. Remove a Candidate");
  print("3. Vote for a candidate");
  print("4. Display Results");
  print("Make your selection>>");
}

void getOptionInput() {
  String input = stdin.readLineSync()!; //assuming no wrong input can be entered
  int number = int.parse(input);
  bool result = false;

  switch (number) {
    case 1:
      result = createCandidate();
      break;
    case 2:
      result = removeCandidate();
      break;
    case 3:
      result = voteCandidate();
      break;
    case 4:
      result = true;
      displayResults();
      break;
    default:
      print("Wrong entry");
  }

  if (result) {
    print("SUCCESS");
  } else {
    print("FAILURE");
  }

  displayCandidates();
}

bool removeCandidate() {
  print("\n");
  //enter the name
  displayCandidates();
  print("Enter the name of the candidate to be removed");
  String name = stdin.readLineSync()!;
  int index = candidateList.indexWhere((candidate) => candidate.name == name);
//  bool result = candidateList.removeWhere((candidate) => candidate.name == name);

  //find them
  if (index == -1) {
    print("Candidate not found");
    return false;
  }
  //remove them
  candidateList.removeAt(index);
  return true;
}

bool voteCandidate() {
  displayCandidates();
  print("Enter the index of the candidate you want to vote for >>");
  int index = int.parse(stdin.readLineSync()!);
  if (index >= candidateList.length) {
    return false;
  }

  candidateList[index].votes++;
  return true;
}

void displayCandidates() {
  print("\n");
  print("\n");
  print("Candidates");
  for (int index = 0; index < candidateList.length; index++) {
    print("$index  ${candidateList.elementAt(index).toString()}");
  }
}

void resetVoteCount() {
  candidateList.forEach((candidate) => candidate.votes = 0);
}

void displayResults() {
  print("Current election results");
  for (Candidate candidate in candidateList) {
    print(candidate.toString());
  }
  print("\n");
}
