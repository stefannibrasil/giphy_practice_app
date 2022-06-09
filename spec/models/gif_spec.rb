require 'rails_helper'

RSpec.describe Gif, type: :model do
  subject = FactoryBot.build(:gif)

  describe "associations" do
    it { should have_one_attached(:image) }
  end

  describe "image validations" do
    context "with a GIF format that is less than 1 MB" do
      it { expect(subject).to be_valid }
    end

    context "with a format that is not GIF" do
      it "is invalid" do
        gif = FactoryBot.build(:gif, :with_jpg_image)
        gif.validate
        expect(gif.errors[:image]).to include("must be a GIF")
      end
    end

    context "with a size that is bigger than 1 MB" do
      it "is invalid" do
        gif = FactoryBot.build(:gif, :with_big_image)
        gif.validate
        expect(gif.errors[:image]).to include("is too big")
      end
    end
  end
end
