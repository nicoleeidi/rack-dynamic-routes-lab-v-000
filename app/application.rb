require 'pry'
class Application
  #@@items = Item.all
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)


        item_title = req.path.split("/items/").last
       binding.pry
        if @@items.include?(item_title)
        item = @@items.find{|i| i.name == item_title}
         resp.write item.price
       end
    else
      resp.status = 400
      resp.write "Item not found"
    end
    resp.status = 404

    resp.finish
    end



end
