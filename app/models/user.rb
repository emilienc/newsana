class User < ActiveRecord::Base
  has_one :profile, :dependent => :destroy
  has_many :pesees, :dependent => :destroy
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :profile_attributes, :provider, :uid
  # attr_accessible :title, :body
  accepts_nested_attributes_for :profile, :pesees

  def image
    if profile.nil?
      nil
    else
      profile.image_url
    end
  end

  def taille
    if profile.nil?
      0
    else
      profile.taille
    end
  end

   def self.set_profile(user,auth)
    if user.profile.nil?
      @profile = user.build_profile
    else
      @profile = user.profile
    end
    #@profile.name = auth.extra.raw_info.name
    @profile.image_url = auth.info.image
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

  #def profile
  #  super || build_profile
  #end



end
