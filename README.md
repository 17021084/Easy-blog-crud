# README

reset database : <br>
```rails db:migrate:reset ``` <br>

faker data via seed file database : <br>
```rails db:seed ``` <br>

##### Paginate
Sử dụng 2 gem :  <br>
``` ruby
gem 'will_paginate', '~> 3.1.1'
gem 'will_paginate-bootstrap'  #Use for VIew  (erb)
```

Truy suất trang 1, 10item/trang
``` ruby
User.paginate(page: 1, per_page: 10 )
```

###### Delete user

Thêm 1 cột vào bảng Users (bảng là số nhiều model là số is) <br>
``` rails g migration add_admin_to_users admin:boolean ```
<br>

nó sẽ tự đông sinh ra 1 file migrate. nhiệm vụ chung ta là migrate nó để thay đổi 
<br>

``` rails db:migrate ```