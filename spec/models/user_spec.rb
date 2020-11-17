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

  end
end
