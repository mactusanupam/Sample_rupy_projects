# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless UserType.any?
  UserType.create([
    {title: 'Super Admin'},
    {title: 'Admin'},
    {title: 'Recruiter'},
    {title: 'Other User'}
  ])
end

unless User.any?
  User.create([
    {
      email: 'superadmin@talentfore.com', password: 'T@l3ntf0re',
      user_type: UserType.find_by_title('Super Admin'), first_name: 'Super', last_name: 'Admin'
    },
    {
      email: 'admin@talentfore.com', password: 'T@l3ntf0re',
      user_type: UserType.find_by_title('Admin'), first_name: 'Admin', last_name: 'Admin'
    },
    {
      email: 'recruiter@talentfore.com', password: 'T@l3ntf0re',
      user_type: UserType.find_by_title('Recruiter'), first_name: 'Test', last_name: 'Recruiter'
    },
    {
      email: 'others@talentfore.com', password: 'T@l3ntf0re',
      user_type: UserType.find_by_title('Other User'), first_name: 'Test', last_name: 'others'
    }
  ])
end

unless Company.any?
  Company.create([
    { name: 'Salesworld', website: 'https://www.salesworld.net' },
    { name: 'TalentFore', website: 'https://www.talentfore.com' },
    { name: 'Rajesh Shethia Consultancy', website: 'https://rajeshshethia.com/' }
  ])
end

unless Industry.any?
  Industry.create([
    {name: 'Advertising / PR / MR / Event Management'},
    {name: 'Automobile / Auto Anciliary / Auto Components'},
    {name: 'Banking / Financial Services / Broking'},
    {name: 'BPO / Call Centre / ITES'},
    {name: 'Chemicals / PetroChemical'},
    {name: 'Construction / Engineering / Cement / Metals'},
    {name: 'Consumer Electronics / Appliances / Durables'},
    {name: 'Education / Teaching / Training'},
    {name: 'FMCG / Foods / Beverage'},
    {name: 'Industrial Products'},
    {name: 'Insurance'},
    {name: 'Internet / Ecommerce'},
    {name: 'IT-Software / Software Services'},
    {name: 'Media / Entertainment / Internet'},
    {name: 'Medical / Healthcare / Hospitals'},
    {name: 'Oil and Gas / Energy / Power / Infrastructure'},
    {name: 'Pharma / Biotech / Clinical Research'},
    {name: 'Real Estate'},
    {name: 'Retail / Wholesale'},
    {name: 'Strategy / Management Consulting Firms'},
    {name: 'Telcom / ISP'},
    {name: 'Travel / Hotels / Restaurants / Airlines'}
  ])
end


unless Skill.any?
  Skill.create([
    {title: 'Html'},
    {title: 'Php'},
    {title: 'Management'},
    {title: 'Sales'},
    {title: 'Account'}
  ])
end

unless Language.any?
  Language.create([
    {title: 'English'},
    {title: 'Hindi'}
  ])
end

unless Qualification.any?
  Qualification.create([
    {title: 'Undergraduate'},
    {title: 'Postgraduate'},
    {title: 'Senior Secondary'},
    {title: 'Diploma'},
    {title: 'Secondary'}
  ])
end

unless Degree.any?
  Degree.create([
    {title: 'B.E/B.Tech'},
    {title: 'MBA'},
    {title: 'B.A.'},
    {title: 'B.Sc.'},
    {title: 'B.Com.'},
    {title: '10+2 science'},
    {title: '10+2 arts'},
    {title: '10+2 commerce'},
    {title: 'M.E/M.Tech'},
    {title: 'M.A.'},
    {title: 'M.Sc.'},
    {title: 'M.Com.'}
  ])
end

unless Specialization.any?
  Specialization.create([
    {title: 'Aggriculture'},
    {title: 'Science'},
    {title: 'Mathematics'},
    {title: 'Finance'},
    {title: 'Marketing'},
    {title: 'Human Resource Management'},
    {title: 'International Business'},
    {title: 'Operation Management'},
    {title: 'Agri Business Management'},
    {title: 'Healthcare Management'},
    {title: 'Rural Management'},
    {title: 'Supply Chain Management'},
    {title: 'Information Technology'},
    {title: 'Computer Science & Engineering'},
    {title: 'Electronics & Communcation Engineering'},
    {title: 'Civil Engineering'},
    {title: 'Biotechnology'},
    {title: 'Mechanical Engineering'},
    {title: 'Chemical Engineering'}
  ])
end

Template.find_or_create_by(name: 'template1').update_attributes({template_type: ''})
Template.find_or_create_by(name: 'template2').update_attributes({template_type: ''})
Template.find_or_create_by(name: 'template3').update_attributes({template_type: ''})
Template.find_or_create_by(name: 'template4').update_attributes({template_type: 'photo'})
Template.find_or_create_by(name: 'template5').update_attributes({template_type: 'photo'})
Template.find_or_create_by(name: 'template6').update_attributes({template_type: ''})
Template.find_or_create_by(name: 'template7').update_attributes({template_type: 'photo'})
Template.find_or_create_by(name: 'template8').update_attributes({template_type: 'photo'})

unless JobTitle.any?
  JobTitle.create([
    {title: 'Software Engineer'},
    {title: 'Senior Software Engineer'},
    {title: 'Technical Manager'},
    {title: 'Program Manager'},
    {title: 'Associate Director'},
    {title: 'Senior Director'},
    {title: 'Sales Manager'},
    {title: 'Area Manager'},
    {title: 'Marketing Manager'},
    {title: 'Marketing Intern'},
    {title: 'Associate Marketing'},
    {title: 'Associate Sales'}
  ])
end

# unless InputType.any?
#   InputType.create(input_type_name: 'radio-dials')
# end

# unless OptionGroup.any?
#   OptionGroup.create([
#     { option_group_name: 'Agree/Disagree Positive' },
#     { option_group_name: 'Agree/Disagree Negative' },
#     { option_group_name: 'Yes/No Positive' },
#     { option_group_name: 'Yes/No Negative' },
#   ])
# end

# unless OptionChoice.any?
#   ['Agree/Disagree Positive', 'Agree/Disagree Negative'].each do |option_group_name|
#     op = OptionGroup.find_by(option_group_name: option_group_name)
#     if option_group_name == 'Agree/Disagree Negative'
#       [
#         'Strongly Agree',
#         'Agree',
#         'Neither Agree Nor Disagree',
#         'Disagree',
#         'Strongly Disagree'
#       ].each_with_index.map{|a, i| OptionChoice.create(option_choice_name: a, option_group_id: op.id, weightage: i+1)}
#     else
#       [
#         'Strongly Agree',
#         'Agree',
#         'Neither Agree Nor Disagree',
#         'Disagree',
#         'Strongly Disagree'
#       ].reverse.each_with_index.map{|a, i| OptionChoice.create(option_choice_name: a, option_group_id: op.id, weightage: i+1)}
#     end
#   end
#   ['Yes/No Positive', 'Yes/No Negative'].each do |option_group_name|
#     op = OptionGroup.find_by(option_group_name: option_group_name)

#     if option_group_name == 'Yes/No Negative'
#       ['Yes', 'No'].map{|a| OptionChoice.create(option_choice_name: a, option_group_id: op.id, weightage: a == 'Yes' ? 0 : 5)}
#     else
#       ['Yes', 'No'].map{|a| OptionChoice.create(option_choice_name: a, option_group_id: op.id, weightage: a == 'Yes' ? 5 : 0)}
#     end
#   end
# end
