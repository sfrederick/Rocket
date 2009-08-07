require 'grackle'

module StatusesHelper
  def tw_connect

    client = Grackle::Client.new(:auth=>{
        :type=>:oauth,
        :consumer_key=>'IWAbps0aSQY9zu7QrZaOg',
        :consumer_secret=>'soXYdGJ8tn37XLkDHHwCCCJVNx5XjY4eNhEYHzlH9MU',
        :token=>'ACCESSTOKENACQUIREDONUSERSBEHALF',
        :token_secret=>'SUPERSECRETACCESSTOKENSECRET'
      })
  end

end
