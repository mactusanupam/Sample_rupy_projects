class SkillsAndLanguagesController < ApplicationController
  %w(degree skill language  specialization job_title).each do |method_name|
    define_method :"save_new_#{method_name}" do
      item = method_name.camelcase.constantize.find_or_create_by(title: params[:title])
      render json: item.id
       Rails.logger.debug "#################{params[:title].inspect}" 
    end
  end
end
