// ignore_for_file: unused_local_variable, non_constant_identifier_names, sized_box_for_whitespace, no_leading_underscores_for_local_identifiers, avoid_print

import 'package:flutter/material.dart';
import 'package:shopping_application/models/user.dart';
import 'package:shopping_application/pages/product_page.dart';
import 'package:shopping_application/pages/searchdelegate.dart';

class Home extends StatefulWidget {
  final Product user;
  const Home(this.user,{super.key,});
  @override
  State<Home> createState() => _HomeState();
}

@override
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    final List<Product> Electronics = [
      Product(
          id:9,
          title:"WD 2TB Elements Portable External Hard Drive - USB 3.0 ",
          price:64,
          description:"USB 3.0 and USB 2.0 Compatibility Fast data transfers Improve PC Performance High Capacity; Compatibility Formatted NTFS for Windows 10, Windows 8.1, Windows 7; Reformatting may be required for other operating systems; Compatibility may vary depending on user’s hardware configuration and operating system",
          category:"electronics",
          image:"https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_.jpg",
          rating:'{"rate":3.3,"count":203}', quantity: 1,favorite: false, getTotalPrice: '',
          ),
      Product(
          id:10,
          title:"SanDisk SSD PLUS 1TB Internal SSD - SATA III 6 Gb/s",
          price:109,
          description:"Easy upgrade for faster boot up, shutdown, application load and response (As compared to 5400 RPM SATA 2.5” hard drive; Based on published specifications and internal benchmarking tests using PCMark vantage scores) Boosts burst write performance, making it ideal for typical PC workloads The perfect balance of performance and reliability Read/write speeds of up to 535MB/s/450MB/s (Based on internal testing; Performance may vary depending upon drive capacity, host device, OS and application.)",
          category:"electronics",
          image:"https://fakestoreapi.com/img/61U7T1koQqL._AC_SX679_.jpg",
          rating:'{"rate":2.9,"count":470}',quantity: 1,favorite: false,getTotalPrice: ''
          ),
      Product(
          id:11,
          title:"Silicon Power 256GB SSD 3D NAND A55 SLC Cache Performance Boost SATA III 2.5",
          price:109,
          description:"3D NAND flash are applied to deliver high transfer speeds Remarkable transfer speeds that enable faster bootup and improved overall system performance. The advanced SLC Cache Technology allows performance boost and longer lifespan 7mm slim design suitable for Ultrabooks and Ultra-slim notebooks. Supports TRIM command, Garbage Collection technology, RAID, and ECC (Error Checking & Correction) to provide the optimized performance and enhanced reliability.",
          category:"electronics",
          image:"https://fakestoreapi.com/img/71kWymZ+c+L._AC_SX679_.jpg",
          rating:'{"rate":4.8,"count":319}',quantity: 1,favorite: false,getTotalPrice: ''
         ),
      Product(
          id:12,
          title:"WD 4TB Gaming Drive Works with Playstation 4 Portable External Hard Drive",
          price:114,
          description:"Expand your PS4 gaming experience, Play anywhere Fast and easy, setup Sleek design with high capacity, 3-year manufacturer's limited warranty",
          category:"electronics",
          image:"https://fakestoreapi.com/img/61mtL65D4cL._AC_SX679_.jpg",
          rating:'{"rate":4.8,"count":400}',quantity: 1,favorite: false,getTotalPrice: ''
          ),
      Product(
          id:13,
          title:"Acer SB220Q bi 21.5 inches Full HD (1920 x 1080) IPS Ultra-Thin",
          price:599,
          description:"21. 5 inches Full HD (1920 x 1080) widescreen IPS display And Radeon free Sync technology. No compatibility for VESA Mount Refresh Rate: 75Hz - Using HDMI port Zero-frame design | ultra-thin | 4ms response time | IPS panel Aspect ratio - 16: 9. Color Supported - 16. 7 million colors. Brightness - 250 nit Tilt angle -5 degree to 15 degree. Horizontal viewing angle-178 degree. Vertical viewing angle-178 degree 75 hertz",
          category:"electronics",
          image:"https://fakestoreapi.com/img/81QpkIctqPL._AC_SX679_.jpg",
          rating:'{"rate":2.9,"count":250}',quantity: 1,favorite: false,getTotalPrice: ''
          ),
      Product(
          id:14,
          title:"Samsung 49-Inch CHG90 144Hz Curved Gaming Monitor (LC49HG90DMNXZA) – Super Ultrawide Screen QLED ",
          price:999.99,
          description:"49 INCH SUPER ULTRAWIDE 32:9 CURVED GAMING MONITOR with dual 27 inch screen side by side QUANTUM DOT (QLED) TECHNOLOGY, HDR support and factory calibration provides stunningly realistic and accurate color and contrast 144HZ HIGH REFRESH RATE and 1ms ultra fast response time work to eliminate motion blur, ghosting, and reduce input lag",
          category:"electronics",
          image:"https://fakestoreapi.com/img/81Zt42ioCgL._AC_SX679_.jpg",
          rating:'{"rate":2.2,"count":140}',quantity: 1,favorite: false,getTotalPrice: ''),
    ];

    final List<Product> Jewelery = [
      Product(
          id:5,
          title:"John Hardy Women's Legends Naga Gold & Silver Dragon Station Chain Bracelet",
          price:695,
          description:"From our Legends Collection, the Naga was inspired by the mythical water dragon that protects the ocean's pearl. Wear facing inward to be bestowed with love and abundance, or outward for protection.",
          category:"jewelery",
          image:"https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg",
          rating:'{"rate":4.6,"count":400}',quantity: 1,favorite: false,getTotalPrice: ''
          ),
      Product(
          id:6,
          title:"Solid Gold Petite Micropave ",
          price:168,
          description:"Satisfaction Guaranteed. Return or exchange any order within 30 days.Designed and sold by Hafeez Center in the United States. Satisfaction Guaranteed. Return or exchange any order within 30 days.",
          category:"jewelery",
          image:"https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_.jpg",
          rating:'{"rate":3.9,"count":70}',quantity: 1,favorite: false,getTotalPrice: ''
          ),
      Product(
          id:7,
          title:"White Gold Plated Princess",
          price:9.99,
          description:"Classic Created Wedding Engagement Solitaire Diamond Promise Ring for Her. Gifts to spoil your love more for Engagement, Wedding, Anniversary, Valentine's Day...",
          category:"jewelery",
          image:"https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_.jpg",
          rating:'{"rate":3,"count":400}',quantity: 1,favorite: false,getTotalPrice: ''
         ),
      Product(
          id:8,
          title:"Pierced Owl Rose Gold Plated Stainless Steel Double",
          price:10.99,
          description:"Rose Gold Plated Double Flared Tunnel Plug Earrings. Made of 316L Stainless Steel",
          category:"jewelery",
          image:"https://fakestoreapi.com/img/51UDEzMJVpL._AC_UL640_QL65_ML3_.jpg",
          rating:'{"rate":1.9,"count":100}',quantity: 1,favorite: false,getTotalPrice: ''
          ),
    ];

    final List<Product> Mens = [
      Product(
          id:1,
          title:"Fjallraven - Foldsack No. 1 Backpack,Fits 15 Laptops",
          price:109.95,
          description:"Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
          category:"men's clothing",
          image:"https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
          rating:'{"rate":3.9,"count":120}',quantity: 1,favorite: false,getTotalPrice: ''),
      Product(
          id:2,
          title:"Mens Casual Premium Slim Fit T-Shirts ",
          price:22.3,
          description:"Slim-fitting style,contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.",
          category:"men's clothing",
          image:"https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
          rating:'{"rate":4.1,"count":259}',quantity: 1,favorite: false,getTotalPrice: ''),
      Product(
          id:3,
          title:"Mens Cotton Jacket",
          price:55.99,
          description:"great outerwear jackets for Spring/Autumn/Winter, suitable for many occasions, such as working, hiking, camping, mountain/rock climbing, cycling, traveling or other outdoors. Good gift choice for you or your family member. A warm hearted love to Father, husband or son in this thanksgiving or Christmas Day.",
          category:"men's clothing",
          image:"https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg",
          rating:'{"rate":4.7,"count":500}',quantity: 1,favorite: false,getTotalPrice: ''),
      Product(id:4,
          title:"Mens Casual Slim Fit",
          price:15.99,
          description:"The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.",
          category:"men's clothing",
          image:"https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_.jpg",
          rating:'{"rate":2.1,"count":430}',quantity: 1,favorite: false,getTotalPrice: ''
      ),
    ];

    final List<Product> Womens = [
      Product(
          id:15,
          title:"BIYLACLESEN Women's 3-in-1 Snowboard Jacket Winter Coats",
          price:56.99,
          description:"Note:The Jackets is US standard size, Please choose size as your usual wear Material: 100% Polyester; Detachable Liner Fabric: Warm Fleece. Detachable Functional Liner: Skin Friendly, Lightweigt and Warm.Stand Collar Liner jacket, keep you warm in cold weather. Zippered Pockets: 2 Zippered Hand Pockets, 2 Zippered Pockets on Chest (enough to keep cards or keys)and 1 Hidden Pocket Inside.Zippered Hand Pockets and Hidden Pocket keep your things secure. Humanized Design: Adjustable and Detachable Hood and Adjustable cuff to prevent the wind and water,for a comfortable fit. 3 in 1 Detachable Design provide more convenience, you can separate the coat and inner as needed, or wear it together. It is suitable for different season and help you adapt to different climates",
          category:"women's clothing",
          image:"https://fakestoreapi.com/img/51Y5NI-I5jL._AC_UX679_.jpg",
          rating:'{"rate":2.6,"count":235}',quantity: 1,favorite: false,getTotalPrice: ''
         ),
      Product(
          id:16,
          title:"Lock and Love Women's Removable Hooded Faux Leather Moto Biker Jacket",
          price:29.95,
          description:"100% POLYURETHANE(shell) 100% POLYESTER(lining) 75% POLYESTER 25% COTTON (SWEATER), Faux leather material for style and comfort / 2 pockets of front, 2-For-One Hooded denim style faux leather jacket, Button detail on waist / Detail stitching at sides, HAND WASH ONLY / DO NOT BLEACH / LINE DRY / DO NOT IRON",
          category:"women's clothing",
          image:"https://fakestoreapi.com/img/81XH0e8fefL._AC_UY879_.jpg",
          rating:'{"rate":2.9,"count":340}',quantity: 1,favorite: false,getTotalPrice: ''
          ),
      Product(
          id:17,
          title:"Rain Jacket Women Windbreaker Striped Climbing Raincoats",
          price:39.99,
          description:"Lightweight perfet for trip or casual wear---Long sleeve with hooded, adjustable drawstring waist design. Button and zipper front closure raincoat, fully stripes Lined and The Raincoat has 2 side pockets are a good size to hold all kinds of things, it covers the hips, and the hood is generous but doesn't overdo it.Attached Cotton Lined Hood with Adjustable Drawstrings give it a real styled look.",
          category:"women's clothing",
          image:"https://fakestoreapi.com/img/71HblAHs5xL._AC_UY879_-2.jpg",
          rating:'{"rate":3.8,"count":679}',quantity: 1,favorite: false,getTotalPrice: ''
          ),
      Product(
          id:18,
          title:"MBJ Women's Solid Short Sleeve Boat Neck V ",
          price:9.85,
          description:"95% RAYON 5% SPANDEX, Made in USA or Imported, Do Not Bleach, Lightweight fabric with great stretch for comfort, Ribbed on sleeves and neckline / Double stitching on bottom hem",
          category:"women's clothing",
          image:"https://fakestoreapi.com/img/71z3kpMAYsL._AC_UY879_.jpg",
          rating:'{"rate":4.7,"count":130}',quantity: 1,favorite: false,getTotalPrice: ''
          ),
      Product(
          id:19,
          title:"Opna Women's Short Sleeve Moisture",
          price:7.95,
          description:"100% Polyester, Machine wash, 100% cationic polyester interlock, Machine Wash & Pre Shrunk for a Great Fit, Lightweight, roomy and highly breathable with moisture wicking fabric which helps to keep moisture away, Soft Lightweight Fabric with comfortable V-neck collar and a slimmer fit, delivers a sleek, more feminine silhouette and Added Comfort",
          category:"women's clothing",
          image:"https://fakestoreapi.com/img/51eg55uWmdL._AC_UX679_.jpg",
          rating:'{"rate":4.5,"count":146}',quantity: 1,favorite: false,getTotalPrice: ''
          ),
      Product(
          id:20,
          title:"DANVOUY Womens T Shirt Casual Cotton Short",
          price:12.99,
          description:"95%Cotton,5%Spandex, Features: Casual, Short Sleeve, Letter Print,V-Neck,Fashion Tees, The fabric is soft and has some stretch., Occasion: Casual/Office/Beach/School/Home/Street. Season: Spring,Summer,Autumn,Winter.",
          category:"women's clothing",
          image:"https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_.jpg",
          rating:'{"rate":3.6,"count":145}',quantity: 1,favorite: false,getTotalPrice: ''
          ),
    ];

    final _medeyaQuerywidth = MediaQuery.of(context).size.width;
    final _medeyaQueryheight = MediaQuery.of(context).size.height;

    return LayoutBuilder(
      builder: (context,constrains) {
        if(constrains.maxWidth < _medeyaQuerywidth * 900) {
          return SingleChildScrollView(
            padding: const EdgeInsets.only(left: 20,right: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(padding: const EdgeInsets.all(30),
                   child: TextField(
                    style:   const TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(20)),
                    ),
                      onTap: () {
                        showSearch(context: context, delegate: MySearchDelegate(widget.user));
                      },
                  ),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Featured',style: TextStyle(color: Colors.grey,fontSize: 18),maxLines: 1,overflow: TextOverflow.ellipsis,),
                    TextButton(onPressed: () {

                    }, child: const Text('',style: TextStyle(color: Colors.grey,fontSize: 18),maxLines: 1,overflow: TextOverflow.ellipsis,),
                    )
                  ],
                ),
                Container(height: 200,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 1,
                      separatorBuilder: (context,_) => const SizedBox(width: 0.10,),
                      itemBuilder: (context,index) => buildcard(),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Electronics',style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
                    TextButton(onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) => buildSheet());
                    }, child: const Text('See all >>',
                      style: TextStyle(color: Colors.black,
                          fontSize: 22,fontWeight: FontWeight.bold),),),
                  ],),
                Container(height: 220,
                  child: ListView.separated(
                    itemCount: Electronics.length,
                    separatorBuilder: (context,_) => const SizedBox(width: 0.10,),
                    itemBuilder: (context,index) => buildElectronic(Electronics: Electronics[index]),
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Jewelery',
                      style: TextStyle(color: Colors.black,
                          fontSize: 22,fontWeight: FontWeight.bold),),
                    TextButton(onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) => buildJewelerySheet());
                    },
                      child: const Text('See all >>',
                        style: TextStyle(color: Colors.black,
                            fontSize: 22,fontWeight: FontWeight.bold),),),
                  ],),
                Container(height: 220,
                  child: ListView.separated(
                    itemCount: Jewelery.length,
                    separatorBuilder: (context,_) => const SizedBox(width: 0.10,),
                    itemBuilder: (context,index) => buildJewelery(Jewelery: Jewelery[index]),
                    scrollDirection: Axis.horizontal,
                  ),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Mens clothing',style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
                    TextButton(onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) => buildMensSheet());
                    }, child: const Text('See all >>',
                      style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),),
                  ],),
                Container(height: 220,
                  child: ListView.separated(
                    itemCount: Mens.length,
                    separatorBuilder: (context,_) => const SizedBox(width: 0.10,),
                    itemBuilder: (context,index) => buidMenscloth(Mens: Mens[index]),
                    scrollDirection: Axis.horizontal,
                  ),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Womens clothing',style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
                    TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) => buildWomensSheet());
                      },
                      child: const Text('See all >>',
                        style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),),
                  ],),
                Container(height: 220,
                  child: ListView.separated(
                    itemCount: Womens.length,
                    separatorBuilder: (context,_) => const SizedBox(width: 0.10,),
                    itemBuilder: (context,index) => buildWomancloth(Womens: Womens[index]),
                    scrollDirection: Axis.horizontal,
                  ),),
                const SizedBox(height: 100,)
              ],
            ),
          );
        } return Container();
      },
    );
  }

  Widget buildcard() {
   return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => buildSheet());
              },
              child: Container(
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red
                ),
                child: Center(
                  child: Container(
                    height: 80,width: 80,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child:  Image.network("https://th.bing.com/th/id/OIP.aGvOviMaVyMgctLtP_A7agHaHa?w=141&h=150&c=7&r=0&o=5&pid=1.7"),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 30,),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => buildJewelerySheet());
              },
              child: Container(
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red
                ),
                child: Center(
                  child: Container(
                    height: 80,width: 80,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child:  Image.network("https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_.jpg"),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 30,),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => buildMensSheet());
              },
              child: Container(
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red
                ),
                child: Center(
                  child: Container(
                    height: 80,width: 80,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child:  Image.network("https://th.bing.com/th/id/OIP.fAyepQIvEcRrVgM2dWQeKAHaOE?w=115&h=201&c=7&r=0&o=5&pid=1.7 "),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 30,),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => buildWomensSheet());
              },
              child: Container(
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red
                ),
                child: Center(
                  child: Container(
                    height: 80,width: 80,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child:  Image.network("https://th.bing.com/th/id/OIP.7Gj78xedAtO7M0FXFqyebgHaJS?w=204&h=256&c=7&r=0&o=5&pid=1.7"),
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }

  Widget buildElectronic({required Product Electronics,index}) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProductPage(Electronics)));
          },
          child: Container(
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
              color: Colors.white10,
            ),
            child: Column(
              children: [
                Container(
                  height: 140,
                  width: 120,
                  child: Image.network(Electronics.image, fit: BoxFit.cover),
                ),
                Text(
                  Electronics.title + index.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(Electronics.price.toString(), style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18),),
              ],),
          ),
        ),
      );
  }

  Widget buildJewelery({required Product Jewelery,index}) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProductPage(Jewelery,)));
          },
          child:Container(
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
              color: Colors.white10,
            ),
            child: Column(
              children: [
                Container(
                  height: 140,
                  width: 120,
                  child: Image.network(Jewelery.image),
                ),
                Text(Jewelery.title,overflow: TextOverflow.ellipsis,maxLines: 1,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                Text(Jewelery.price.toString(),style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              ],),
          ),
        ),
      );
  }

  Widget buidMenscloth({required Product Mens,index}) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProductPage(Mens,)));
          },
          child:Container(
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
              color: Colors.white10,
            ),
            child: Column(
              children: [
                Container(
                  height: 140,
                  width: 120,
                  child: Image.network(Mens.image),
                ),
                Text(Mens.title,maxLines: 1,overflow: TextOverflow.ellipsis,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                Text(Mens.price.toString(),style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              ],),
          ),
        ),
      );
    }

  Widget buildWomancloth({required Product Womens,index}) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProductPage(Womens,)));
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
              color: Colors.white,
            ),
            width: 120,
            child:Column(
              children: [
                Container(
                  height: 140,
                  width: 120,
                  child: Image.network(Womens.image),
                ),
                Text(Womens.title,overflow: TextOverflow.ellipsis,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                Text(Womens.price.toString(),style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              ],),
          ),
        ),
      );
    }


 Widget buildSheet() {
   final List<Product> Electronics = [
     Product(
       id:9,
       title:"WD 2TB Elements Portable External Hard Drive - USB 3.0 ",
       price:64,
       description:"USB 3.0 and USB 2.0 Compatibility Fast data transfers Improve PC Performance High Capacity; Compatibility Formatted NTFS for Windows 10, Windows 8.1, Windows 7; Reformatting may be required for other operating systems; Compatibility may vary depending on user’s hardware configuration and operating system",
       category:"electronics",
       image:"https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_.jpg",
       rating:'{"rate":3.3,"count":203}', quantity: 1, favorite: false,getTotalPrice: ''
     ),
     Product(
       id:10,
       title:"SanDisk SSD PLUS 1TB Internal SSD - SATA III 6 Gb/s",
       price:109,
       description:"Easy upgrade for faster boot up, shutdown, application load and response (As compared to 5400 RPM SATA 2.5” hard drive; Based on published specifications and internal benchmarking tests using PCMark vantage scores) Boosts burst write performance, making it ideal for typical PC workloads The perfect balance of performance and reliability Read/write speeds of up to 535MB/s/450MB/s (Based on internal testing; Performance may vary depending upon drive capacity, host device, OS and application.)",
       category:"electronics",
       image:"https://fakestoreapi.com/img/61U7T1koQqL._AC_SX679_.jpg",
       rating:'{"rate":2.9,"count":470}',quantity: 1,favorite: false,getTotalPrice: ''
     ),
     Product(
       id:11,
       title:"Silicon Power 256GB SSD 3D NAND A55 SLC Cache Performance Boost SATA III 2.5",
       price:109,
       description:"3D NAND flash are applied to deliver high transfer speeds Remarkable transfer speeds that enable faster bootup and improved overall system performance. The advanced SLC Cache Technology allows performance boost and longer lifespan 7mm slim design suitable for Ultrabooks and Ultra-slim notebooks. Supports TRIM command, Garbage Collection technology, RAID, and ECC (Error Checking & Correction) to provide the optimized performance and enhanced reliability.",
       category:"electronics",
       image:"https://fakestoreapi.com/img/71kWymZ+c+L._AC_SX679_.jpg",
       rating:'{"rate":4.8,"count":319}',quantity: 1,favorite: false,getTotalPrice: ''
     ),
     Product(
       id:12,
       title:"WD 4TB Gaming Drive Works with Playstation 4 Portable External Hard Drive",
       price:114,
       description:"Expand your PS4 gaming experience, Play anywhere Fast and easy, setup Sleek design with high capacity, 3-year manufacturer's limited warranty",
       category:"electronics",
       image:"https://fakestoreapi.com/img/61mtL65D4cL._AC_SX679_.jpg",
       rating:'{"rate":4.8,"count":400}',quantity: 1,favorite: false,getTotalPrice: ''
     ),
     Product(
       id:13,
       title:"Acer SB220Q bi 21.5 inches Full HD (1920 x 1080) IPS Ultra-Thin",
       price:599,
       description:"21. 5 inches Full HD (1920 x 1080) widescreen IPS display And Radeon free Sync technology. No compatibility for VESA Mount Refresh Rate: 75Hz - Using HDMI port Zero-frame design | ultra-thin | 4ms response time | IPS panel Aspect ratio - 16: 9. Color Supported - 16. 7 million colors. Brightness - 250 nit Tilt angle -5 degree to 15 degree. Horizontal viewing angle-178 degree. Vertical viewing angle-178 degree 75 hertz",
       category:"electronics",
       image:"https://fakestoreapi.com/img/81QpkIctqPL._AC_SX679_.jpg",
       rating:'{"rate":2.9,"count":250}',quantity: 1,favorite: false,getTotalPrice: ''
     ),
     Product(
       id:14,
       title:"Samsung 49-Inch CHG90 144Hz Curved Gaming Monitor (LC49HG90DMNXZA) – Super Ultrawide Screen QLED ",
       price:999.99,
       description:"49 INCH SUPER ULTRAWIDE 32:9 CURVED GAMING MONITOR with dual 27 inch screen side by side QUANTUM DOT (QLED) TECHNOLOGY, HDR support and factory calibration provides stunningly realistic and accurate color and contrast 144HZ HIGH REFRESH RATE and 1ms ultra fast response time work to eliminate motion blur, ghosting, and reduce input lag",
       category:"electronics",
       image:"https://fakestoreapi.com/img/81Zt42ioCgL._AC_SX679_.jpg",
       rating:'{"rate":2.2,"count":140}',quantity: 1,favorite: false,getTotalPrice: ''),
   ];

    return Scaffold(
       appBar:  AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
         automaticallyImplyLeading: false,
         actions: [
           TextButton(
             onPressed: () {
               Navigator.pop(context);
             },
             child: const Text('Close',style: TextStyle(fontSize: 30,color: Colors.black),),
           ),
         ],
          title: const Text('Electronic',
            style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 25,color: Colors.black),),
         iconTheme: const IconThemeData(color: Colors.black),
       ),
      body: Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
           // buildelectronicItem(),
             Container(height: MediaQuery.of(context).size.height * 0.9,
               child: ListView.separated(padding: const EdgeInsets.all(20),
                 itemCount: Electronics.length,
                 separatorBuilder: (context,_) => const SizedBox(width: 0.15,),
                 itemBuilder: (context,index) => buildElectronic(Electronics: Electronics[index]),
                 scrollDirection: Axis.vertical,
               ),
             ),
       ],
      ),
    );
  }

 Widget buildJewelerySheet() {
    final List<Product> Jewelery = [
      Product(
        id:5,
        title:"John Hardy Women's Legends Naga Gold & Silver Dragon Station Chain Bracelet",
        price:695,
        description:"From our Legends Collection, the Naga was inspired by the mythical water dragon that protects the ocean's pearl. Wear facing inward to be bestowed with love and abundance, or outward for protection.",
        category:"jewelery",
        image:"https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg",
        rating:'{"rate":4.6,"count":400}',quantity: 1,favorite: false,getTotalPrice: ''
      ),
      Product(
        id:6,
        title:"Solid Gold Petite Micropave ",
        price:168,
        description:"Satisfaction Guaranteed. Return or exchange any order within 30 days.Designed and sold by Hafeez Center in the United States. Satisfaction Guaranteed. Return or exchange any order within 30 days.",
        category:"jewelery",
        image:"https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_.jpg",
        rating:'{"rate":3.9,"count":70}',quantity: 1,favorite: false,getTotalPrice: ''
      ),
      Product(
        id:7,
        title:"White Gold Plated Princess",
        price:9.99,
        description:"Classic Created Wedding Engagement Solitaire Diamond Promise Ring for Her. Gifts to spoil your love more for Engagement, Wedding, Anniversary, Valentine's Day...",
        category:"jewelery",
        image:"https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_.jpg",
        rating:'{"rate":3,"count":400}',quantity: 1,favorite: false,getTotalPrice: ''
      ),
      Product(
        id:8,
        title:"Pierced Owl Rose Gold Plated Stainless Steel Double",
        price:10.99,
        description:"Rose Gold Plated Double Flared Tunnel Plug Earrings. Made of 316L Stainless Steel",
        category:"jewelery",
        image:"https://fakestoreapi.com/img/51UDEzMJVpL._AC_UL640_QL65_ML3_.jpg",
        rating:'{"rate":1.9,"count":100}',quantity: 1,favorite: false,getTotalPrice: ''
      ),
    ];
  return Scaffold(
    appBar:  AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Close',style: TextStyle(fontSize: 30,color: Colors.black),),
        ),
      ],
      title: const Text('Jewelery',
        style: TextStyle(fontWeight: FontWeight.bold,
            fontSize: 25,color: Colors.black),),
      iconTheme: const IconThemeData(color: Colors.black),
    ),
    body:  Container(height: MediaQuery.of(context).size.height * 0.9,
      child: ListView.separated(
        itemCount: Jewelery.length,
        separatorBuilder: (context,_) => const SizedBox(width: 0.10,),
        itemBuilder: (context,index) => buildJewelery(Jewelery: Jewelery[index]),
        scrollDirection: Axis.vertical,
      ),),
  );
  }

 Widget buildMensSheet() {
   final List<Product> Mens = [
     Product(
       id:1,
       title:"Fjallraven - Foldsack No. 1 Backpack,Fits 15 Laptops",
       price:109.95,
       description:"Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
       category:"men's clothing",
       image:"https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
       rating:'{"rate":3.9,"count":120}',quantity: 1,favorite: false,getTotalPrice: ''),
     Product(
       id:2,
       title:"Mens Casual Premium Slim Fit T-Shirts ",
       price:22.3,
       description:"Slim-fitting style,contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.",
       category:"men's clothing",
       image:"https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
       rating:'{"rate":4.1,"count":259}',quantity: 1,favorite: false,getTotalPrice: ''),
     Product(
       id:3,
       title:"Mens Cotton Jacket",
       price:55.99,
       description:"great outerwear jackets for Spring/Autumn/Winter, suitable for many occasions, such as working, hiking, camping, mountain/rock climbing, cycling, traveling or other outdoors. Good gift choice for you or your family member. A warm hearted love to Father, husband or son in this thanksgiving or Christmas Day.",
       category:"men's clothing",
       image:"https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg",
       rating:'{"rate":4.7,"count":500}',quantity: 1,favorite: false,getTotalPrice: ''),
     Product(id:4,
       title:"Mens Casual Slim Fit",
       price:15.99,
       description:"The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.",
       category:"men's clothing",
       image:"https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_.jpg",
       rating:'{"rate":2.1,"count":430}',quantity: 1,favorite: false,getTotalPrice: ''
     ),
   ];

   return Scaffold(
     appBar:  AppBar(
       backgroundColor: Colors.white,
       elevation: 0,
       automaticallyImplyLeading: false,
       actions: [
         TextButton(
           onPressed: () {
             Navigator.pop(context);
           },
           child: const Text('Close',style: TextStyle(fontSize: 30,color: Colors.black),),
         ),
       ],
       title: const Text('Mens clothing',
         style: TextStyle(fontWeight: FontWeight.bold,
             fontSize: 25,color: Colors.black),),
       iconTheme: const IconThemeData(color: Colors.black),
     ),
     body: Container(height: MediaQuery.of(context).size.height * 0.9,
       child: ListView.separated(
         itemCount: Mens.length,
         separatorBuilder: (context,_) => const SizedBox(width: 0.10,),
         itemBuilder: (context,index) => buidMenscloth(Mens: Mens[index]),
         scrollDirection: Axis.vertical,
       ),),
   );
 }

 Widget buildWomensSheet() {
   final List<Product> Womens = [
     Product(
       id:15,
       title:"BIYLACLESEN Women's 3-in-1 Snowboard Jacket Winter Coats",
       price:56.99,
       description:"Note:The Jackets is US standard size, Please choose size as your usual wear Material: 100% Polyester; Detachable Liner Fabric: Warm Fleece. Detachable Functional Liner: Skin Friendly, Lightweigt and Warm.Stand Collar Liner jacket, keep you warm in cold weather. Zippered Pockets: 2 Zippered Hand Pockets, 2 Zippered Pockets on Chest (enough to keep cards or keys)and 1 Hidden Pocket Inside.Zippered Hand Pockets and Hidden Pocket keep your things secure. Humanized Design: Adjustable and Detachable Hood and Adjustable cuff to prevent the wind and water,for a comfortable fit. 3 in 1 Detachable Design provide more convenience, you can separate the coat and inner as needed, or wear it together. It is suitable for different season and help you adapt to different climates",
       category:"women's clothing",
       image:"https://fakestoreapi.com/img/51Y5NI-I5jL._AC_UX679_.jpg",
       rating:'{"rate":2.6,"count":235}',quantity: 1,favorite: false,getTotalPrice: ''
     ),
     Product(
       id:16,
       title:"Lock and Love Women's Removable Hooded Faux Leather Moto Biker Jacket",
       price:29.95,
       description:"100% POLYURETHANE(shell) 100% POLYESTER(lining) 75% POLYESTER 25% COTTON (SWEATER), Faux leather material for style and comfort / 2 pockets of front, 2-For-One Hooded denim style faux leather jacket, Button detail on waist / Detail stitching at sides, HAND WASH ONLY / DO NOT BLEACH / LINE DRY / DO NOT IRON",
       category:"women's clothing",
       image:"https://fakestoreapi.com/img/81XH0e8fefL._AC_UY879_.jpg",
       rating:'{"rate":2.9,"count":340}',quantity: 1,favorite: false,getTotalPrice: ''
     ),
     Product(
       id:17,
       title:"Rain Jacket Women Windbreaker Striped Climbing Raincoats",
       price:39.99,
       description:"Lightweight perfet for trip or casual wear---Long sleeve with hooded, adjustable drawstring waist design. Button and zipper front closure raincoat, fully stripes Lined and The Raincoat has 2 side pockets are a good size to hold all kinds of things, it covers the hips, and the hood is generous but doesn't overdo it.Attached Cotton Lined Hood with Adjustable Drawstrings give it a real styled look.",
       category:"women's clothing",
       image:"https://fakestoreapi.com/img/71HblAHs5xL._AC_UY879_-2.jpg",
       rating:'{"rate":3.8,"count":679}',quantity: 1,favorite: false,getTotalPrice: ''
     ),
     Product(
       id:18,
       title:"MBJ Women's Solid Short Sleeve Boat Neck V ",
       price:9.85,
       description:"95% RAYON 5% SPANDEX, Made in USA or Imported, Do Not Bleach, Lightweight fabric with great stretch for comfort, Ribbed on sleeves and neckline / Double stitching on bottom hem",
       category:"women's clothing",
       image:"https://fakestoreapi.com/img/71z3kpMAYsL._AC_UY879_.jpg",
       rating:'{"rate":4.7,"count":130}',quantity: 1,favorite: false,getTotalPrice: ''
     ),
     Product(
       id:19,
       title:"Opna Women's Short Sleeve Moisture",
       price:7.95,
       description:"100% Polyester, Machine wash, 100% cationic polyester interlock, Machine Wash & Pre Shrunk for a Great Fit, Lightweight, roomy and highly breathable with moisture wicking fabric which helps to keep moisture away, Soft Lightweight Fabric with comfortable V-neck collar and a slimmer fit, delivers a sleek, more feminine silhouette and Added Comfort",
       category:"women's clothing",
       image:"https://fakestoreapi.com/img/51eg55uWmdL._AC_UX679_.jpg",
       rating:'{"rate":4.5,"count":146}',quantity: 1,favorite: false,getTotalPrice: ''
     ),
     Product(
       id:20,
       title:"DANVOUY Womens T Shirt Casual Cotton Short",
       price:12.99,
       description:"95%Cotton,5%Spandex, Features: Casual, Short Sleeve, Letter Print,V-Neck,Fashion Tees, The fabric is soft and has some stretch., Occasion: Casual/Office/Beach/School/Home/Street. Season: Spring,Summer,Autumn,Winter.",
       category:"women's clothing",
       image:"https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_.jpg",
       rating:'{"rate":3.6,"count":145}',quantity: 1,favorite: false,getTotalPrice: ''
     ),
   ];

   return Scaffold(
     appBar:  AppBar(
       backgroundColor: Colors.white,
       elevation: 0,
       automaticallyImplyLeading: false,
       actions: [
         TextButton(
           onPressed: () {
             Navigator.pop(context);
           },
           child: const Text('Close',style: TextStyle(fontSize: 30,color: Colors.black),),
         ),
       ],
       title: const Text('Womens clothing',
         style: TextStyle(fontWeight: FontWeight.bold,
             fontSize: 25,color: Colors.black),),
       iconTheme: const IconThemeData(color: Colors.black),
     ),
     body:  Container(height: MediaQuery.of(context).size.height * 0.9,
       child: ListView.separated(
         itemCount: Womens.length,
         separatorBuilder: (context,_) => const SizedBox(width: 0.10,),
         itemBuilder: (context,index) => buildWomancloth(Womens: Womens[index]),
         scrollDirection: Axis.vertical,
       ),),
   );
  }
}

