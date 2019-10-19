class User < ApplicationRecord

  has_one :profile_picture

  devise :omniauthable, omniauth_providers: [:google_oauth2, :facebook, :twitter]
  devise :database_authenticatable, :registerable, :confirmable, :recoverable, :rememberable, :validatable , stretches: 13
  mount_uploader :profile_picture, ProfilePictureUploader
  
  validates :name, :email, :password, presence: true #:phone, :date_of_birth, :accepted_tos, presence: true
  # validates :accepted_tos, inclusion: {in: ["1", 1, true, "true"]}
  validates :email , uniqueness: true
  validates :phone , uniqueness: true
  #validates :gender, inclusion: {in: %w("m", "f")}
  has_one :image, as: :image_profile

  def self.from_omniauth_google(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # user to be created if they don't exist
    unless user
      user = User.create(name: data['name'], email: data['email'], password: Devise.friendly_token[0,20])
    end
    user
  end

  def self.from_omniauth_facebook(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.skip_confirmation!
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

end
