class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :omniauthable, omniauth_providers: %i[facebook]
  devise :database_authenticatable, :registerable, :confirmable, :recoverable, :rememberable, :validatable , stretches: 13

  #disabled facebook omniauth for admins
  # def self.from_omniauth(auth)
  #   where(provider: auth.provider, uid: auth.uid).first_or_create do |admin|
  #     admin.email = auth.info.email
  #     admin.password = Devise.friendly_token[0, 20]
  #     admin.skip_confirmation!
  #   end
  # end

  # def self.new_with_session(params, session)
  #   super.tap do |admin|
  #     if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
  #       admin.email = data["email"] if admin.email.blank?
  #     end
  #   end
  # end
end
