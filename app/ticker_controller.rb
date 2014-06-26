
class TickerController < UIViewController
  @@tick = nil
  
  def initTicker
    # request
    @@url = "http://market.huobi.com/staticmarket/ticker_btc_json.js"
    url = NSURL.URLWithString @@url
    request = NSURLRequest.requestWithURL url
    
    # connection
    queue = NSOperationQueue.alloc.init
    NSURLConnection.sendAsynchronousRequest(
      request,  
      queue: queue,  
      completionHandler: lambda do |response, data, error|    
        if data.length > 0 && error.nil?
    
          str = NSString.alloc.initWithData data, encoding: NSUTF8StringEncoding
          # puts str
          obj = JSONParser.parse_from_string str            
          @@tick =  obj
         
         
           puts obj["ticker"]
           puts @@tick["ticker"]
          
          
          rect = CGRectMake(150, 120, 100.0, 43.0)
          label = UILabel.alloc.initWithFrame rect
          label.text = "Ticker:"
          
          
          rect = CGRectMake(150, 150, 100.0, 43.0)
          labelPrice = UILabel.alloc.initWithFrame rect
          amount = @@tick["ticker"]["last"]
          labelPrice.text = "#{amount} CNY"
          
          self.view.addSubview label
          self.view.addSubview labelPrice
          # 

          SystemSounds.play_system_sound "tin.mp3"
          
         
          # elsif( data.length == 0 && error.nil? )      
          #   p "Nothing was downloaded"    
        elsif(!error.nil?)      
          p "Error: #{error}"    
        end  
      end
    )
    
    # drawing
    self.view.backgroundColor = UIColor.whiteColor
    
    self
  end
  
  def viewDidLoad

    
  end
end