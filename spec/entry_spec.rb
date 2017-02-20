require_relative '../models/entry'

RSpec.describe Entry do
  describe "attributes" do
    let(:entry) {Entry.new("Jochen", "04123456","my.mail@mail.com")}
    it "responds to name" do
      expect(entry).to respond_to(:name)
    end
    it "reports its name" do
      expect(entry.name).to eq("Jochen")
    end
    it "responds to phone number" do
      expect(entry).to respond_to(:phone_number)
    end
    it "reports its phone number" do
      expect(entry.phone_number).to eq("04123456")
    end
    it "responds to email" do
      expect(entry).to respond_to(:email)
    end
    it "reports its email" do
      expect(entry.email).to eq("my.mail@mail.com")
    end
  end
  describe "#to_s" do
    it "prints entry as a string" do
      entry = Entry.new("Jochen", "04123456","my.mail@mail.com")
      expected_string = "Name: Jochen\nPhone Number: 04123456\nEmail: my.mail@mail.com"
      expect(entry.to_s).to eq(expected_string)
    end
  end
end
