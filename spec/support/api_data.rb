RSpec.configure do |config|
  config.before(:each) do
    stub_request(:get, /currencydatafeed.com/)
    .with(headers: {
      'Accept'=>'*/*'
    }).to_return(status: 200, body: '
      {
        "status": true,
        "currency": [
            {
                "currency": "USD/BRL",
                "value": "3.41325",
                "date": "2018-04-20 17:22:59",
                "type": "original"
            }
        ]
      }', headers: {})
  end
  config.before(:each) do
    stub_request(:get, /cryptonator.com/)
        .with(headers: {
            'Accept'=>'*/*'
        }).to_return(status: 200, body: '
        {
          "ticker":{
            "base":"BTC",
            "target":"BRL",
            "price":"32530.00001000",
            "volume":"365.69666700",
            "change":"-159.99992000"
          },
          "timestamp":1558721583,
          "success":true,
          "error":""
        }', headers: {})
  end
end