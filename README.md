# README

tao model
``` rails g model colname2:type colname2:type ```
<br>
db migrate
<br>

``` rails db:migrate ```

<br>

rails console , iteractice ruby
<br>

``` rails console --sandbox```
<br>

tạo biến user =User.new(email: "trung@gmail", name: "trung")
<br>
save vao db  user.save

<br>
add Một cột vào một bảng

```rails generate migration add_<Tên cột>_to_<Tên bảng số nhiều> <Tên cột>:string ```
vd 
```rails generate migration add_password_digest_to_users password_digest:string ```
<br>


Reset database
``` rails db:migrate:reset ```


