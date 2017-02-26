class User < ActiveRecord::Base
  authenticates_with_sorcery!
  
  has_many :works, through: :workers
  has_many :workers, dependent: :destroy
  belongs_to :lines, dependent:   :destroy

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, allow_blank: false, if: :can_change_password?
  validates :password, length: { minimum: 6 }, if: :can_change_password?
  validates :password, confirmation: true, if: :can_change_password?
  validates :password_confirmation, presence: true, if: :can_change_password?


  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name,  presence: true, length: { maximum: 50 }
  validates :phone,  presence: true, length: { minimum: 9, maximum: 11 },
                    uniqueness: true

  before_save   :downcase_email
  # fix sorcery so that we can activate without a password
  before_create :setup_activation
  after_create :send_activation_needed_email!

  def external?
    false
  end

  def can_change_password?
    new_record? || changes[:crypted_password]
  end

  private

    # メールアドレスをすべて小文字にする
    def downcase_email
      self.email = email.downcase
    end

end
