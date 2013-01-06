# encoding: UTF-8
class User < ActiveRecord::Base
  has_one :profile, :dependent => :destroy
  has_one :target, :dependent => :destroy
  has_many :pesees, :dependent => :destroy
  has_many :repas, :dependent => :destroy
  has_many :activites, :dependent => :destroy
 
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :admin
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :profile_attributes, :provider, :uid
  # attr_accessible :title, :body
  accepts_nested_attributes_for :profile, :pesees, :repas

  def poids
    @poids = 0
    @poids = pesees.last.what unless pesees.last.nil?
    @poids
  end

  def age
    age=0
    unless profile.nil? || profile.birthday.nil?
      age = Date.today.year - profile.birthday.year
      age -= 1 if Date.today < profile.birthday + age.years #for days before birthday
    end
    age
  end
  
  def image
     if profile.nil? 
      return "img_hom.jpg"
     end
     if profile.image_url.nil?
        if profile.female?
          return "img_fem.jpg"
        else
          return "img_hom.jpg"
        end
     else
      profile.image_url
     end
  end

  def taille
      @taille = 0
      @taille = profile.taille unless profile.nil?
      @taille
  end

   def self.set_profile(user,auth)
    @profile = user.profile || user.build_profile
    @profile.image_url = auth.info.image unless auth.info.image.nil?
    @profile.gender = auth.info.gender unless auth.info.gender.nil?
    @profile.birthday = auth.extra.raw_info.birthday unless auth.extra.raw_info.birthday.nil?
    @profile.save

  end

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(name:auth.extra.raw_info.name ,
                         provider:auth.provider,
                         uid:auth.uid,
                         email:auth.info.email,
                         password:Devise.friendly_token[0,20]
                         )
      
      
    end
    set_profile(user,auth)
    user
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

end
