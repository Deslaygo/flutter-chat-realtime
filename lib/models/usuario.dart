class Usuario {
  String? uid;
  String? email;
  String? nombre;
  bool online;

  Usuario({
    this.uid,
    this.nombre,
    this.email,
    this.online = false,
  });
}
