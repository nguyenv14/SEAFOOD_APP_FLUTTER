import 'package:get_storage/get_storage.dart';
import 'package:seafoods/Constant/dismesions.dart';
import 'package:seafoods/model/customer.dart';

class CustomerDB {
  static void saveCustomer(Customer customer) {
    final box = GetStorage();
    dynamic source = customer.toJson();
    box.write(Dimesions.CUSTOMER, source);
  }

  static Customer? getCustomer() {
    final box = GetStorage();
    Customer? customer =
        Customer.fromJson(box.read(Dimesions.CUSTOMER) ?? null!);
    return customer;
  }

  static Customer? getNameCustomer() {
    final box = GetStorage();
    dynamic customerData = box.read(Dimesions.CUSTOMER);
    Customer? customer;

    if (customerData != null) {
      customer = Customer.fromJson(customerData);
    }
    return customer;
  }

  static void deleteCustomer() {
    final box = GetStorage();
    // Customer? customer = Customer.fromJson(box.read(Dimesions.CUSTOMER));
    // if (customer != null) {
    box.write(Dimesions.CUSTOMER, null);
    // }
  }
}
