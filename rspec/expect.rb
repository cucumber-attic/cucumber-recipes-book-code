class Book
  def pleases?(people)
    people == 'developers'
  end
end

RSpec::Matchers.define :please do |people|
  match do |book|
    book.pleases?(people)
  end
end

class SomeObject
  def has_flair?
    true
  end

  def festive?
    true
  end
end

describe 'rspec-expectations' do
  let(:some_object) { SomeObject.new }
  let(:this_book)   { Book.new       }

  it 'allows expectations with #should' do
    # START:basic
    expect(2 + 2).to == 4
    # END:basic

    # START:common
    expect(2 + 2).not_to == 5
    expect(2 + 2).to be > 3

    expect('hello').to =~ /ell/
    expect(some_object).to be_festive

    expect {
      SomeNonExistentClass.new
    }.to raise_error(NameError)

    expect(this_book).to please('developers')
    # END:common
  end
end
