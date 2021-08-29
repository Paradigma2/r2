# == Schema Information
#
# Table name: users
#
#  id                 :bigint           not null, primary key
#  email              :string           default(""), not null
#  encrypted_password :string           default(""), not null
#  full_name          :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { create(:user) }

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end

  it 'is not valid without name' do
    user.full_name = nil
    expect(user).to_not be_valid
  end

  it 'is not valid without email' do
    user.email = nil
    expect(user).to_not be_valid
  end

  it 'is not valid without a valid email' do
    user.email = 'qwerty'
    expect(user).to_not be_valid
  end
end
