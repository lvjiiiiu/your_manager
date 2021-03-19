
require 'rails_helper'

RSpec.describe "Contactのモデルテスト", type: :model do
  describe "Validationのテスト" do
    let(:contact) { build(:contact) }
    context "nameカラム" do
      it "空欄でないこと" do
        contact.name = " "
        expect(contact.valid?).to eq false;
      end 
    end
    context "messageカラム" do
      it "空欄でないこと" do
        contact.message = " "
        expect(contact.valid?).to eq false;
      end 
    end
  end 
end
