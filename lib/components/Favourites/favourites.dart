import 'package:flutter/material.dart';

class Favourites_Screen extends StatelessWidget {
  const Favourites_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Center(
      child: Text('Favourite Screen'),
    );

    // Container(
    //   decoration: BoxDecoration(
    //       borderRadius: const BorderRadius.all(Radius.circular(10.0)),
    //       color: Colors.white),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Stack(
    //         alignment: AlignmentDirectional.bottomStart,
    //         children: [
    //           ClipRRect(
    //             borderRadius: BorderRadius.circular(8.0),
    //             child: Image(
    //               image: const NetworkImage(
    //                   'https://student.valuxapps.com/storage/uploads/categories/1630142480dvQxx.3658058.jpg'),
    //               width: double.infinity,
    //               height: size.height * 0.2,
    //               fit: BoxFit.cover,
    //             ),
    //           ),
    //           if (1 != 0)
    //             Container(
    //               decoration: const BoxDecoration(
    //                 borderRadius: BorderRadius.only(
    //                   bottomRight: Radius.circular(8.0),
    //                   // topRight: Radius.circular(5.0),
    //                 ),
    //                 color: Colors.red,
    //               ),
    //               child: Text('DISCOUNT',
    //                   style: Theme.of(context).textTheme.bodySmall),
    //             ),
    //         ],
    //       ),
    //       Column(
    //         children: [
    //           Text(
    //             'Electronic',
    //             style: TextStyle(
    //               color: Colors.black,
    //             ),
    //             maxLines: 2,
    //             overflow: TextOverflow.ellipsis,
    //           ),
    //           Row(
    //             children: [
    //               Padding(
    //                 padding: const EdgeInsetsDirectional.only(start: 8.0),
    //                 child: Text(
    //                   '2000',
    //                   style: const TextStyle(color: Colors.blue),
    //                 ),
    //               ),
    //               if (1 != 0)
    //                 Padding(
    //                   padding: const EdgeInsetsDirectional.only(start: 5.0),
    //                   child: Text(
    //                     '5000',
    //                     style: const TextStyle(
    //                       color: Colors.grey,
    //                       decoration: TextDecoration.lineThrough,
    //                       decorationColor: Colors.black,
    //                       fontSize: 12.0,
    //                     ),
    //                   ),
    //                 ),
    //               Spacer(),
    //               IconButton(
    //                   onPressed: () {},
    //                   icon: const Icon(
    //                     Icons.favorite_border_outlined,
    //                   )),
    //             ],
    //           )
    //         ],
    //       )
    //     ],
    //   ),
    // );
  }
}
