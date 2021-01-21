class UserModel {
  String name, lastname, phone, email, id;
  bool enabled, isSeller;
  int balance;
  UserModel(
      {this.name,
      this.lastname,
      this.phone,
      this.id,
      this.enabled,
      this.email,
      this.isSeller,
      this.balance});

  // String get email => dto?.email;
  //
  // String get name => dto?.name;
  //
  // String get lastname => dto?.surname;
  //
  // String get phone => dto?.phone;
  //
  // String get id => dto?.id;
  //
  // bool get enabled => dto?.enabled ?? false;
  //
  // int get balance => dto?.balance;
  //
  // bool get hasMemberships => dto?.memberships?.isNotEmpty ?? false;
  //
  // bool get hasCampaigns => dto?.favoriteCampaigns?.isNotEmpty ?? false;
  //
  // bool get isSeller => dto?.sellerOptions?.isSeller;

  String get fullnameUI => '$name $lastname';

  UserModel.mockup()
      : name = 'roi',
        lastname = 'peker',
        phone = '+1 484-563-1664',
        id = '444555666',
        enabled = true,
        isSeller = true,
        email = 'roipeker@graphx.com',
        balance = 120;
}
