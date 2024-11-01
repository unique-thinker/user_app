require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  # Validations
  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(user).to be_valid
    end

    it 'is not valid without a first_name' do
      user.first_name = nil
      expect(user).not_to be_valid
      expect(user.errors[:first_name]).to include('can\'t be blank')
    end

    it 'is valid with empty value' do
      user.last_name = ''
      expect(user).to be_valid
    end

    it 'is not valid without an email' do
      user.email = nil
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include('can\'t be blank')
    end

    it 'is not valid with an invalid email format' do
      user.email = 'invalid_email'
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include('is invalid')
    end

    it 'is not valid without a gender' do
      user.gender = nil
      expect(user).not_to be_valid
      expect(user.errors[:gender]).to include('can\'t be blank')
    end

    it 'is not valid without a country_code' do
      user.country_code = nil
      expect(user).not_to be_valid
      expect(user.errors[:country_code]).to include('can\'t be blank')
    end

    it 'is not valid without a phone_number' do
      user.phone_number = nil
      expect(user).not_to be_valid
      expect(user.errors[:phone_number]).to include('can\'t be blank')
    end

    it 'is not valid with a phone_number longer than 15 digits' do
      user.phone_number = ('1'*16).to_i
      expect(user).not_to be_valid
      expect(user.errors[:phone_number]).to include('is too long (maximum is 15 characters)')
    end

    it 'is not valid with a first_name longer than 80 characters' do
      user.first_name = 'a' * 81
      expect(user).not_to be_valid
      expect(user.errors[:first_name]).to include('is too long (maximum is 80 characters)')
    end

    it 'is not valid with a country_code longer than 5 characters' do
      user.country_code = '+12345'
      expect(user).not_to be_valid
      expect(user.errors[:country_code]).to include('is too long (maximum is 5 characters)')
    end
  end

  # Enum
  describe 'Enums' do
    it 'defines gender as a string enum' do
      expect(User.genders.keys).to contain_exactly('male', 'female', 'other')
    end

    it 'allows valid gender values' do
      user.gender = 'male'
      expect(user).to be_valid

      user.gender = 'female'
      expect(user).to be_valid

      user.gender = 'other'
      expect(user).to be_valid
    end

    it 'does not allow invalid gender values' do
      expect { user.gender = 'invalid' }.to raise_error(ArgumentError)
    end
  end

end
