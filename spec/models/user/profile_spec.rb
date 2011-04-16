require 'spec_helper'

describe User::Profile do
  before(:each) do
    @profile = User::Profile.new
    @profile.user = User.new
  end

  context 'when first_name and last_name empty' do
    describe 'fullname' do
      it 'should return nil' do
        @profile.fullname.should be_nil
      end
    end
  end

  context 'when first_name filled, last_name empty' do
    before(:each) do
      @profile.first_name = 'Donald'
    end
    describe 'fullname' do
      it 'should return first_name' do
        @profile.fullname.should eq 'Donald'
      end
    end
  end

  context 'when first_name empty, last_name filled' do
    before(:each) do
      @profile.last_name = 'Duck'
    end
    describe 'fullname' do
      it 'should return last_name' do
        @profile.fullname.should eq 'Duck'
      end
    end
  end

  context 'when first_name and last_name filled and not equal' do
    before(:each) do
      @profile.first_name = 'Donald'
      @profile.last_name = 'Duck'
    end
    describe 'fullname' do
      it 'should return first_name last_name' do
        @profile.fullname.should eq 'Donald Duck'
      end
    end
    describe 'different_names' do
      it 'should not set an error' do
        @profile.different_names
        @profile.errors.should be_empty
      end
    end
  end

  context 'when first_name and last_name filled and not equal' do
    before(:each) do
      @profile.first_name = 'D'
      @profile.last_name = 'D'
    end
    describe 'different_names' do
      it 'should set an error' do
        @profile.different_names
        @profile.errors.should_not be_empty
      end
    end
  end
end
