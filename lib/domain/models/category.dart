
class Category {
  final String? image;
  final bool? isSelected;
  final String? name; 
  Category({this.image, this.isSelected, this.name});
}

 List<Category> categories = [
    Category(
      name: 'ACCESORIOS Y OTROS',
      image: 'assets/icons/Boton_naranja_inactivo_Accesorios.svg'
    ),
    Category(
      name: 'CARNE DE CERDO',
      image: 'assets/icons/Boton_naranja_inactivo_carniceria.svg'
    ),
    Category(
      name: 'FRUTAS',
      image: 'assets/icons/Boton_naranja_inactivo_Frutas_y_verduras.svg'
    ),
    Category(
      name: 'GRANEL',
      image: 'assets/icons/Boton_naranja_inactivo_Granel.svg'
    ),
    Category(
      name: 'JARDINERIA',
      image: 'assets/icons/Boton_naranja_inactivo_Jardineria.svg'
    ),
    Category(
      name: 'LICORES',
      image: 'assets/icons/Boton_naranja_inactivo_Licores_y_cerveza.svg'
    ),
    Category(
      name: 'PANADERIA',
      image: 'assets/icons/Boton_naranja_inactivo_panaderia.svg'
    ),
    Category(
      name: 'ABARROTES',
      image: 'assets/icons/Boton_naranja_inactivo_Abarrotes.svg'
    )
  ];

