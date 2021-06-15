class Product {
  late String codigoArticulo;
  late String cantidad;
  late String notas;
  late String envioParcial;
  late String precioSinIva;
  late String montoIva;
  late String porcentajeIva;
  late String codigoTarifa;
  late String precioIva;
  late String porcentajeDescuento;
  late String montoDescuento;
  late String bonificacion;
  late String codImpuesto;

  Product(
      {required this.codigoArticulo,
      required this.cantidad,
      required this.notas,
      required this.envioParcial,
      required this.precioSinIva,
      required this.montoIva,
      required this.porcentajeIva,
      required this.codigoTarifa,
      required this.precioIva,
      required this.porcentajeDescuento,
      required this.montoDescuento,
      required this.bonificacion,
      required this.codImpuesto});
  Product.fromJson(Map<String, dynamic> json) {
    this.codigoArticulo = json['codigo_articulo'];
    this.cantidad = json['cantidad'];
    this.notas = json['notas'];
    this.envioParcial = json['envio_parcial'];
    this.precioSinIva = json['precio_sin_iva'];
    this.montoIva = json['monto_iva'];
    this.porcentajeIva = json['porcentaje_iva'];
    this.codigoTarifa = json['codigo_tarifa'];
    this.precioIva = json['precio_iva'];
    this.porcentajeDescuento = json['porcentaje_descuento'];
    this.montoDescuento = json['monto_descuento'];
    this.bonificacion = json['bonificacion'];
    this.codImpuesto = json['cod_impuesto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['codigo_articulo'] = this.codigoArticulo;
    data['cantidad'] = this.cantidad;
    data['notas'] = this.notas;
    data['envio_parcial'] = this.envioParcial;
    data['precio_sin_iva'] = this.precioSinIva;
    data['monto_iva'] = this.montoIva;
    data['porcentaje_iva'] = this.porcentajeIva;
    data['codigo_tarifa'] = this.codigoTarifa;
    data['precio_iva'] = this.precioIva;
    data['porcentaje_descuento'] = this.porcentajeDescuento;
    data['monto_descuento'] = this.montoDescuento;
    data['bonificacion'] = this.bonificacion;
    data['cod_impuesto'] = this.codImpuesto;
    return data;
  }
}
