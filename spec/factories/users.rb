FactoryBot.define do
  
  factory :user do
    first_name             {"山田"}
    last_name              {"太郎"}
    first_name_kana        {"ヤマダ"}
    last_name_kana         {"タロウ"}
    email                  {"test@gmai.com"}
    password               {"pass12"}
    password_confirmation  {"pass12"}
    nickname               {"furima"}
    birthday               {"1999-01-01"}
  end
end