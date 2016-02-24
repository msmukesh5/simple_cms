class AdminUser < ActiveRecord::Base
	has_many :section_edits
	has_many :sections, :through => :section_edits
	has_and_belongs_to_many :pages


end
