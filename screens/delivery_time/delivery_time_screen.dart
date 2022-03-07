import 'package:beautycentre/blocs/basket/basket_bloc.dart';
import 'package:beautycentre/config/theme.dart';
import 'package:beautycentre/models/delivery_time_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

class DeliveryTimeScreen extends StatefulWidget {
  DeliveryTimeScreen({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _DeliveryTimeScreenState createState() => _DeliveryTimeScreenState();
}

class _DeliveryTimeScreenState extends State<DeliveryTimeScreen> {
  //
  DatePickerController _controller = DatePickerController();

  DateTime _selectedValue = DateTime.now();
  //bool selected = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text('Appointment Time',
              style: Theme.of(context).textTheme.headline3!
              // .copyWith(color: Colors.orange),
              ),
        ),
        extendBodyBehindAppBar: true,
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(
                                color: Theme.of(context).primaryColor,
                              )))),
                  onPressed: () {
                    Navigator.pushNamed(context, '/basket');
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text("Book Appointment"),
                  ),
                )
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    color: Theme.of(context).backgroundColor,
                    width: double.infinity,
                    height: 300,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 5, right: 5, top: 130.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Choose a Date',
                            style: Theme.of(context).textTheme.headline5!),

                        //datepicker
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              DatePicker(
                                DateTime.now(),
                                initialSelectedDate: DateTime.now(),
                                selectionColor: Colors.pink,
                                selectedTextColor: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),

              //
              //

//************************************* */

              SizedBox(
                height: 30,
              ),
              //
              Center(
                child: Text('Available Times',
                    style: Theme.of(context).textTheme.headline5!),
              ),
              /*************** */
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Container(
                      height: 500,
                      constraints: BoxConstraints(
                          minHeight: 200, minWidth: double.infinity),
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3, childAspectRatio: 2.5),
                          itemCount: DeliveryTime.deliveryTimes.length,
                          itemBuilder: (context, index) {
                            return BlocBuilder<BasketBloc, BasketState>(
                              builder: (context, state) {
                                return Card(
                                    child: TextButton(
                                        onPressed: () {
                                          context.read<BasketBloc>().add(
                                              SelectDeliveryTime(
                                                  DeliveryTime
                                                      .deliveryTimes[index],
                                                  _selectedValue));
                                          //selected = true;
                                        },
                                        child: Text(
                                            '${DeliveryTime.deliveryTimes[index].value}',
                                            style:
                                                TextStyle(color: Colors.red))));
                              },
                            );
                          }),
                    ),
                  ),
                ],
              )

              /******************* */
            ],
          ),
        ));
  }
}
