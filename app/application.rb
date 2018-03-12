class Application
  @@items = Item.all
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)


        item_title = req.path.split("/items/").last
        if @@items.include?(item_title)
        item = @@items.find{|i| i.name == item_title}
      end

        resp.write item.price
    else
      resp.status = 400
      resp.write "Item not found"
    end
    resp.status = 404

    resp.finish
    end



end
