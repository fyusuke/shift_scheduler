class User < ActiveRecord::Base
  authenticates_with_sorcery!
  
  has_many :user_work_relationships, dependent:   :destroy
  has_many :works, through: :user_work_relationships
  has_many :workers, dependent: :destroy
  belongs_to :lines, dependent:   :destroy

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, confirmation: true, length: { minimum: 6 }
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

  private

    # メールアドレスをすべて小文字にする
    def downcase_email
      self.email = email.downcase
    end

end
