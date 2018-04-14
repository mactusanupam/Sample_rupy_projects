class SkillsAndLanguagesController < ApplicationController
  %w(skill language degree specialization).each do |method_name|
    define_method :"save_new_#{method_name}" do
      item = method_name.camelcase.constantize.find_or_create_by(title: params[:title])
      render json: item.id
    end
  end
end
