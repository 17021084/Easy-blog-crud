# README

tao sessions
``` rails g controller Sessions new ```
<br>
Khác với (resouces - Sẽ tạo full routes REST) Thằng này nó chỉ tạo ```Post Get Destroy ```

GET       ```/login```      action : new        ->  page for new sessions  <br>
CREATE    ```/login```      action : create     ->  Create new sessions  <br>
Delete    ```/logout```     action : destroy    ->  delete  sessions  <br>

<br>
Để compare password ta dung  ``` .authenticate('')```

<br>
Viết logic đăng nhập vào file session helper

<br>
Đăng nhập có hai nhiệm vụ :
1. đăng ký session là user_id
2. tạo current_user
<br>
Đăng xuất có hai việc : là xoá 2 cái trên 