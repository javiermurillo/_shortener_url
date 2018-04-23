require 'rails_helper'
require "open-uri"


describe Url do
  it { is_expected.to have_db_column(:link).of_type(:string) }
  it { is_expected.to have_db_column(:short).of_type(:string) }

  describe '#to_s' do
    subject { create(:url) }
    it { expect(subject.to_s).to eq subject.link }
  end

  describe 'length shorten url length is 4' do 
    subject { create(:url) }
    it { expect(subject.short.length).to be(4)  }
  end

  describe 'length shorten url length is 4' do 
    subject { create(:url) }
    it { expect(subject.short.length).to be(4)  }
  end


  describe 'http' do

    it "does not allowed to shorten url without http://" do
      badurl = build(:url, link: "hola.info.com")
      expect(badurl).to be_invalid
    end

    it "does not allowed to shorten url without complete URL" do
      badurl = build(:url, link: "http://")
      expect(badurl).to be_invalid
    end

    it "allow to shorten url with propertly url" do
      badurl = build(:url, link: "http://google.com")
      expect(badurl).to be_valid
    end

  end
end
