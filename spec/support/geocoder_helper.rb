Geocoder.configure(:lookup => :test)

Geocoder::Lookup::Test.add_stub(
  "EN11 8BX", [
    {
      'latitude'     => 51.76000699999999,
      'longitude'    => -0.015042,
      'address'      => 'Hoddesdon, UK',
      'state'        => 'Hoddesdon',
      'state_code'   => 'England',
      'country'      => 'United Kingdom',
      'country_code' => 'GB'
    }
  ]
)
