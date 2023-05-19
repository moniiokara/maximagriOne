import 'package:flutter/material.dart';
import 'package:maximagri/models/order_model/single_order_model.dart';

class OrderDisplayCard extends StatefulWidget {
  final SingleOrder orderInfo;
  final Function() onTap;
  const OrderDisplayCard({
    Key? key,
    required this.orderInfo,
    required this.onTap,
  }) : super(key: key);

  @override
  State<OrderDisplayCard> createState() => _OrderDisplayCardState();
}

class _OrderDisplayCardState extends State<OrderDisplayCard>
    with SingleTickerProviderStateMixin {

  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {

    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 200),
        vsync: this);

    _animation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(
          parent: _controller,
          curve: Curves.easeOut,
          reverseCurve: Curves.easeIn)
    );
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) => _controller.reverse(),
      onTap: widget.onTap,
      child: ScaleTransition(
        scale: _animation,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            shadowColor: Colors.green,
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.orderInfo.dealerName,
                        style: TextStyle(
                          fontSize: 20, // Increased font size
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(0.7), // Changed color
                          fontFamily: 'Georgia', // Added custom font family
                        ),
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 8),
                          Container(
                            height: 30,
                            width: 110,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                widget.orderInfo.orderStatus.name,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 16, // Increased font size
                                  fontFamily: 'Georgia', // Added custom font family
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.receipt_long,
                        size: 20,
                        color: Colors.green,
                      ),
                      const SizedBox(width: 8),
                      Text('Order No: ${widget.orderInfo.orderSerial}'),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 20,
                        color: Colors.green,
                      ),
                      const SizedBox(width: 8),
                      Text('Date & Time: ${widget.orderInfo.dateTime}'),
                    ],
                  ),
                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.shopping_cart,
                        size: 20,
                        color: Colors.green,
                      ),
                      const SizedBox(width: 8),
                      const Text('Total Quantity: '),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.orderInfo.orderQuantity.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.attach_money,
                        size: 20,
                        color: Colors.green,
                      ),
                      const SizedBox(width: 8),
                      const Text('Total Price: '),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        widget.orderInfo.orderTotal.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
