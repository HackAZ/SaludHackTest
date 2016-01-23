class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_save :change_insurance

  geocoded_by :address
  after_validation :geocode

  INSURANCE_NAMES = {
    "A1098" => "USAA",
    "B3567" => "AHCCCS",
    "C9872" => "UNITED HEALTH",
    "D3804" => "Medicaid",
    "E2316" => "Medicare",
    "F4682" => "APIPA"
  }

  def change_insurance
    INSURANCE_NAMES.each do |key, value|
      if self.insurance == key
        self.update_attribute(:insurance, INSURANCE_NAMES[key])
      end
    end
  end

end
