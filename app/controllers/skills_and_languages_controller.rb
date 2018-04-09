class SkillsAndLanguagesController < ApplicationController

	def save_new_skill
    skill = Skill.find_or_create_by(title: params[:skill_title])
		render json: skill.id
	end

	def save_new_language
    language = Language.find_or_create_by(title: params[:language_name])
		render json:  language.id
	end

end
