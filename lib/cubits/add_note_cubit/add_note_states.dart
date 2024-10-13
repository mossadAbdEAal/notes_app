class NoteState {}

class Initialstate extends NoteState {}

class Noteloadedstate extends NoteState {}
class Noteloadingstate extends NoteState {}

class Notefaliurestate extends NoteState {
  String errmessage;
  Notefaliurestate(this.errmessage);
}