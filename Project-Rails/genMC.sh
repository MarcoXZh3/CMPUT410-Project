#!/bin/bash

# ==================================== All requied models ====================================
echo -e "\
rails g devise user -f"
rails g devise user -f 1>/dev/null

echo -e "\
rails generate migration add_username_to_users username:string:uniq"
rails generate migration add_username_to_users username:string:uniq 1>/dev/null

echo -e "\
rails g model people user_id:string{20} user_type:string{11} name:string{50} gender:string{6} age:integer \ 
                     phone:string{15} e_mail:string address:string{100} city:string{20} province:string{15} \ 
                     postal_code:string{6} education:string{20} occupation:string{20} 'income:decimal{12,2}' \ 
                     special_skills:text -f"
rails g model people user_id:string{20} user_type:string{11} name:string{50} gender:string{6} age:integer \
                     phone:string{15} e_mail:string address:string{100} city:string{20} province:string{15} \
                     postal_code:string{6} education:string{20} occupation:string{20} 'income:decimal{12,2}' \
                     special_skills:text -f \
1>/dev/null
echo -e "\
rails g model shelter shelter_id:integer name:string{50} shelter_type:string{8} address:string{100} city:string{20} \ 
                      province:string{15} postal_code:string{6} phone:string{15} e_mail:string open_hour:text -f"
rails g model shelter shelter_id:integer name:string{50} shelter_type:string{8} address:string{100} city:string{20} \
                      province:string{15} postal_code:string{6} phone:string{15} e_mail:string open_hour:text -f \
1>/dev/null
echo -e "\
rails g model shelter_staff user:references people:references staff_type:string{11} shelter:references \ 
                            start_date:date accepted:boolean -f"
rails g model shelter_staff user:references people:references staff_type:string{11} shelter:references \
                            start_date:date accepted:boolean -f \
1>/dev/null
echo -e "\
rails g model animal animal_id:string{10} name:string{50} species:string{10} breed:string{50} \ 
                     birthday:date deathday:date gender:string{6} size:string{10} color:string{10} \ 
                     sn:boolean 'price:decimal{7,2}' stage:boolean shelter:references -f"
rails g model animal animal_id:string{10} name:string{50} species:string{10} breed:string{50} \
                     birthday:date deathday:date gender:string{6} size:string{10} color:string{10} \
                     sn:boolean 'price:decimal{7,2}' stage:boolean shelter:references -f \
1>/dev/null
echo -e "\
rails g model animal_file animal:references file_type:string{5} path:string -f"
rails g model animal_file animal:references file_type:string{5} path:string -f 1>/dev/null
echo -e "\
rails g model receipt people:references animal:references received_date:date -f"
rails g model receipt people:references animal:references received_date:date -f 1>/dev/null
echo -e "\
rails g model adoption apply_date:date people:references animal:references \ 
              adoption_date:date accepted:boolean -f"
rails g model adoption apply_date:date people:references animal:references \
              adoption_date:date accepted:boolean -f \
1>/dev/null
echo -e "\
rails g model surrender apply_date:date people:references animal:references \ 
              surrender_date:date accepted:boolean reason:text -f"
rails g model surrender apply_date:date people:references animal:references \
              surrender_date:date accepted:boolean reason:text -f \
1>/dev/null
echo -e "\
rails g model donation apply_date:date people:references donation_type:string{7} content:text \ 
              animal:references donation_date:date accepted:boolean -f"
rails g model donation apply_date:date people:references donation_type:string{7} content:text \
              animal:references donation_date:date accepted:boolean -f \
1>/dev/null

echo -e "rails g controller petshelter -f"
rails g controller petshelter -f 1>/dev/null

