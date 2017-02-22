require_relative '../models/address_book.rb'

RSpec.describe AddressBook do
  let(:book){AddressBook.new}
  def check_entry(entry, expected_name, expected_number, expected_email)
    expect(entry.name).to eq expected_name
    expect(entry.phone_number).to eq expected_number
    expect(entry.email).to eq expected_email
  end
  describe "attributes" do
    it "responds to entries" do
      expect(book).to respond_to(:entries)
    end
    it "initializes entries as an array" do
      expect(book.entries).to be_an(Array)
    end
    it "initializes entries as empty" do
      expect(book.entries.size).to eq(0)
    end
  end
  describe "#add_entry" do
    it "adds only one entry to the address book" do
      book.add_entry("Jochen", "04123456", "my.mail@mail.com")
      expect(book.entries.size).to eq(1)
    end
    it "adds the correct information to entries" do
      book.add_entry("Jochen", "04123456", "my.mail@mail.com")
      new_entry = book.entries[0]
      expect(new_entry.name).to eq("Jochen")
      expect(new_entry.phone_number).to eq("04123456")
      expect(new_entry.email).to eq("my.mail@mail.com")
    end
  end
  describe "#import_from_csv" do
    it "imports the correct number of entries" do
      book.import_from_csv("entries.csv")
      book_size = book.entries.size
      expect(book_size).to eq(5)
    end
    it "imports the 1st entry" do
      book.import_from_csv("entries.csv")
      entry_one = book.entries[0]
      check_entry(entry_one, "Jochen", "04123456", "my.mail@mail.com")
    end
    it "imports the 2nd entry" do
       book.import_from_csv("entries.csv")
       # Check the second entry
       entry_two = book.entries[1]
       check_entry(entry_two, "Bob", "555-555-5415", "bob@blocmail.com")
     end
     it "imports the 3rd entry" do
       book.import_from_csv("entries.csv")
       # Check the third entry
       entry_three = book.entries[2]
       check_entry(entry_three, "Joe", "555-555-3660", "joe@blocmail.com")
     end
     it "imports the 4th entry" do
       book.import_from_csv("entries.csv")
       # Check the fourth entry
       entry_four = book.entries[3]
       check_entry(entry_four, "Sally", "555-555-4646", "sally@blocmail.com")
     end
     it "imports the 5th entry" do
       book.import_from_csv("entries.csv")
       # Check the fifth entry
       entry_five = book.entries[4]
       check_entry(entry_five, "Sussie", "555-555-2036", "sussie@blocmail.com")
     end
     it "imports the correct number of entries from entries_2.csv" do
       book.import_from_csv("entries_2.csv")
       book_size = book.entries.size
       expect(book_size).to eq(3)
     end
     it "imports the 1st entry from entries_2" do
       book.import_from_csv("entries_2.csv")
       entry_one = book.entries[0]
       check_entry(entry_one, "Alice", "04123456", "my.mail@mail.com")
     end
     it "imports the 2nd entry from entries_2" do
        book.import_from_csv("entries_2.csv")
        # Check the second entry
        entry_two = book.entries[1]
        check_entry(entry_two, "Benny", "555-555-5415", "alice@blocmail.com")
     end
     it "imports the 3rd entry from entries_2" do
        book.import_from_csv("entries_2.csv")
        # Check the third entry
        entry_three = book.entries[2]
        check_entry(entry_three, "Crixus", "555-555-3660", "crixus@blocmail.com")
    end
  end
end
