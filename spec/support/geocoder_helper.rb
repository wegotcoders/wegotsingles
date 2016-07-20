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

Geocoder::Lookup::Test.add_stub(
  "SG12 0SY", [
    {
      'latitude'     => 51.8378941,
      'longitude'    => -0.028795,
      'address'      => 'Thundridge, UK',
      'state'        => 'Thundridge',
      'state_code'   => 'England',
      'country'      => 'United Kingdom',
      'country_code' => 'GB'
    }
  ]
)

Geocoder::Lookup::Test.add_stub(
  "CB2 1TN", [
    {
      'latitude'     => 52.20530369999999,
      'longitude'    => 0.1166132,
      'address'      => ' Cambridge, UK',
      'state'        => ' Cambridge',
      'state_code'   => 'England',
      'country'      => 'United Kingdom',
      'country_code' => 'GB'
    }
  ]
)