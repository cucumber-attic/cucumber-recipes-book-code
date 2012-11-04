# START:custom_matcher
RSpec::Matchers.define :please do |people|
  match do |book|
    book.pleases?(people)
  end
end
# END:custom_matcher

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
    (2 + 2).should == 4
    # END:basic

    # START:common
    (2 + 2).should != 4
    (2 + 2).should_not == 4

    (2 + 2).should be > 3
    (2 + 2).should be <= 5

    Math.sqrt(2).should be_within(0.001).of(1.414)

    'hello'.should start_with('hel')
    'hello'.should =~ /ell/

    [1, 2, 3].should include(2)
    {:a => 1, :b => 2}.should have_key(:a)
    # END:common

    # START:is_has
    # assuming some_object supports a has_flair?() method
    some_object.should have_flair

    # assuming some_object supports a festive?() method
    some_object.should be_festive
    # END:is_has

    # START:exceptions
    lambda {
      SomeNonExistentClass.new
    }.should raise_error(NameError)
    # END:exceptions

    # START:custom_use
    this_book.should please('developers')
    # END:custom_use
  end
end

# START:custom_use

class Book
  def pleases?(people)
    people == 'developers'
  end
end
# END:custom_use
