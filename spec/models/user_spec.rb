require 'rails_helper'

RSpec.describe User, type: :model do
  subject {described_class.new(name: 'name', email: 'email@hotmail.com', 
    password: 'password', password_confirmation: 'password')}
  
  describe 'associations' do 
    it {should have_many(:orders).class_name('Order')}
    it {should have_many(:purchases).class_name('Order')}
  end

  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_length_of(:name)}
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
    it {should validate_presence_of(:password_digest)}
    it {should validate_confirmation_of(:password)}

    describe 'validate email regex' do
      subject {User.create(name: 'victor', email: 'email', password: 'victor', 
        password_confirmation: 'victor')}
      it 'does not save if invalid' do
        expect(subject.valid?).to be_falsy
        errors = subject.errors.full_messages
        expect(errors).to eq(['Email Invalid'])
        
      end

      it 'should save record when valid' do
        subject.email = 'victor@gmaill.com'
        expect(subject.valid?).to be_truthy
      end
    end
  end
end
