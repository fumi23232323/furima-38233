＃テーブル設計

＃＃usersテーブル
|Column             |Type  |Options                |
|-------------------|------|-----------------------|
｜nickname          ｜string｜null:false            ｜
｜email             ｜string｜null:false,unique:true｜
｜encrypted_password｜string｜null:false            ｜
｜last_name         ｜string｜null:false            ｜
｜first_name        ｜string｜null:false            ｜
｜last_name_kana    ｜string｜null:false            ｜
｜first_name_kana   ｜string｜null:false            ｜
｜birthday          ｜date  ｜null:false            ｜
＃＃＃Association
-has_many:items
-has_many:orders

##itemsテーブル
|Column               |Type        |Options                    |
|---------------------|------------|---------------------------|
｜user                ｜references ｜null:false,foreign_key:true｜
｜item_name           ｜string     ｜null:false                 ｜
｜item_description    ｜text       ｜null:false                 ｜
｜item_category_id    ｜integer    ｜null:false                 ｜
｜item_status_id      ｜integer    ｜null:false                 ｜
｜delivery_charge_id  ｜integer    ｜null:false                 ｜
｜prefecture_id       ｜integer    ｜null:false                 ｜
｜delivery_days_id    ｜integer    ｜null:false                 ｜
｜price               ｜integer    ｜null:false                 ｜

＃＃＃Association
-belongs_to:user
-has_one:order

##delivery_addressesテーブル
|Column         |Type       |Options                    |
|---------------|-----------|---------------------------|
｜oreder        ｜references｜null:false,foreign_key:true｜
｜postal_code   ｜string    ｜null:false                 ｜
｜prefecture_id ｜integer   ｜null:false                 ｜
｜city          ｜string    ｜null:false                 ｜
｜block         ｜string    ｜null:false                 ｜
｜building      ｜string    ｜                           ｜
｜phonenumber   ｜string    ｜null:false                 ｜

Association
-belongs_to:order

##ordersテーブル
|Column|Type       |Options                    |
|------|-----------|---------------------------|
｜buyer｜references｜null:false,foreign_key:true｜
｜item ｜references｜null:false,foreign_key:true｜

###Association
-belongs_to:user
-belongs_to:item
-has_one:delivery_address

