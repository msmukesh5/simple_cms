class SectionEdit < ActiveRecord::Base
	belongs_to :editor, :class_name => "AdminUser", :forigen_key => "admin_user_id"
	belongs_to :section
end
