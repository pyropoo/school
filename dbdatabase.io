Table users {
  id integer [pk]
  email varchar [unique, not null]
  password_hash varchar [not null]
  role varchar [default: 'user'] 
  created_at timestamp [not null]
  updated_at timestamp
}

Table products {
  id integer [pk]
  title varchar [not null]
  description text
  price int [not null]
  stock_quantity int [not null]
  category_id integer [ref: > categories.id]
  created_at timestamp [not null]
  updated_at timestamp
}

Table categories {
  id integer [pk]
  name varchar [not null]
  parent_id integer [ref: > categories.id] 
}

Table reviews {
  id integer [pk]
  product_id integer [not null, ref: > products.id]
  user_id integer [not null, ref: > users.id]
  rating int [not null]
  comment text
  created_at timestamp [not null]
}

Table cart {
  id integer [pk]
  user_id integer [not null, ref: > users.id]
  updated_at timestamp [not null]
}

Table cart_items {
  cart_id integer [not null, ref: > cart.id]
  product_id integer [not null, ref: > products.id]
  quantity int [not null]
  Primary Key (cart_id, product_id)
}

Table orders {
  id integer [pk]
  user_id integer [not null, ref: > users.id]
  status varchar [not null] 
  total_price int [not null]
  delivery_address varchar [not null]
  payment_info varchar [not null] 
  created_at timestamp [not null]
}

Table order_items {
  order_id integer [not null, ref: > orders.id]
  product_id integer [not null, ref: > products.id]
  quantity int [not null]
  price_at_purchase int [not null]
  Primary Key (order_id, product_id)
}


Ref: "cart_items"."cart_id" < "cart_items"."product_id"
