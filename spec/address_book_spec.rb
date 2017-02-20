require_relative '../models/address_book.rb'

RSpec.describe AddressBook do
  describe "attributes" do
    it "responds to" do
      book = AddressBook.new
      expect(book).to respond_to(:entries)
    end
    it "initializes entries as an array" do
      book = AddressBook.new
      expect(book.entries).to be_an(Array)
    end
    it "initializes entries as empty" do
      book = AddressBook.new
      expect(book.entries.size).to eq(0)
    end
  end
  describe "#add_entry" do
    it "adds only one entry to the address book" do
      book = AddressBook.new
      book.add_entry("Jochen", "04123456", "my.mail@mail.com")
      new_entry = book.entries[0]
      expect(new_entry.name).to eq("Jochen")
      expect(new_entry.phone_number).to eq("04123456")
      expect(new_entry.email).to eq("my.mail@mail.com")
    end
  end
  describe "#remove_entry" do
    it "confirms a single entry has been removed" do
      book = AddressBook.new
      book.add_entry("Jochen", "04123456", "my.mail@mail.com")
      book.add_entry("Lynn", "047891011", "her.mail@mail.com")
      expect(book.entries.size).to eq(2)

      book.remove_entry("Lynn", "047891011", "her.mail@mail.com")
      expect(book.entries.size).to eq(1)
      expect(book.entries[0].name).to eq("Jochen")
    end
  end
end
