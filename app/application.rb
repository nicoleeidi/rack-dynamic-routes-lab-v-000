require 'pry'
class Application
  #@@items = Item.all
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)


        item_title = req.path.split("/items/").last
       binding.pry
       newitems= @@items.map do |item|
         item.name
       end
        if newitems.include?(item_title)
        item = @@items.find{|i| i.name == item_title}
         resp.write item.price

    else
      resp.status = 400
      resp.write "Item not found"
    end
  else
    resp.status = 404
    resp.write "Route not found"
  end

    resp.finish
    end



end
