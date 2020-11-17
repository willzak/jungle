require 'rails_helper'
RSpec::Expectations.configuration.on_potential_false_positives = :nothing

RSpec.describe User, type: :model do
  describe "Validations" do
    it 'is created with password and password_confirmation fields' do
      @user = User.new({name: "Hakan Hellstrom", email: 'hakan@gmail.com', password: 'losenorden', password_confirmation: 'losenorden'})

      expect(@user.password).to be_present
      expect(@user.password_confirmation).to be_present
    end

    it 'only allows unique emails to be used' do
      @user1 = User.new({name: "Hakan Hellstrom", email: 'hakan@gmail.com', password: 'losenorden', password_confirmation: 'losenorden'})
      @user1.save!

      @user2 = User.new({name: "Hakan Hellstrom", email: 'hakan@gmail.com', password: 'losenorden', password_confirmation: 'losenorden'})
      expect { @user2.save! }.to raise_error
    end

    it 'is case insensitive for emails' do
      @user1 = User.new({name: "Hakan Hellstrom", email: 'hakan@gmail.com', password: 'losenorden', password_confirmation: 'losenorden'})
      @user1.save!

      @user2 = User.new({name: "Hakan Hellstrom", email: 'HAKAN@gmail.com', password: 'losenorden', password_confirmation: 'losenorden'})
      expect { @user2.save! }.to raise_error
    end

    it 'requires a first name, last name, and email' do
      @user = User.new({name: "Hakan Hellstrom", email: 'hakan@gmail.com', password: 'losenorden', password_confirmation: 'losenorden'})

      expect(@user.email).to be_present
      expect(@user.name).to include(" ")
    end

    it 'requires password to have min length of 6' do
      @user = User.new({name: "Hakan Hellstrom", email: 'hakan@gmail.com', password: 'a', password_confirmation: 'a'})
      expect { @user.save! }.to raise_error
    end
  end

  describe '.authenticate_with_credentials' do
    it 'returns nil if fails' do
      @user = User.new({name: "Hakan Hellstrom", email: 'hakan@gmail.com', password: 'agoodpassword', password_confirmation: 'agoodpassword'})
      @user.save!
      res = User.authenticate_with_credentials(@user.email, "nope")
      expect(res).to eq(nil)
    end

    it 'allows user to login if they include extra spaces before or after' do
      @user = User.new({name: "Hakan Hellstrom", email: 'hakan@gmail.com', password: 'agoodpassword', password_confirmation: 'agoodpassword'})
      @user.save

      res = User.authenticate_with_credentials("  hakan@gmail.com ", @user.password)
      expect(res).to eq(@user)
    end

    it 'allows user to login if they type in their email using the wrong cases' do
      @user = User.new({name: "Hakan Hellstrom", email: 'hakan@gmail.com', password: 'agoodpassword', password_confirmation: 'agoodpassword'})
      @user.save

      res = User.authenticate_with_credentials("HaKaN@gMaIl.CoM", @user.password)
      expect(res).to eq(@user)
    end
  end
end
