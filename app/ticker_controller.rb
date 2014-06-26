class TickerController < UIViewController
  
  @@url = "http://market.huobi.com/staticmarket/ticker_btc_json.js"
  @@tick = nil
  
  def initTicker
    request_prepare
    
    draw_basic_elements

    update_price
    
    self
  end
  
  def update_price
    # connection
    queue = NSOperationQueue.alloc.init
    NSURLConnection.sendAsynchronousRequest(
      @request,  
      queue: queue,  
      completionHandler: update_price_handler
    )
    
    true
  end
  
  def request_prepare
    url = NSURL.URLWithString @@url
    @request = NSURLRequest.requestWithURL url
  end
  
  def draw_basic_elements
    @pos_x = 100
    @pos_y = 150
    @line_height = 30

    rect = CGRectMake(@pos_x, @pos_y, 250, 43.0)
    @spinner = UILabel.alloc.initWithFrame rect
    @spinner.text = "loading prices..."
    self.view.addSubview @spinner

    rect = CGRectMake(@pos_x, @pos_y+@line_height, 250, 43)
    label = UILabel.alloc.initWithFrame rect
    label.text = "Current price:"
    
    self.view.backgroundColor = UIColor.whiteColor
    
    true
  end
  
  def update_price_handler
    lambda do |response, data, error|    
      if data.length > 0 && error.nil?
        update_price_handler_request
      elsif(!error.nil?)      
        p "Error: #{error}"    
      end  
    end
  end
  
  def update_price_handler_request
    str = NSString.alloc.initWithData data, encoding: NSUTF8StringEncoding
    obj = JSONParser.parse_from_string str            
    @@tick =  obj
    
    rect = CGRectMake(@pos_x, @pos_y+@line_height*2, 250, 43)
    labelPrice = UILabel.alloc.initWithFrame rect
    amount = @@tick["ticker"]["last"]
    labelPrice.text = "#{amount} CNY"
    
    self.view.addSubview label
    self.view.addSubview labelPrice

    @spinner.hidden = true
    
    SystemSounds.play_system_sound "tin.mp3"
  end
  
  # def spinner_hide
  #   # [UIView beginAnimations:nil context:NULL];
  #   # [UIView setAnimationDuration:0.5];
  #   # [myImageView setAlpha:0];
  #   # [UIView commitAnimations];
  # end
  
end