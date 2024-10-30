class Restaurant {
  final String _name;
  final String _description;
  final List<dynamic> _imagenes;
  final double _rating;
  final int _count;

  Restaurant(
    this._name,
    this._description,
    this._imagenes,
    this._rating,
    this._count,
  );

  String get name => _name;
  String get description => _description;
  List<dynamic> get imagenes => _imagenes;
  double get rating => _rating;
  int get count => _count;
}