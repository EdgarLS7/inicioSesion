import 'package:flt_login/models/models.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {

  final Product product;

  const ProductCard({
    Key? key, 
    required this.product
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: const EdgeInsets.only( top: 30, bottom: 50),
        width: double.infinity,
        height: 400,
        decoration: _cardBorders(),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            _BackgroundImage(product.picture),

            _ProductDetails(
              title   : product.name,
              subTitle: product.id!,
            ),

            Positioned(
              top: 0,
              right: 0,
              child: _PriceTag( product.price )
            ),

            if ( !product.available)
              Positioned(
                top: 0,
                left: 0,
                child: _NotAvailable()
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration _cardBorders() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20),
    boxShadow: const [
      BoxShadow(
        color: Colors.black12,
        offset: Offset(0,7),
        blurRadius: 10
      )
    ]
  );
}

class _NotAvailable extends StatelessWidget {
  const _NotAvailable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            'No disponible',
            style: TextStyle(color: Colors.black, fontSize: 20),
          )
        ),
      ),
      width: 105,
      height: 40,
      decoration: const BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.only( topLeft: Radius.circular(20), bottomRight: Radius.circular(20))
      ),
    );
  }
}

class _PriceTag extends StatelessWidget {
  
  final double price;

  const _PriceTag( this.price ); 
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text('\$$price', 
          style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
      ),
      width: 100,
      height: 55,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomLeft: Radius.circular(20))
      ),
    );
  }
}

class _BackgroundImage extends StatelessWidget {

  final String? url;

  const _BackgroundImage(this.url) ;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        height: 400,
        child: FadeInImage(
          //TODO Fix productos cuando no hay imagen
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: NetworkImage(url!),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _ProductDetails extends StatelessWidget {
  
  final String title;
  final String subTitle;

  const _ProductDetails({
    required this.title, 
    required this.subTitle
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only( right: 70),
      child: Container(
        width: double.infinity,
        height: 70,
        decoration: _buildBoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, 
              style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(subTitle, 
              style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => const BoxDecoration(
    color: Colors.indigo,
    borderRadius: BorderRadius.only( bottomLeft: Radius.circular(20), topRight: Radius.circular(20))
  );
}
