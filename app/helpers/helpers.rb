def create_edit_key
  Faker::Base.regexify(/[a-zA-Z0-9]{12}/)
end
