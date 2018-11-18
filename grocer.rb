def consolidate_cart(cart)
new_hash = {}
array_holder = []
  cart.each do |item|
    item.each do |k,v|
      array_holder << k
      new_hash[k] = v
    end
  end
  new_hash.each do |new_item, new_data|
    new_hash[new_item][:count] = array_holder.count(new_item)
  end
new_hash
end




def apply_coupons(cart, coupons)
  coupons_applied = {}
  coupons.each do |coupon|
    if cart.key?(coupon[:item])
      coupon_count = 0
      until coupon[:num] > cart[coupon[:item]][:count]
        cart[coupon[:item]][:count] -= coupon[:num]
        cart["#{coupon[:item]} W/COUPON"] = {price: coupon[:cost], clearance: cart[coupon[:item]][:clearance], count: coupon_count += 1}
      end
    end
  end
  cart.merge(coupons_applied)
end



def apply_clearance(cart)
  cart.collect do |element|
    if element[:clearance] == true
      element[:price] = element[:price] * .80.to_f
    end  
  end
cart
end


def checkout(cart, coupons)
  # code here
end
