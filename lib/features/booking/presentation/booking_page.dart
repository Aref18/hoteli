import 'package:flutter/material.dart';
import 'package:hoteli/features/booking/presentation/booking_provider.dart';
import 'package:hoteli/features/booking/presentation/widgets/booking_form.dart';
import 'package:hoteli/features/booking/presentation/widgets/date_picker.dart';
import 'package:hoteli/features/booking/presentation/widgets/numberphone.dart';
import 'package:hoteli/features/booking/presentation/widgets/terms_widget.dart';
import 'package:provider/provider.dart';

class BookingPage extends StatefulWidget {
  static final GlobalKey<BookingPageState> bookingPageKey =
      GlobalKey<BookingPageState>();

  BookingPage({Key? key}) : super(key: bookingPageKey);

  @override
  State<BookingPage> createState() => BookingPageState();
}

class BookingPageState extends State<BookingPage> {
  final _formkey = GlobalKey<FormState>();
  void resetForm() {
    Future.delayed(
      const Duration(milliseconds: 100),
      () {
        _formkey.currentState?.reset();
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'رزرو هتل',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(child: Consumer<BookingProvider>(
          builder: (context, BookingProvider, _) {
            return Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BookingForm(
                    hint: 'نام و نام خانوادگی خود را وارد کنید ...',
                    title: 'نام و نام خانوادگی',
                    initialvalue: BookingProvider.booking.fullname,
                    keyboardtype: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'لطفا نام خود را کامل بنویسید';
                      } else {
                        return null;
                      }
                    },
                    onSave: (newValue) {
                      if (newValue != null) {
                        BookingProvider.setName(newValue);
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BookingForm(
                    hint: 'مقصد خود را وارد کنید',
                    title: 'لطفا مقصد خود را مشخص کنید',
                    initialvalue: BookingProvider.booking.destination,
                    keyboardtype: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'لطفا مقصد  خود را کامل بنویسید';
                      } else {
                        return null;
                      }
                    },
                    onSave: (newValue) {
                      if (newValue != null) {
                        BookingProvider.setDestination(newValue);
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DatePickerField(
                    title: ' تاریخ رفت و برگشت',
                    hint: 'لطفا تاریخ رفت را مشخص کنید ',
                    initialValue: BookingProvider.booking.CheckInOutRangeData,
                    validator: (value) {
                      if (value == Null) {
                        return 'لطفا تاریخ رفت و برگشت را مشخص کنید';
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      if (newValue != null) {
                        BookingProvider.setRageData(newValue);
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BookingForm(
                      hint: 'تعداد نفرات را بنویسید...',
                      title: 'تعداد نفرات را بنویسید',
                      initialvalue: BookingProvider.booking.numbersOFguestes,
                      keyboardtype: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'تعداد نفرات رامشخص کنید';
                        } else {
                          return null;
                        }
                      },
                      onSave: (newValue) {
                        if (newValue != null) {
                          BookingProvider.setNumbersOFguestes(newValue);
                        }
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  NumberFormField(
                    initialValue: BookingProvider.booking.numbers,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'لطفا شماره را به درستی وارد کنید';
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      if (newValue != null) {
                        BookingProvider.setPhoneNumbers(newValue);
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TermsWidget(
                    initialValue: false,
                    validator: (value) {
                      if (value == null || value == false) {
                        return 'لطفا قوانین برنامه را تایید کنید';
                      }
                      return null;
                    },
                    onSaved: (newValue) {},
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'درخواست رزرو شما با موفقیت انجام شد',
                                  textDirection: TextDirection.rtl,
                                ),
                              ),
                            );
                          }
                        },
                        child: const Text('درخواست رزو هتل')),
                  ),
                ],
              ),
            );
          },
        )),
      ),
    );
  }
}
